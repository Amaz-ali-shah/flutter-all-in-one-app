// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
// import 'package:image_picker/image_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';

// enum OutputFormat { jpg, png }

// class ImageConverterScreen extends StatefulWidget {
//   const ImageConverterScreen({super.key});

//   @override
//   State<ImageConverterScreen> createState() => _ImageConverterScreenState();
// }

// class _ImageConverterScreenState extends State<ImageConverterScreen> {
//   final ImagePicker _picker = ImagePicker();

//   XFile? _selectedImage;
//   XFile? _convertedImage;
//   bool _isConverting = false;

//   OutputFormat _outputFormat = OutputFormat.jpg;
//   int _quality = 90;

//   Future<void> _pickImage() async {
//     final image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image == null) return;

//     setState(() {
//       _selectedImage = image;
//       _convertedImage = null;
//     });
//   }

//   Future<String> _saveConvertedFile(List<int> bytes, String extension) async {
//     final dir = await getApplicationDocumentsDirectory();
//     final fileName =
//         'converted_${DateTime.now().millisecondsSinceEpoch}.$extension';
//     final path = '${dir.path}/$fileName';
//     await File(path).writeAsBytes(bytes, flush: true);
//     return path;
//   }

//   Future<void> _convertImage() async {
//     if (_selectedImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select an image first')),
//       );
//       return;
//     }

//     setState(() => _isConverting = true);

//     try {
//       final inputBytes = await _selectedImage!.readAsBytes();
//       final decoded = img.decodeImage(inputBytes);

//       if (decoded == null) {
//         throw Exception('Unsupported image format');
//       }

//       final isJpg = _outputFormat == OutputFormat.jpg;

//       late List<int> outputBytes;
//       late String extension;

//       if (isJpg) {
//         final background = img.Image(
//           width: decoded.width,
//           height: decoded.height,
//         );
//         img.fill(background, color: img.ColorRgb8(255, 255, 255));
//         img.compositeImage(background, decoded);
//         outputBytes = img.encodeJpg(background, quality: _quality);
//         extension = 'jpg';
//       } else {
//         outputBytes = img.encodePng(decoded);
//         extension = 'png';
//       }

//       final savedPath = await _saveConvertedFile(outputBytes, extension);

//       if (!mounted) return;

//       setState(() {
//         _convertedImage = XFile(savedPath);
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Image converted successfully')),
//       );
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text('Conversion failed: $e')));
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isConverting = false);
//       }
//     }
//   }

//   Future<void> _openConverted() async {
//     if (_convertedImage == null) return;
//     await OpenFile.open(_convertedImage!.path);
//   }

//   Future<void> _shareConverted() async {
//     if (_convertedImage == null) return;
//     await Share.shareXFiles([_convertedImage!], text: 'Converted Image');
//   }

//   void _clearAll() {
//     setState(() {
//       _selectedImage = null;
//       _convertedImage = null;
//     });
//   }

//   String _formatBytes(int bytes) {
//     if (bytes >= 1024 * 1024) {
//       return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
//     }
//     return '${(bytes / 1024).toStringAsFixed(2)} KB';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Converter'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: _clearAll,
//             icon: const Icon(Icons.delete_outline_rounded),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: _pickImage,
//                 icon: const Icon(Icons.image_rounded),
//                 label: const Text('Pick Image'),
//               ),
//               const SizedBox(height: 16),

//               if (_selectedImage != null)
//                 Card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.file(
//                         File(_selectedImage!.path),
//                         width: double.infinity,
//                         height: 220,
//                         fit: BoxFit.cover,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(12),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               _selectedImage!.name,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             FutureBuilder<int>(
//                               future: File(_selectedImage!.path).length(),
//                               builder: (context, snapshot) {
//                                 if (!snapshot.hasData) {
//                                   return const Text('Original Size: ...');
//                                 }
//                                 return Text(
//                                   'Original Size: ${_formatBytes(snapshot.data!)}',
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//               const SizedBox(height: 16),

//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Output Format',
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                       const SizedBox(height: 8),
//                       DropdownButtonFormField<OutputFormat>(
//                         value: _outputFormat,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                         ),
//                         items: const [
//                           DropdownMenuItem(
//                             value: OutputFormat.jpg,
//                             child: Text('JPG'),
//                           ),
//                           DropdownMenuItem(
//                             value: OutputFormat.png,
//                             child: Text('PNG'),
//                           ),
//                         ],
//                         onChanged: _isConverting
//                             ? null
//                             : (value) {
//                                 if (value != null) {
//                                   setState(() => _outputFormat = value);
//                                 }
//                               },
//                       ),
//                       const SizedBox(height: 16),
//                       if (_outputFormat == OutputFormat.jpg) ...[
//                         const Text(
//                           'JPG Quality',
//                           style: TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(height: 8),
//                         Text('$_quality%'),
//                         Slider(
//                           value: _quality.toDouble(),
//                           min: 10,
//                           max: 100,
//                           divisions: 18,
//                           label: '$_quality%',
//                           onChanged: _isConverting
//                               ? null
//                               : (value) {
//                                   setState(() => _quality = value.toInt());
//                                 },
//                         ),
//                       ],
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 16),

//               if (_convertedImage != null)
//                 Card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.file(
//                         File(_convertedImage!.path),
//                         width: double.infinity,
//                         height: 220,
//                         fit: BoxFit.contain,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(12),
//                         child: FutureBuilder<int>(
//                           future: File(_convertedImage!.path).length(),
//                           builder: (context, snapshot) {
//                             if (!snapshot.hasData) {
//                               return const Text('Converted Size: ...');
//                             }
//                             return Text(
//                               'Converted Size: ${_formatBytes(snapshot.data!)}',
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               else
//                 const Center(child: Text('No converted image yet')),

