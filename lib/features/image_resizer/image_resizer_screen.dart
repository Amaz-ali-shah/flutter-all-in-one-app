// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

// import 'package:gal/gal.dart';

// class ImageResizerScreen extends StatefulWidget {
//   const ImageResizerScreen({super.key});

//   @override
//   State<ImageResizerScreen> createState() => _ImageResizerScreenState();
// }

// class _ImageResizerScreenState extends State<ImageResizerScreen> {
//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController _widthController = TextEditingController();
//   final TextEditingController _heightController = TextEditingController();

//   File? _originalFile;
//   File? _resizedFile;

//   int? _originalWidth;
//   int? _originalHeight;
//   int? _resizedWidth;
//   int? _resizedHeight;

//   int? _originalBytes;
//   int? _resizedBytes;

//   bool _keepAspectRatio = true;
//   bool _isProcessing = false;
//   bool _isSaving = false;

//   @override
//   void dispose() {
//     _widthController.dispose();
//     _heightController.dispose();
//     super.dispose();
//   }

//   String _formatBytes(int? bytes) {
//     if (bytes == null) return '0 B';
//     final kb = bytes / 1024;
//     if (kb < 1024) return '${kb.toStringAsFixed(1)} KB';
//     return '${(kb / 1024).toStringAsFixed(1)} MB';
//   }

//   Future<void> _pickImage() async {
//     final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
//     if (picked == null) return;

//     final file = File(picked.path);
//     final bytes = await file.readAsBytes();
//     final decoded = img.decodeImage(bytes);

//     if (decoded == null) return;

//     setState(() {
//       _originalFile = file;
//       _resizedFile = null;

//       _originalWidth = decoded.width;
//       _originalHeight = decoded.height;
//       _originalBytes = bytes.length;

//       _resizedWidth = null;
//       _resizedHeight = null;
//       _resizedBytes = null;

//       _widthController.text = decoded.width.toString();
//       _heightController.text = decoded.height.toString();
//     });
//   }

//   Future<void> _resizeImage() async {
//     if (_originalFile == null) return;

//     final width = int.tryParse(_widthController.text.trim());
//     final height = int.tryParse(_heightController.text.trim());

//     if (width == null || width <= 0) return;
//     if (!_keepAspectRatio && (height == null || height <= 0)) return;

//     setState(() => _isProcessing = true);

//     try {
//       final bytes = await _originalFile!.readAsBytes();
//       final decoded = img.decodeImage(bytes);
//       if (decoded == null) return;

//       final targetWidth = width;
//       final targetHeight = _keepAspectRatio
//           ? (targetWidth * decoded.height / decoded.width).round()
//           : height!;

//       final resized = img.copyResize(
//         decoded,
//         width: targetWidth,
//         height: targetHeight,
//       );

//       final tempDir = await getTemporaryDirectory();
//       final outputPath =
//           '${tempDir.path}/resized_${DateTime.now().millisecondsSinceEpoch}.jpg';

//       final outFile = File(outputPath);
//       final encoded = img.encodeJpg(resized, quality: 90);
//       await outFile.writeAsBytes(encoded);

//       setState(() {
//         _resizedFile = outFile;
//         _resizedWidth = targetWidth;
//         _resizedHeight = targetHeight;
//         _resizedBytes = encoded.length;
//       });
//     } finally {
//       if (mounted) {
//         setState(() => _isProcessing = false);
//       }
//     }
//   }

//   // Future<void> _saveToGallery() async {
//   //   if (_resizedFile == null) return;

//   //   setState(() => _isSaving = true);

//   //   try {
//   //     final result = await ImageGallerySaver.saveFile(
//   //       _resizedFile!.path,
//   //       name: 'resized_${DateTime.now().millisecondsSinceEpoch}',
//   //     );

//   //     if (!mounted) return;

//   //     final success = result['isSuccess'] == true || result['filePath'] != null;

