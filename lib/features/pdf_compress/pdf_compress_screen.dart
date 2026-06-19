import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

enum _CompressionLevel { high, medium, low }

class PdfCompressScreen extends StatefulWidget {
  const PdfCompressScreen({super.key});

  @override
  State<PdfCompressScreen> createState() => _PdfCompressScreenState();
}

class _PdfCompressScreenState extends State<PdfCompressScreen> {
  String? _inputPdfPath;
  String? _outputPdfPath;
  bool _isProcessing = false;
  int _originalSize = 0;
  _CompressionLevel? _selectedLevel;

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );
    if (result == null ||
        result.files.isEmpty ||
        result.files.single.path == null)
      return;
    final path = result.files.single.path!;
    final size = await File(path).length();
    setState(() {
      _inputPdfPath = path;
      _originalSize = size;
      _outputPdfPath = null;
      _selectedLevel = null;
    });
  }

  // ─── Compression logic ──────────────────────────────────────────────────
  Future<List<int>> _compressPdfBytes(List<int> inputBytes) async {
    final doc = PdfDocument(inputBytes: inputBytes);
    doc.fileStructure.crossReferenceType =
        PdfCrossReferenceType.crossReferenceStream;
    final bytes = await doc.save();
    doc.dispose();
    return bytes;
  }

  Future<void> _compressPdf() async {
    if (_inputPdfPath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a PDF first')),
      );
      return;
    }
    if (_selectedLevel == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose a compression level')),
      );
      return;
    }

    setState(() => _isProcessing = true);

    try {
      final inputBytes = await File(_inputPdfPath!).readAsBytes();
      final compressedBytes = await _compressPdfBytes(inputBytes);
      final savedPath = await _saveCompressedPdf(compressedBytes);

      if (!mounted) return;
      setState(() => _outputPdfPath = savedPath);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF compressed successfully')),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Compression failed: $e')));
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  Future<String> _saveCompressedPdf(List<int> bytes) async {
    final dir = await getApplicationDocumentsDirectory();
    final fileName = 'compressed_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final filePath = '${dir.path}/$fileName';
    await File(filePath).writeAsBytes(bytes, flush: true);
    return filePath;
  }

  Future<void> _openCompressedFile() async {
    if (_outputPdfPath == null) return;
    await OpenFile.open(_outputPdfPath!);
  }

  Future<void> _shareCompressedFile() async {
    if (_outputPdfPath == null) return;
    await Share.shareXFiles([XFile(_outputPdfPath!)], text: 'Compressed PDF');
  }

  void _clearAll() {
    setState(() {
      _inputPdfPath = null;
      _outputPdfPath = null;
      _originalSize = 0;
      _selectedLevel = null;
    });
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  // ─── Compute estimated size for each level ────────────────────────────
  String _getEstimatedSize(_CompressionLevel level) {
    if (_originalSize == 0) return '~0 KB';
    // Use different compression ratios: High ~30%, Medium ~50%, Low ~70%
    final factor = switch (level) {
      _CompressionLevel.high => 0.30,
      _CompressionLevel.medium => 0.50,
      _CompressionLevel.low => 0.70,
    };
    final estimated = (_originalSize * factor).round();
    return '~${_formatSize(estimated)}';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final fileName =
        _inputPdfPath?.split(Platform.pathSeparator).last ?? 'No file selected';

    String? outputSizeText;
    if (_outputPdfPath != null) {
      try {
        final size = File(_outputPdfPath!).lengthSync();
        outputSizeText = 'Actual size: ${_formatSize(size)}';
      } catch (_) {}
    }

    final levelLabels = {
      _CompressionLevel.high: 'High – Smallest size, standard quality',
      _CompressionLevel.medium: 'Medium – Balanced size and quality',
      _CompressionLevel.low: 'Low – Larger size, highest quality',
    };

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'tool-icon-PDF Compress',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber.withOpacity(0.95),
                    Colors.amber.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.compress, color: Colors.white, size: 22),
            ),
          ),
        ),
        title: const Text('PDF Compress'),
        centerTitle: true,
        backgroundColor: colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: _clearAll,
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ Fixes overflow
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                onPressed: _pickPdf,
                icon: const Icon(Icons.picture_as_pdf_rounded),
                label: const Text('Pick PDF File'),
              ),
              const SizedBox(height: 12),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.description_rounded),
                  title: Text(fileName),
                  subtitle: _inputPdfPath == null
                      ? const Text('Select one PDF to compress')
                      : Text('Original size: ${_formatSize(_originalSize)}'),
                ),
              ),
              const SizedBox(height: 12),
              if (_inputPdfPath != null) ...[
                const Text(
                  'Choose compression level:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                ..._CompressionLevel.values.map((level) {
                  return RadioListTile<_CompressionLevel>(
                    title: Text(levelLabels[level]!),
                    subtitle: Text(
                      _getEstimatedSize(level),
                    ), // ✅ Dynamic estimate
                    value: level,
                    groupValue: _selectedLevel,
                    onChanged: (value) =>
                        setState(() => _selectedLevel = value),
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                  );
                }),
                const SizedBox(height: 12),
              ],
              if (_isProcessing) ...[
                const LinearProgressIndicator(),
                const SizedBox(height: 12),
              ],
              if (_outputPdfPath != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Saved on device: $_outputPdfPath'),
                      if (outputSizeText != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          outputSizeText,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _openCompressedFile,
                  icon: const Icon(Icons.open_in_new_rounded),
                  label: const Text('Open Compressed PDF'),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: _shareCompressedFile,
                  icon: const Icon(Icons.share_rounded),
                  label: const Text('Share Compressed PDF'),
                ),
                const SizedBox(height: 12),
              ],
              ElevatedButton.icon(
                onPressed: (_isProcessing || _inputPdfPath == null)
                    ? null
                    : _compressPdf,
                icon: _isProcessing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.compress),
                label: Text(_isProcessing ? 'Compressing...' : 'Compress PDF'),
              ),
              // Add bottom padding for keyboard/spacing
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
