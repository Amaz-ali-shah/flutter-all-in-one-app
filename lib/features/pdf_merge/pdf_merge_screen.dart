// // // import 'dart:io';
// // // import 'package:file_picker/file_picker.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:open_file/open_file.dart';
// // // import 'package:path_provider/path_provider.dart';
// // // import 'package:syncfusion_flutter_pdf/pdf.dart';

// // // class PdfMergeScreen extends StatefulWidget {
// // //   const PdfMergeScreen({super.key});

// // //   @override
// // //   State<PdfMergeScreen> createState() => _PdfMergeScreenState();
// // // }

// // // class _PdfMergeScreenState extends State<PdfMergeScreen> {
// // //   final List<String> _selectedPaths = [];
// // //   bool _isMerging = false;
// // //   String? _mergedFilePath;

// // //   Future<void> _pickPdfs() async {
// // //     final result = await FilePicker.platform.pickFiles(
// // //       type: FileType.custom,
// // //       allowedExtensions: ['pdf'],
// // //       allowMultiple: true,
// // //     );

// // //     if (result == null || result.files.isEmpty) return;

// // //     final paths = result.files
// // //         .where((file) => file.path != null)
// // //         .map((file) => file.path!)
// // //         .toList();

// // //     setState(() {
// // //       _selectedPaths.addAll(paths);
// // //     });
// // //   }

// // //   Future<void> _mergePdfs() async {
// // //     if (_selectedPaths.length < 2) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text('Please select at least 2 PDF files')),
// // //       );
// // //       return;
// // //     }

// // //     setState(() => _isMerging = true);

// // //     try {
// // //       final mergedDocument = PdfDocument();
// // //       PdfSection? section;

// // //       for (final path in _selectedPaths) {
// // //         final inputBytes = await File(path).readAsBytes();
// // //         final loadedDocument = PdfDocument(inputBytes: inputBytes);

// // //         for (int i = 0; i < loadedDocument.pages.count; i++) {
// // //           final template = loadedDocument.pages[i].createTemplate();

// // //           if (section == null || section.pageSettings.size != template.size) {
// // //             section = mergedDocument.sections!.add();
// // //             section.pageSettings.size = template.size;
// // //             section.pageSettings.margins.all = 0;
// // //           }

// // //           section.pages.add().graphics.drawPdfTemplate(template, Offset.zero);
// // //         }

// // //         loadedDocument.dispose();
// // //       }

// // //       final bytes = await mergedDocument.save();
// // //       mergedDocument.dispose();

// // //       final dir = await getApplicationDocumentsDirectory();
// // //       final outputPath =
// // //           '${dir.path}/merged_${DateTime.now().millisecondsSinceEpoch}.pdf';
// // //       final outputFile = File(outputPath);
// // //       await outputFile.writeAsBytes(bytes, flush: true);

// // //       setState(() => _mergedFilePath = outputPath);

// // //       if (mounted) {
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           const SnackBar(content: Text('PDF merged successfully')),
// // //         );
// // //       }
// // //     } catch (e) {
// // //       if (mounted) {
// // //         ScaffoldMessenger.of(
// // //           context,
// // //         ).showSnackBar(SnackBar(content: Text('Merge failed: $e')));
// // //       }
// // //     } finally {
// // //       if (mounted) {
// // //         setState(() => _isMerging = false);
// // //       }
// // //     }
// // //   }

// // //   Future<void> _openMergedFile() async {
// // //     if (_mergedFilePath == null) return;
// // //     await OpenFile.open(_mergedFilePath!);
// // //   }

// // //   void _removePdf(int index) {
// // //     setState(() {
// // //       _selectedPaths.removeAt(index);
// // //     });
// // //   }

