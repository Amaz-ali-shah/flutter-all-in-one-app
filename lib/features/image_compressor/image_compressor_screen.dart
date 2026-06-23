import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageCompressorScreen extends StatefulWidget {
  const ImageCompressorScreen({super.key});

  @override
  State<ImageCompressorScreen> createState() => _ImageCompressorScreenState();
}

class _ImageCompressorScreenState extends State<ImageCompressorScreen> {
  final ImagePicker _picker = ImagePicker();

  XFile? _selectedImage;
  XFile? _compressedImage;

  double _quality = 80;
  bool _isCompressing = false;

  int? _originalSize;
  int? _compressedSize;

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final file = File(image.path);
    final size = await file.length();

    setState(() {
      _selectedImage = image;
      _compressedImage = null;
      _originalSize = size;
      _compressedSize = null;
    });
  }

  Future<File> _compressImage(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final targetPath =
        '${directory.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final result = await FlutterImageCompress.compressAndGetFile(
      imageFile.absolute.path,
      targetPath,
      quality: _quality.toInt(),
      minWidth: 1080,
      minHeight: 1080,
      format: CompressFormat.jpeg,
    );

    if (result == null) {
      throw Exception('Compression failed');
    }

    return File(result.path);
  }

  Future<void> _handleCompress() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first')),
      );
      return;
    }

    setState(() => _isCompressing = true);

    try {
      final originalFile = File(_selectedImage!.path);
      final compressedFile = await _compressImage(originalFile);
      final compressedSize = await compressedFile.length();

      setState(() {
        _compressedImage = XFile(compressedFile.path);
        _compressedSize = compressedSize;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image compressed successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Compression failed: $e')));
    } finally {
      setState(() => _isCompressing = false);
    }
  }

  Future<void> _openCompressed() async {
    if (_compressedImage == null) return;
    await OpenFile.open(_compressedImage!.path);
  }

  Future<void> _shareCompressed() async {
    if (_compressedImage == null) return;
    await Share.shareXFiles([_compressedImage!], text: 'Compressed Image');
  }

  void _resetAll() {
    setState(() {
      _selectedImage = null;
      _compressedImage = null;
      _originalSize = null;
      _compressedSize = null;
    });
  }

  String _formatBytes(int bytes) {
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / 1024).toStringAsFixed(2)} KB';
  }

  double _compressionPercent() {
    if (_originalSize == null ||
        _compressedSize == null ||
        _originalSize == 0) {
      return 0;
    }
    final saved = _originalSize! - _compressedSize!;
    return (saved / _originalSize!) * 100;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasCompressed = _compressedImage != null;

    return Scaffold(
      appBar: AppBar(
        // ── Hero icon matching the card ──
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'tool-icon-Image Compressor',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.withOpacity(0.95),
                    Colors.green.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.compress_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('Image Compressor'),
        centerTitle: true,
        backgroundColor: colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: _resetAll,
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.image_rounded),
                label: const Text('Pick Image'),
              ),
              const SizedBox(height: 16),

              if (_selectedImage != null)
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.file(
                        File(_selectedImage!.path),
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _selectedImage!.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Original Size: ${_originalSize != null ? _formatBytes(_originalSize!) : "-"}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 16),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Compression Quality',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text('${_quality.toInt()}%'),
                      Slider(
                        value: _quality,
                        min: 10,
                        max: 100,
                        divisions: 18,
                        label: _quality.toInt().toString(),
                        onChanged: _isCompressing
                            ? null
                            : (value) {
                                setState(() => _quality = value);
                              },
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Lower quality = smaller file size',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              if (_compressedImage != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Compressed Image Info',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Compressed Size: ${_compressedSize != null ? _formatBytes(_compressedSize!) : "-"}',
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Saved: ${_compressionPercent().toStringAsFixed(2)}%',
                        ),
                      ],
                    ),
                  ),
                ),

              const SizedBox(height: 16),

              if (_compressedImage != null)
                Card(
                  child: Image.file(
                    File(_compressedImage!.path),
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                )
              else
                const Center(child: Text('No compressed image yet')),

              const SizedBox(height: 16),

              if (_compressedImage != null) ...[
                OutlinedButton.icon(
                  onPressed: _openCompressed,
                  icon: const Icon(Icons.open_in_new_rounded),
                  label: const Text('Open Image'),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: _shareCompressed,
                  icon: const Icon(Icons.share_rounded),
                  label: const Text('Share Image'),
                ),
                const SizedBox(height: 12),
              ],

              ElevatedButton.icon(
                onPressed: _isCompressing ? null : _handleCompress,
                icon: _isCompressing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.compress_rounded),
                label: Text(
                  _isCompressing ? 'Compressing...' : 'Compress Image',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