//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text(
//   //           success ? 'Saved to gallery successfully' : 'Failed to save image',
//   //         ),
//   //       ),
//   //     );
//   //   } catch (e) {
//   //     if (!mounted) return;
//   //     ScaffoldMessenger.of(
//   //       context,
//   //     ).showSnackBar(SnackBar(content: Text('Save failed: $e')));
//   //   } finally {
//   //     if (mounted) {
//   //       setState(() => _isSaving = false);
//   //     }
//   //   }
//   // }

//   Future<void> _saveToGallery() async {
//     if (_resizedFile == null) return;

//     setState(() => _isSaving = true);

//     try {
//       await Gal.putImage(_resizedFile!.path);

//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Saved to gallery successfully')),
//       );
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Save failed: $e')));
//     } finally {
//       if (mounted) setState(() => _isSaving = false);
//     }
//   }

//   void _resetAll() {
//     setState(() {
//       _originalFile = null;
//       _resizedFile = null;
//       _originalWidth = null;
//       _originalHeight = null;
//       _resizedWidth = null;
//       _resizedHeight = null;
//       _originalBytes = null;
//       _resizedBytes = null;
//       _keepAspectRatio = true;
//       _isProcessing = false;
//       _isSaving = false;
//       _widthController.clear();
//       _heightController.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Resizer'),
//         actions: [
//           IconButton(
//             onPressed: _resetAll,
//             icon: const Icon(Icons.refresh_rounded),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _actionCard(
//               context,
//               title: 'Pick Image',
//               subtitle: 'Choose an image from gallery',
//               icon: Icons.photo_library_rounded,
//               color: colorScheme.primary,
//               onTap: _pickImage,
//             ),
//             const SizedBox(height: 16),

//             if (_originalFile != null) ...[
//               _infoCard(
//                 context,
//                 title: 'Original Image',
//                 sizeText: '${_originalWidth ?? 0} × ${_originalHeight ?? 0}',
//                 bytesText: _formatBytes(_originalBytes),
//                 ratioText: 'Original',
//               ),
//               const SizedBox(height: 16),
//               _previewCard(
//                 context,
//                 title: 'Original Preview',
//                 file: _originalFile!,
//               ),
//               const SizedBox(height: 16),
//               _controls(context),
//               const SizedBox(height: 16),
//               SizedBox(
//                 width: double.infinity,
//                 child: FilledButton.icon(
//                   onPressed: _isProcessing ? null : _resizeImage,
//                   icon: _isProcessing
//                       ? const SizedBox(
//                           width: 18,
//                           height: 18,
//                           child: CircularProgressIndicator(strokeWidth: 2),
//                         )
//                       : const Icon(Icons.tune_rounded),
//                   label: Text(_isProcessing ? 'Resizing...' : 'Resize Image'),
//                 ),
//               ),
//             ],