//               const SizedBox(height: 16),

//               if (_convertedImage != null) ...[
//                 OutlinedButton.icon(
//                   onPressed: _openConverted,
//                   icon: const Icon(Icons.open_in_new_rounded),
//                   label: const Text('Open Image'),
//                 ),
//                 const SizedBox(height: 10),
//                 OutlinedButton.icon(
//                   onPressed: _shareConverted,
//                   icon: const Icon(Icons.share_rounded),
//                   label: const Text('Share Image'),
//                 ),
//                 const SizedBox(height: 12),
//               ],

//               ElevatedButton.icon(
//                 onPressed: _isConverting ? null : _convertImage,
//                 icon: _isConverting
//                     ? const SizedBox(
//                         width: 18,
//                         height: 18,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       )
//                     : const Icon(Icons.transform_rounded),
//                 label: Text(_isConverting ? 'Converting...' : 'Convert Image'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

enum OutputFormat { jpg, png }

class ImageConverterScreen extends StatefulWidget {
  const ImageConverterScreen({super.key});

  @override
  State<ImageConverterScreen> createState() => _ImageConverterScreenState();
}

class _ImageConverterScreenState extends State<ImageConverterScreen> {
  final ImagePicker _picker = ImagePicker();

  XFile? _selectedImage;
  XFile? _convertedImage;
  bool _isConverting = false;

  OutputFormat _outputFormat = OutputFormat.jpg;
  int _quality = 90;

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      _selectedImage = image;
      _convertedImage = null;
    });
  }

  Future<String> _saveConvertedFile(List<int> bytes, String extension) async {
    final dir = await getApplicationDocumentsDirectory();
    final fileName =
        'converted_${DateTime.now().millisecondsSinceEpoch}.$extension';
    final path = '${dir.path}/$fileName';
    await File(path).writeAsBytes(bytes, flush: true);
    return path;
  }

  Future<void> _convertImage() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first')),
      );
      return;
    }

    setState(() => _isConverting = true);

    try {
      final inputBytes = await _selectedImage!.readAsBytes();
      final decoded = img.decodeImage(inputBytes);

      if (decoded == null) {
        throw Exception('Unsupported image format');
      }

      final isJpg = _outputFormat == OutputFormat.jpg;

      late List<int> outputBytes;
      late String extension;

      if (isJpg) {
        final background = img.Image(
          width: decoded.width,
          height: decoded.height,
        );
        img.fill(background, color: img.ColorRgb8(255, 255, 255));
        img.compositeImage(background, decoded);
        outputBytes = img.encodeJpg(background, quality: _quality);
        extension = 'jpg';
      } else {
        outputBytes = img.encodePng(decoded);
        extension = 'png';
      }

      final savedPath = await _saveConvertedFile(outputBytes, extension);

      if (!mounted) return;

      setState(() {
        _convertedImage = XFile(savedPath);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image converted successfully')),
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

  Future<void> _openConverted() async {
    if (_convertedImage == null) return;
    await OpenFile.open(_convertedImage!.path);
  }

  Future<void> _shareConverted() async {
    if (_convertedImage == null) return;
    await Share.shareXFiles([_convertedImage!], text: 'Converted Image');
  }

  void _clearAll() {
    setState(() {
      _selectedImage = null;
      _convertedImage = null;
    });
  }

  String _formatBytes(int bytes) {
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / 1024).toStringAsFixed(2)} KB';
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
            tag: 'tool-icon-Image Converter',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepOrange.withOpacity(0.95),
                    Colors.deepOrange.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.image_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('Image Converter'),
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
                            const SizedBox(height: 6),
                            FutureBuilder<int>(
                              future: File(_selectedImage!.path).length(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Text('Original Size: ...');
                                }
                                return Text(
                                  'Original Size: ${_formatBytes(snapshot.data!)}',
                                );
                              },
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
                        'Output Format',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<OutputFormat>(
                        value: _outputFormat,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: OutputFormat.jpg,
                            child: Text('JPG'),
                          ),
                          DropdownMenuItem(
                            value: OutputFormat.png,
                            child: Text('PNG'),
                          ),
                        ],
                        onChanged: _isConverting
                            ? null
                            : (value) {
                                if (value != null) {
                                  setState(() => _outputFormat = value);
                                }
                              },
                      ),
                      const SizedBox(height: 16),
                      if (_outputFormat == OutputFormat.jpg) ...[
                        const Text(
                          'JPG Quality',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text('$_quality%'),
                        Slider(
                          value: _quality.toDouble(),
                          min: 10,
                          max: 100,
                          divisions: 18,
                          label: '$_quality%',
                          onChanged: _isConverting
                              ? null
                              : (value) {
                                  setState(() => _quality = value.toInt());
                                },
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              if (_convertedImage != null)
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.file(
                        File(_convertedImage!.path),
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: FutureBuilder<int>(
                          future: File(_convertedImage!.path).length(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Text('Converted Size: ...');
                            }
                            return Text(
                              'Converted Size: ${_formatBytes(snapshot.data!)}',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              else
                const Center(child: Text('No converted image yet')),

              const SizedBox(height: 16),

              if (_convertedImage != null) ...[
                OutlinedButton.icon(
                  onPressed: _openConverted,
                  icon: const Icon(Icons.open_in_new_rounded),
                  label: const Text('Open Image'),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: _shareConverted,
                  icon: const Icon(Icons.share_rounded),
                  label: const Text('Share Image'),
                ),
                const SizedBox(height: 12),
              ],

              ElevatedButton.icon(
                onPressed: _isConverting ? null : _convertImage,
                icon: _isConverting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.transform_rounded),
                label: Text(_isConverting ? 'Converting...' : 'Convert Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