// // //   void _clearAll() {
// // //     setState(() {
// // //       _selectedPaths.clear();
// // //       _mergedFilePath = null;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('PDF Merge'),
// // //         centerTitle: true,
// // //         actions: [
// // //           IconButton(
// // //             onPressed: _clearAll,
// // //             icon: const Icon(Icons.delete_outline_rounded),
// // //           ),
// // //         ],
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           children: [
// // //             SizedBox(
// // //               width: double.infinity,
// // //               child: ElevatedButton.icon(
// // //                 onPressed: _pickPdfs,
// // //                 icon: const Icon(Icons.picture_as_pdf_rounded),
// // //                 label: const Text('Pick PDF Files'),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             Expanded(
// // //               child: _selectedPaths.isEmpty
// // //                   ? const Center(child: Text('No PDF files selected'))
// // //                   : ListView.builder(
// // //                       itemCount: _selectedPaths.length,
// // //                       itemBuilder: (context, index) {
// // //                         final path = _selectedPaths[index];
// // //                         final name = path.split(Platform.pathSeparator).last;

// // //                         return Card(
// // //                           child: ListTile(
// // //                             leading: const Icon(Icons.picture_as_pdf_rounded),
// // //                             title: Text(name),
// // //                             subtitle: Text(path),
// // //                             trailing: IconButton(
// // //                               onPressed: () => _removePdf(index),
// // //                               icon: const Icon(Icons.close_rounded),
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //             ),
// // //             const SizedBox(height: 12),
// // //             if (_mergedFilePath != null) ...[
// // //               Text('Saved at: $_mergedFilePath'),
// // //               const SizedBox(height: 12),
// // //               SizedBox(
// // //                 width: double.infinity,
// // //                 child: OutlinedButton.icon(
// // //                   onPressed: _openMergedFile,
// // //                   icon: const Icon(Icons.open_in_new_rounded),
// // //                   label: const Text('Open Merged PDF'),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 12),
// // //             ],
// // //             SizedBox(
// // //               width: double.infinity,
// // //               child: ElevatedButton.icon(
// // //                 onPressed: _isMerging ? null : _mergePdfs,
// // //                 icon: _isMerging
// // //                     ? const SizedBox(
// // //                         width: 18,
// // //                         height: 18,
// // //                         child: CircularProgressIndicator(strokeWidth: 2),
// // //                       )
// // //                     : const Icon(Icons.merge_type_rounded),
// // //                 label: Text(_isMerging ? 'Merging...' : 'Merge PDFs'),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:io';

// // import 'package:file_picker/file_picker.dart';
// // import 'package:flutter/material.dart';
// // import 'package:open_file/open_file.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:share_plus/share_plus.dart';
// // import 'package:syncfusion_flutter_pdf/pdf.dart';

// // class PdfMergeScreen extends StatefulWidget {
// //   const PdfMergeScreen({super.key});

// //   @override
// //   State<PdfMergeScreen> createState() => _PdfMergeScreenState();
// // }

// // class _PdfMergeScreenState extends State<PdfMergeScreen> {
// //   final List<String> _selectedPaths = [];
// //   bool _isMerging = false;
// //   String? _mergedFilePath;
// //   String? _savedLocationText;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadLastSavedInfo();
// //   }

// //   Future<void> _loadLastSavedInfo() async {
// //     final dir = await getApplicationDocumentsDirectory();
// //     if (!mounted) return;

// //     setState(() {
// //       _savedLocationText = 'App storage: ${dir.path}';
// //     });
// //   }

// //   Future<void> _pickPdfs() async {
// //     final result = await FilePicker.platform.pickFiles(
// //       type: FileType.custom,
// //       allowedExtensions: ['pdf'],
// //       allowMultiple: true,
// //     );

// //     if (result == null || result.files.isEmpty) return;

// //     final paths = result.files
// //         .where((file) => file.path != null)
// //         .map((file) => file.path!)
// //         .toList();

// //     setState(() {
// //       for (final path in paths) {
// //         if (!_selectedPaths.contains(path)) {
// //           _selectedPaths.add(path);
// //         }
// //       }
// //     });
// //   }

// //   Future<String> _saveToPublicDownloads(List<int> bytes) async {
// //     if (Platform.isAndroid) {
// //       final downloadsDir = Directory('/storage/emulated/0/Download');
// //       if (await downloadsDir.exists()) {
// //         final fileName = 'merged_${DateTime.now().millisecondsSinceEpoch}.pdf';
// //         final publicPath = '${downloadsDir.path}/$fileName';
// //         await File(publicPath).writeAsBytes(bytes, flush: true);
// //         return publicPath;
// //       }
// //     }

// //     final appDir = await getApplicationDocumentsDirectory();
// //     final fileName = 'merged_${DateTime.now().millisecondsSinceEpoch}.pdf';
// //     final appPath = '${appDir.path}/$fileName';
// //     await File(appPath).writeAsBytes(bytes, flush: true);
// //     return appPath;
// //   }

// //   Future<void> _mergePdfs() async {
// //     if (_selectedPaths.length < 2) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Please select at least 2 PDF files')),
// //       );
// //       return;
// //     }

// //     setState(() => _isMerging = true);

// //     try {
// //       final mergedDocument = PdfDocument();
// //       PdfSection? section;

// //       for (final path in _selectedPaths) {
// //         final inputBytes = await File(path).readAsBytes();
// //         final loadedDocument = PdfDocument(inputBytes: inputBytes);

// //         for (int i = 0; i < loadedDocument.pages.count; i++) {
// //           final template = loadedDocument.pages[i].createTemplate();

// //           if (section == null || section.pageSettings.size != template.size) {
// //             section = mergedDocument.sections!.add();
// //             section.pageSettings.size = template.size;
// //             section.pageSettings.margins.all = 0;
// //           }

// //           section.pages.add().graphics.drawPdfTemplate(template, Offset.zero);
// //         }

// //         loadedDocument.dispose();
// //       }

// //       final bytes = await mergedDocument.save();
// //       mergedDocument.dispose();

// //       final savedPath = await _saveToPublicDownloads(bytes);

// //       if (!mounted) return;

// //       setState(() {
// //         _mergedFilePath = savedPath;
// //         _savedLocationText = 'Saved on device: $savedPath';
// //       });

// //       ScaffoldMessenger.of(
// //         context,
// //       ).showSnackBar(SnackBar(content: Text('PDF saved successfully')));
// //     } catch (e) {
// //       if (mounted) {
// //         ScaffoldMessenger.of(
// //           context,
// //         ).showSnackBar(SnackBar(content: Text('Merge failed: $e')));
// //       }
// //     } finally {
// //       if (mounted) {
// //         setState(() => _isMerging = false);
// //       }
// //     }
// //   }

// //   Future<void> _openMergedFile() async {
// //     if (_mergedFilePath == null) return;
// //     await OpenFile.open(_mergedFilePath!);
// //   }

// //   Future<void> _shareMergedFile() async {
// //     if (_mergedFilePath == null) return;
// //     await Share.shareXFiles([XFile(_mergedFilePath!)], text: 'Merged PDF');
// //   }

// //   void _removePdf(int index) {
// //     setState(() {
// //       _selectedPaths.removeAt(index);
// //     });
// //   }

// //   void _clearAll() {
// //     setState(() {
// //       _selectedPaths.clear();
// //       _mergedFilePath = null;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('PDF Merge'),
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             onPressed: _clearAll,
// //             icon: const Icon(Icons.delete_outline_rounded),
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           children: [
// //             SizedBox(
// //               width: double.infinity,
// //               child: ElevatedButton.icon(
// //                 onPressed: _pickPdfs,
// //                 icon: const Icon(Icons.picture_as_pdf_rounded),
// //                 label: const Text('Pick PDF Files'),
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             if (_savedLocationText != null) ...[
// //               Container(
// //                 width: double.infinity,
// //                 padding: const EdgeInsets.all(12),
// //                 decoration: BoxDecoration(
// //                   color: Theme.of(context).colorScheme.surfaceContainerHighest,
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 child: Text(_savedLocationText!),
// //               ),
// //               const SizedBox(height: 12),
// //             ],
// //             Expanded(
// //               child: _selectedPaths.isEmpty
// //                   ? const Center(child: Text('No PDF files selected'))
// //                   : ListView.builder(
// //                       itemCount: _selectedPaths.length,
// //                       itemBuilder: (context, index) {
// //                         final path = _selectedPaths[index];
// //                         final name = path.split(Platform.pathSeparator).last;

// //                         return Card(
// //                           child: ListTile(
// //                             leading: const Icon(Icons.picture_as_pdf_rounded),
// //                             title: Text(name),
// //                             subtitle: Text(path),
// //                             trailing: IconButton(
// //                               onPressed: () => _removePdf(index),
// //                               icon: const Icon(Icons.close_rounded),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //             ),
// //             if (_mergedFilePath != null) ...[
// //               const SizedBox(height: 12),
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: OutlinedButton.icon(
// //                   onPressed: _openMergedFile,
// //                   icon: const Icon(Icons.open_in_new_rounded),
// //                   label: const Text('Open Merged PDF'),
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: OutlinedButton.icon(
// //                   onPressed: _shareMergedFile,
// //                   icon: const Icon(Icons.share_rounded),
// //                   label: const Text('Share Merged PDF'),
// //                 ),
// //               ),
// //             ],
// //             const SizedBox(height: 12),
// //             SizedBox(
// //               width: double.infinity,
// //               child: ElevatedButton.icon(
// //                 onPressed: _isMerging ? null : _mergePdfs,
// //                 icon: _isMerging
// //                     ? const SizedBox(
// //                         width: 18,
// //                         height: 18,
// //                         child: CircularProgressIndicator(strokeWidth: 2),
// //                       )
// //                     : const Icon(Icons.merge_type_rounded),
// //                 label: Text(_isMerging ? 'Merging...' : 'Merge PDFs'),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';

// class PdfMergeScreen extends StatefulWidget {
//   const PdfMergeScreen({super.key});

//   @override
//   State<PdfMergeScreen> createState() => _PdfMergeScreenState();
// }

// class _PdfMergeScreenState extends State<PdfMergeScreen> {
//   final List<String> _selectedPaths = [];
//   bool _isMerging = false;
//   String? _mergedFilePath;
//   String? _savedLocationText;

//   @override
//   void initState() {
//     super.initState();
//     _loadLastSavedInfo();
//   }

//   Future<void> _loadLastSavedInfo() async {
//     final dir = await getApplicationDocumentsDirectory();
//     if (!mounted) return;

//     setState(() {
//       _savedLocationText = 'App storage: ${dir.path}';
//     });
//   }

//   Future<void> _pickPdfs() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//       allowMultiple: true,
//     );

//     if (result == null || result.files.isEmpty) return;

//     final paths = result.files
//         .where((file) => file.path != null)
//         .map((file) => file.path!)
//         .toList();

//     setState(() {
//       for (final path in paths) {
//         if (!_selectedPaths.contains(path)) {
//           _selectedPaths.add(path);
//         }
//       }
//     });
//   }

//   Future<String> _savePdf(List<int> bytes) async {
//     final appDir = await getApplicationDocumentsDirectory();
//     final fileName = 'merged_${DateTime.now().millisecondsSinceEpoch}.pdf';
//     final appPath = '${appDir.path}/$fileName';
//     await File(appPath).writeAsBytes(bytes, flush: true);
//     return appPath;
//   }

//   Future<void> _mergePdfs() async {
//     if (_selectedPaths.length < 2) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select at least 2 PDF files')),
//       );
//       return;
//     }

//     setState(() => _isMerging = true);

//     try {
//       final mergedDocument = PdfDocument();

//       for (final path in _selectedPaths) {
//         final inputBytes = await File(path).readAsBytes();
//         final loadedDocument = PdfDocument(inputBytes: inputBytes);

//         for (int i = 0; i < loadedDocument.pages.count; i++) {
//           final loadedPage = loadedDocument.pages[i];
//           final template = loadedPage.createTemplate();

//           final page = mergedDocument.pages.add();
//           page.graphics.drawPdfTemplate(template, Offset.zero);
//         }

//         loadedDocument.dispose();
//       }

//       final bytes = await mergedDocument.save();
//       mergedDocument.dispose();

//       final savedPath = await _savePdf(bytes);

//       if (!mounted) return;

//       setState(() {
//         _mergedFilePath = savedPath;
//         _savedLocationText = 'Saved on device: $savedPath';
//       });

//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('PDF saved successfully')));
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text('Merge failed: $e')));
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isMerging = false);
//       }
//     }
//   }

//   Future<void> _openMergedFile() async {
//     if (_mergedFilePath == null) return;
//     await OpenFile.open(_mergedFilePath!);
//   }

//   Future<void> _shareMergedFile() async {
//     if (_mergedFilePath == null) return;
//     await Share.shareXFiles([XFile(_mergedFilePath!)], text: 'Merged PDF');
//   }

//   void _removePdf(int index) {
//     setState(() {
//       _selectedPaths.removeAt(index);
//     });
//   }

//   void _clearAll() {
//     setState(() {
//       _selectedPaths.clear();
//       _mergedFilePath = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF Merge'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: _clearAll,
//             icon: const Icon(Icons.delete_outline_rounded),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton.icon(
//                   onPressed: _pickPdfs,
//                   icon: const Icon(Icons.picture_as_pdf_rounded),
//                   label: const Text('Pick PDF Files'),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               if (_savedLocationText != null) ...[
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Theme.of(
//                       context,
//                     ).colorScheme.surfaceContainerHighest,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(_savedLocationText!),
//                 ),
//                 const SizedBox(height: 12),
//               ],
//               Expanded(
//                 child: _selectedPaths.isEmpty
//                     ? const Center(child: Text('No PDF files selected'))
//                     : ListView.builder(
//                         itemCount: _selectedPaths.length,
//                         itemBuilder: (context, index) {
//                           final path = _selectedPaths[index];
//                           final name = path.split(Platform.pathSeparator).last;

//                           return Card(
//                             child: ListTile(
//                               leading: const Icon(Icons.picture_as_pdf_rounded),
//                               title: Text(name),
//                               subtitle: Text(path),
//                               trailing: IconButton(
//                                 onPressed: () => _removePdf(index),
//                                 icon: const Icon(Icons.close_rounded),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//               ),
//               if (_mergedFilePath != null) ...[
//                 const SizedBox(height: 12),
//                 SizedBox(
//                   width: double.infinity,
//                   child: OutlinedButton.icon(
//                     onPressed: _openMergedFile,
//                     icon: const Icon(Icons.open_in_new_rounded),
//                     label: const Text('Open Merged PDF'),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   width: double.infinity,
//                   child: OutlinedButton.icon(
//                     onPressed: _shareMergedFile,
//                     icon: const Icon(Icons.share_rounded),
//                     label: const Text('Share Merged PDF'),
//                   ),
//                 ),
//               ],
//               const SizedBox(height: 12),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton.icon(
//                   onPressed: _isMerging ? null : _mergePdfs,
//                   icon: _isMerging
//                       ? const SizedBox(
//                           width: 18,
//                           height: 18,
//                           child: CircularProgressIndicator(strokeWidth: 2),
//                         )
//                       : const Icon(Icons.merge_type_rounded),
//                   label: Text(_isMerging ? 'Merging...' : 'Merge PDFs'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfMergeScreen extends StatefulWidget {
  const PdfMergeScreen({super.key});

  @override
  State<PdfMergeScreen> createState() => _PdfMergeScreenState();
}

class _PdfMergeScreenState extends State<PdfMergeScreen> {
  final List<String> _selectedPaths = [];
  bool _isMerging = false;
  String? _mergedFilePath;
  String? _savedLocationText;

  @override
  void initState() {
    super.initState();
    _loadLastSavedInfo();
  }

  Future<void> _loadLastSavedInfo() async {
    final dir = await getApplicationDocumentsDirectory();
    if (!mounted) return;

    setState(() {
      _savedLocationText = 'App storage: ${dir.path}';
    });
  }

  Future<void> _pickPdfs() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result == null || result.files.isEmpty) return;

    final paths = result.files
        .where((file) => file.path != null)
        .map((file) => file.path!)
        .toList();

    setState(() {
      for (final path in paths) {
        if (!_selectedPaths.contains(path)) {
          _selectedPaths.add(path);
        }
      }
    });
  }

  Future<String> _savePdf(List<int> bytes) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = 'merged_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final appPath = '${appDir.path}/$fileName';
    await File(appPath).writeAsBytes(bytes, flush: true);
    return appPath;
  }

  Future<void> _mergePdfs() async {
    if (_selectedPaths.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least 2 PDF files')),
      );
      return;
    }

    setState(() => _isMerging = true);

    try {
      final mergedDocument = PdfDocument();

      for (final path in _selectedPaths) {
        final inputBytes = await File(path).readAsBytes();
        final loadedDocument = PdfDocument(inputBytes: inputBytes);

        for (int i = 0; i < loadedDocument.pages.count; i++) {
          final loadedPage = loadedDocument.pages[i];
          final template = loadedPage.createTemplate();

          final page = mergedDocument.pages.add();
          page.graphics.drawPdfTemplate(template, Offset.zero);
        }

        loadedDocument.dispose();
      }

      final bytes = await mergedDocument.save();
      mergedDocument.dispose();

      final savedPath = await _savePdf(bytes);

      if (!mounted) return;

      setState(() {
        _mergedFilePath = savedPath;
        _savedLocationText = 'Saved on device: $savedPath';
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('PDF saved successfully')));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Merge failed: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isMerging = false);
      }
    }
  }

  Future<void> _openMergedFile() async {
    if (_mergedFilePath == null) return;
    await OpenFile.open(_mergedFilePath!);
  }

  Future<void> _shareMergedFile() async {
    if (_mergedFilePath == null) return;
    await Share.shareXFiles([XFile(_mergedFilePath!)], text: 'Merged PDF');
  }

  void _removePdf(int index) {
    setState(() {
      _selectedPaths.removeAt(index);
    });
  }

  void _clearAll() {
    setState(() {
      _selectedPaths.clear();
      _mergedFilePath = null;
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
            tag: 'tool-icon-PDF Merge',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.redAccent.withOpacity(0.95),
                    Colors.redAccent.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.picture_as_pdf_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('PDF Merge'),
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
                  onPressed: _pickPdfs,
                  icon: const Icon(Icons.picture_as_pdf_rounded),
                  label: const Text('Pick PDF Files'),
                ),
              ),
              const SizedBox(height: 12),
              if (_savedLocationText != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(_savedLocationText!),
                ),
                const SizedBox(height: 12),
              ],
              Expanded(
                child: _selectedPaths.isEmpty
                    ? const Center(child: Text('No PDF files selected'))
                    : ListView.builder(
                        itemCount: _selectedPaths.length,
                        itemBuilder: (context, index) {
                          final path = _selectedPaths[index];
                          final name = path.split(Platform.pathSeparator).last;

                          return Card(
                            child: ListTile(
                              leading: const Icon(Icons.picture_as_pdf_rounded),
                              title: Text(name),
                              subtitle: Text(path),
                              trailing: IconButton(
                                onPressed: () => _removePdf(index),
                                icon: const Icon(Icons.close_rounded),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              if (_mergedFilePath != null) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _openMergedFile,
                    icon: const Icon(Icons.open_in_new_rounded),
                    label: const Text('Open Merged PDF'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _shareMergedFile,
                    icon: const Icon(Icons.share_rounded),
                    label: const Text('Share Merged PDF'),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isMerging ? null : _mergePdfs,
                  icon: _isMerging
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.merge_type_rounded),
                  label: Text(_isMerging ? 'Merging...' : 'Merge PDFs'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