//             if (_resizedFile != null) ...[
//               const SizedBox(height: 16),
//               _infoCard(
//                 context,
//                 title: 'Resized Image',
//                 sizeText: '${_resizedWidth ?? 0} × ${_resizedHeight ?? 0}',
//                 bytesText: _formatBytes(_resizedBytes),
//                 ratioText: _keepAspectRatio ? 'Aspect locked' : 'Custom size',
//               ),
//               const SizedBox(height: 16),
//               _previewCard(
//                 context,
//                 title: 'Resized Preview',
//                 file: _resizedFile!,
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 width: double.infinity,
//                 child: FilledButton.icon(
//                   onPressed: _isSaving ? null : _saveToGallery,
//                   icon: _isSaving
//                       ? const SizedBox(
//                           width: 18,
//                           height: 18,
//                           child: CircularProgressIndicator(strokeWidth: 2),
//                         )
//                       : const Icon(Icons.save_alt_rounded),
//                   label: Text(_isSaving ? 'Saving...' : 'Save to Gallery'),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _actionCard(
//     BuildContext context, {
//     required String title,
//     required String subtitle,
//     required IconData icon,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(20),
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.all(18),
//           child: Row(
//             children: [
//               Container(
//                 width: 54,
//                 height: 54,
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.12),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Icon(icon, color: color, size: 28),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       subtitle,
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.onSurfaceVariant,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _infoCard(
//     BuildContext context, {
//     required String title,
//     required String sizeText,
//     required String bytesText,
//     required String ratioText,
//   }) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _miniInfo(context, 'Dimensions', sizeText),
//                 _miniInfo(context, 'Size', bytesText),
//                 _miniInfo(context, 'Mode', ratioText),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _miniInfo(BuildContext context, String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: Theme.of(context).colorScheme.onSurfaceVariant,
//             fontSize: 12,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           value,
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
//         ),
//       ],
//     );
//   }

//   Widget _previewCard(
//     BuildContext context, {
//     required String title,
//     required File file,
//   }) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//       clipBehavior: Clip.antiAlias,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Text(
//               title,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
//             ),
//           ),
//           AspectRatio(
//             aspectRatio: 1.2,
//             child: Image.file(file, fit: BoxFit.cover, width: double.infinity),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _controls(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _widthController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Width',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: TextField(
//                     controller: _heightController,
//                     enabled: !_keepAspectRatio,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       labelText: 'Height',
//                       border: const OutlineInputBorder(),
//                       filled: _keepAspectRatio,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             SwitchListTile(
//               contentPadding: EdgeInsets.zero,
//               title: const Text('Keep aspect ratio'),
//               value: _keepAspectRatio,
//               onChanged: (value) {
//                 setState(() {
//                   _keepAspectRatio = value;
//                   if (_keepAspectRatio && _originalHeight != null) {
//                     _heightController.text = _originalHeight.toString();
//                   }
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:gal/gal.dart';

class ImageResizerScreen extends StatefulWidget {
  const ImageResizerScreen({super.key});

  @override
  State<ImageResizerScreen> createState() => _ImageResizerScreenState();
}

class _ImageResizerScreenState extends State<ImageResizerScreen> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  File? _originalFile;
  File? _resizedFile;

  int? _originalWidth;
  int? _originalHeight;
  int? _resizedWidth;
  int? _resizedHeight;

  int? _originalBytes;
  int? _resizedBytes;

  bool _keepAspectRatio = true;
  bool _isProcessing = false;
  bool _isSaving = false;

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  String _formatBytes(int? bytes) {
    if (bytes == null) return '0 B';
    final kb = bytes / 1024;
    if (kb < 1024) return '${kb.toStringAsFixed(1)} KB';
    return '${(kb / 1024).toStringAsFixed(1)} MB';
  }

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    final file = File(picked.path);
    final bytes = await file.readAsBytes();
    final decoded = img.decodeImage(bytes);

    if (decoded == null) return;

    setState(() {
      _originalFile = file;
      _resizedFile = null;

      _originalWidth = decoded.width;
      _originalHeight = decoded.height;
      _originalBytes = bytes.length;

      _resizedWidth = null;
      _resizedHeight = null;
      _resizedBytes = null;

      _widthController.text = decoded.width.toString();
      _heightController.text = decoded.height.toString();
    });
  }

  Future<void> _resizeImage() async {
    if (_originalFile == null) return;

    final width = int.tryParse(_widthController.text.trim());
    final height = int.tryParse(_heightController.text.trim());

    if (width == null || width <= 0) return;
    if (!_keepAspectRatio && (height == null || height <= 0)) return;

    setState(() => _isProcessing = true);

    try {
      final bytes = await _originalFile!.readAsBytes();
      final decoded = img.decodeImage(bytes);
      if (decoded == null) return;

      final targetWidth = width;
      final targetHeight = _keepAspectRatio
          ? (targetWidth * decoded.height / decoded.width).round()
          : height!;

      final resized = img.copyResize(
        decoded,
        width: targetWidth,
        height: targetHeight,
      );

      final tempDir = await getTemporaryDirectory();
      final outputPath =
          '${tempDir.path}/resized_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final outFile = File(outputPath);
      final encoded = img.encodeJpg(resized, quality: 90);
      await outFile.writeAsBytes(encoded);

      setState(() {
        _resizedFile = outFile;
        _resizedWidth = targetWidth;
        _resizedHeight = targetHeight;
        _resizedBytes = encoded.length;
      });
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _saveToGallery() async {
    if (_resizedFile == null) return;

    setState(() => _isSaving = true);

    try {
      await Gal.putImage(_resizedFile!.path);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved to gallery successfully')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Save failed: $e')));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  void _resetAll() {
    setState(() {
      _originalFile = null;
      _resizedFile = null;
      _originalWidth = null;
      _originalHeight = null;
      _resizedWidth = null;
      _resizedHeight = null;
      _originalBytes = null;
      _resizedBytes = null;
      _keepAspectRatio = true;
      _isProcessing = false;
      _isSaving = false;
      _widthController.clear();
      _heightController.clear();
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
            tag: 'tool-icon-Image Resizer',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.95),
                    Colors.blue.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.photo_size_select_large_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('Image Resizer'),
        backgroundColor: colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: _resetAll,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _actionCard(
              context,
              title: 'Pick Image',
              subtitle: 'Choose an image from gallery',
              icon: Icons.photo_library_rounded,
              color: colorScheme.primary,
              onTap: _pickImage,
            ),
            const SizedBox(height: 16),

            if (_originalFile != null) ...[
              _infoCard(
                context,
                title: 'Original Image',
                sizeText: '${_originalWidth ?? 0} × ${_originalHeight ?? 0}',
                bytesText: _formatBytes(_originalBytes),
                ratioText: 'Original',
              ),
              const SizedBox(height: 16),
              _previewCard(
                context,
                title: 'Original Preview',
                file: _originalFile!,
              ),
              const SizedBox(height: 16),
              _controls(context),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _isProcessing ? null : _resizeImage,
                  icon: _isProcessing
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.tune_rounded),
                  label: Text(_isProcessing ? 'Resizing...' : 'Resize Image'),
                ),
              ),
            ],

            if (_resizedFile != null) ...[
              const SizedBox(height: 16),
              _infoCard(
                context,
                title: 'Resized Image',
                sizeText: '${_resizedWidth ?? 0} × ${_resizedHeight ?? 0}',
                bytesText: _formatBytes(_resizedBytes),
                ratioText: _keepAspectRatio ? 'Aspect locked' : 'Custom size',
              ),
              const SizedBox(height: 16),
              _previewCard(
                context,
                title: 'Resized Preview',
                file: _resizedFile!,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _isSaving ? null : _saveToGallery,
                  icon: _isSaving
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.save_alt_rounded),
                  label: Text(_isSaving ? 'Saving...' : 'Save to Gallery'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _actionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard(
    BuildContext context, {
    required String title,
    required String sizeText,
    required String bytesText,
    required String ratioText,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _miniInfo(context, 'Dimensions', sizeText),
                _miniInfo(context, 'Size', bytesText),
                _miniInfo(context, 'Mode', ratioText),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniInfo(BuildContext context, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _previewCard(
    BuildContext context, {
    required String title,
    required File file,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.2,
            child: Image.file(file, fit: BoxFit.cover, width: double.infinity),
          ),
        ],
      ),
    );
  }

  Widget _controls(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _widthController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Width',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _heightController,
                    enabled: !_keepAspectRatio,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height',
                      border: const OutlineInputBorder(),
                      filled: _keepAspectRatio,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Keep aspect ratio'),
              value: _keepAspectRatio,
              onChanged: (value) {
                setState(() {
                  _keepAspectRatio = value;
                  if (_keepAspectRatio && _originalHeight != null) {
                    _heightController.text = _originalHeight.toString();
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
