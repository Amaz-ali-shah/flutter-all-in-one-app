import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ImageToPdfScreen extends StatefulWidget {
  const ImageToPdfScreen({super.key});

  @override
  State<ImageToPdfScreen> createState() => _ImageToPdfScreenState();
}

class _ImageToPdfScreenState extends State<ImageToPdfScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _selectedImages = [];
  bool _isConverting = false;
  String? _pdfPath;

  Future<void> _pickImages() async {
    final images = await _picker.pickMultiImage(imageQuality: 100);
    if (images.isEmpty) return;

    setState(() {
      for (final image in images) {
        if (!_selectedImages.any((item) => item.path == image.path)) {
          _selectedImages.add(image);
        }
      }
    });
  }

  Future<String> _savePdf(List<int> bytes) async {
    final fileName =
        'image_to_pdf_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final appDir = await getApplicationDocumentsDirectory();
    final appPath = '${appDir.path}/$fileName';
    await File(appPath).writeAsBytes(bytes, flush: true);
    return appPath;
  }

  Future<void> _convertToPdf() async {
    if (_selectedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one image')),
      );
      return;
    }

    setState(() => _isConverting = true);

    try {
      final document = PdfDocument();

      for (final imageFile in _selectedImages) {
        final bytes = await imageFile.readAsBytes();
        final bitmap = PdfBitmap(bytes);

        final page = document.pages.add();
        final size = page.getClientSize();

        page.graphics.drawImage(
          bitmap,
          Rect.fromLTWH(0, 0, size.width, size.height),
        );
      }

      final pdfBytes = await document.save();
      document.dispose();

      final savedPath = await _savePdf(pdfBytes);

      if (!mounted) return;

      setState(() {
        _pdfPath = savedPath;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF created and saved successfully')),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Conversion failed: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isConverting = false);
      }
    }
  }

  Future<void> _openPdf() async {
    if (_pdfPath == null) return;
    await OpenFile.open(_pdfPath!);
  }

  Future<void> _sharePdf() async {
    if (_pdfPath == null) return;
    await Share.shareXFiles([XFile(_pdfPath!)], text: 'Image to PDF');
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _clearAll() {
    setState(() {
      _selectedImages.clear();
      _pdfPath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        // ── Hero icon matching the card ──
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'tool-icon-Image to PDF',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.brown.withOpacity(0.95),
                    Colors.brown.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.insert_drive_file_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('Image to PDF'),
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _pickImages,
                  icon: const Icon(Icons.image_rounded),
                  label: const Text('Pick Images'),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: _selectedImages.isEmpty
                    ? const Center(child: Text('No images selected'))
                    : ListView.builder(
                        itemCount: _selectedImages.length,
                        itemBuilder: (context, index) {
                          final image = _selectedImages[index];
                          return Card(
                            child: ListTile(
                              leading: Image.file(
                                File(image.path),
                                width: 52,
                                height: 52,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                image.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(image.path),
                              trailing: IconButton(
                                onPressed: () => _removeImage(index),
                                icon: const Icon(Icons.close_rounded),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              if (_pdfPath != null) ...[
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('Saved on device: $_pdfPath'),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _openPdf,
                    icon: const Icon(Icons.open_in_new_rounded),
                    label: const Text('Open PDF'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _sharePdf,
                    icon: const Icon(Icons.share_rounded),
                    label: const Text('Share PDF'),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isConverting ? null : _convertToPdf,
                  icon: _isConverting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.picture_as_pdf_rounded),
                  label: Text(
                    _isConverting ? 'Converting...' : 'Convert to PDF',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
