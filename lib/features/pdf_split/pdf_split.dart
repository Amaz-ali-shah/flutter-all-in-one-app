// // import 'dart:io';

// // import 'package:file_picker/file_picker.dart';
// // import 'package:flutter/material.dart';
// // import 'package:open_file/open_file.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:share_plus/share_plus.dart';
// // import 'package:syncfusion_flutter_pdf/pdf.dart';

// // class PdfSplit extends StatefulWidget {
// //   const PdfSplit({super.key});

// //   @override
// //   State<PdfSplit> createState() => _PdfSplitState();
// // }

// // class _PdfSplitState extends State<PdfSplit> {
// //   String? _selectedPdfPath;
// //   String? _outputPdfPath;
// //   bool _isProcessing = false;

// //   final TextEditingController _startPageController = TextEditingController(
// //     text: '1',
// //   );
// //   final TextEditingController _endPageController = TextEditingController(
// //     text: '1',
// //   );

// //   @override
// //   void dispose() {
// //     _startPageController.dispose();
// //     _endPageController.dispose();
// //     super.dispose();
// //   }

// //   Future<void> _pickPdf() async {
// //     final result = await FilePicker.platform.pickFiles(
// //       type: FileType.custom,
// //       allowedExtensions: ['pdf'],
// //       allowMultiple: false,
// //     );

// //     if (result == null ||
// //         result.files.isEmpty ||
// //         result.files.single.path == null) {
// //       return;
// //     }

// //     final path = result.files.single.path!;
// //     setState(() {
// //       _selectedPdfPath = path;
// //       _outputPdfPath = null;
// //     });

// //     final bytes = await File(path).readAsBytes();
// //     final doc = PdfDocument(inputBytes: bytes);
// //     final totalPages = doc.pages.count;
// //     doc.dispose();

// //     if (mounted) {
// //       _startPageController.text = '1';
// //       _endPageController.text = totalPages.toString();

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('PDF loaded. Total pages: $totalPages')),
// //       );
// //     }
// //   }

// //   Future<String> _savePdf(List<int> bytes) async {
// //     final fileName = 'split_${DateTime.now().millisecondsSinceEpoch}.pdf';

// //     if (Platform.isAndroid) {
// //       final downloadsDir = Directory('/storage/emulated/0/Download');
// //       final dir = await getApplicationDocumentsDirectory();
// //       final filePath =
// //           '${dir.path}/merged_${DateTime.now().millisecondsSinceEpoch}.pdf';
// //       await File(filePath).writeAsBytes(bytes, flush: true);
// //       if (await downloadsDir.exists()) {
// //         final publicPath = '${downloadsDir.path}/$fileName';
// //         await File(publicPath).writeAsBytes(bytes, flush: true);
// //         return publicPath;
// //       }
// //     }

// //     final appDir = await getApplicationDocumentsDirectory();
// //     final appPath = '${appDir.path}/$fileName';
// //     await File(appPath).writeAsBytes(bytes, flush: true);
// //     return appPath;
// //   }

// //   Future<void> _splitPdf() async {
// //     if (_selectedPdfPath == null) {
// //       ScaffoldMessenger.of(
// //         context,
// //       ).showSnackBar(const SnackBar(content: Text('Please pick a PDF first')));
// //       return;
// //     }

// //     final startPage = int.tryParse(_startPageController.text.trim());
// //     final endPage = int.tryParse(_endPageController.text.trim());

// //     if (startPage == null ||
// //         endPage == null ||
// //         startPage < 1 ||
// //         endPage < startPage) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Please enter a valid page range')),
// //       );
// //       return;
// //     }

// //     setState(() => _isProcessing = true);

// //     try {
// //       final inputBytes = await File(_selectedPdfPath!).readAsBytes();
// //       final loadedDocument = PdfDocument(inputBytes: inputBytes);
// //       final totalPages = loadedDocument.pages.count;

// //       if (endPage > totalPages) {
// //         loadedDocument.dispose();
// //         if (mounted) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //               content: Text('End page cannot exceed total pages ($totalPages)'),
// //             ),
// //           );
// //         }
// //         return;
// //       }

// //       final newDocument = PdfDocument();
// //       PdfSection? section;

// //       for (int pageIndex = startPage - 1; pageIndex < endPage; pageIndex++) {
// //         final template = loadedDocument.pages[pageIndex].createTemplate();

// //         if (section == null || section.pageSettings.size != template.size) {
// //           section = newDocument.sections!.add();
// //           section.pageSettings.size = template.size;
// //           section.pageSettings.margins.all = 0;
// //         }

// //         section.pages.add().graphics.drawPdfTemplate(template, Offset.zero);
// //       }

// //       loadedDocument.dispose();

// //       final bytes = await newDocument.save();
// //       newDocument.dispose();

// //       final savedPath = await _savePdf(bytes);

// //       if (!mounted) return;

// //       setState(() {
// //         _outputPdfPath = savedPath;
// //       });

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Split PDF saved successfully')),
// //       );
// //     } catch (e) {
// //       if (mounted) {
// //         ScaffoldMessenger.of(
// //           context,
// //         ).showSnackBar(SnackBar(content: Text('Split failed: $e')));
// //       }
// //     } finally {
// //       if (mounted) {
// //         setState(() => _isProcessing = false);
// //       }
// //     }
// //   }

// //   Future<void> _openSplitPdf() async {
// //     if (_outputPdfPath == null) return;
// //     await OpenFile.open(_outputPdfPath!);
// //   }

// //   Future<void> _shareSplitPdf() async {
// //     if (_outputPdfPath == null) return;
// //     await Share.shareXFiles([XFile(_outputPdfPath!)], text: 'Split PDF');
// //   }

// //   void _clearAll() {
// //     setState(() {
// //       _selectedPdfPath = null;
// //       _outputPdfPath = null;
// //       _startPageController.text = '1';
// //       _endPageController.text = '1';
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final fileName = _selectedPdfPath == null
// //         ? 'No file selected'
// //         : _selectedPdfPath!.split(Platform.pathSeparator).last;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('PDF Split'),
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
// //                 onPressed: _pickPdf,
// //                 icon: const Icon(Icons.picture_as_pdf_rounded),
// //                 label: const Text('Pick PDF File'),
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             Card(
// //               child: ListTile(
// //                 leading: const Icon(Icons.description_rounded),
// //                 title: Text(fileName),
// //                 subtitle: Text(_selectedPdfPath ?? 'Select one PDF to split'),
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _startPageController,
// //                     keyboardType: TextInputType.number,
// //                     decoration: const InputDecoration(
// //                       labelText: 'Start Page',
// //                       border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(width: 12),
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _endPageController,
// //                     keyboardType: TextInputType.number,
// //                     decoration: const InputDecoration(
// //                       labelText: 'End Page',
// //                       border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 16),
// //             if (_outputPdfPath != null) ...[
// //               Container(
// //                 width: double.infinity,
// //                 padding: const EdgeInsets.all(12),
// //                 decoration: BoxDecoration(
// //                   color: Theme.of(context).colorScheme.surfaceContainerHighest,
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 child: Text('Saved on device: $_outputPdfPath'),
// //               ),
// //               const SizedBox(height: 12),
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: OutlinedButton.icon(
// //                   onPressed: _openSplitPdf,
// //                   icon: const Icon(Icons.open_in_new_rounded),
// //                   label: const Text('Open Split PDF'),
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: OutlinedButton.icon(
// //                   onPressed: _shareSplitPdf,
// //                   icon: const Icon(Icons.share_rounded),
// //                   label: const Text('Share Split PDF'),
// //                 ),
// //               ),
// //             ],
// //             const Spacer(),
// //             SizedBox(
// //               width: double.infinity,
// //               child: ElevatedButton.icon(
// //                 onPressed: _isProcessing ? null : _splitPdf,
// //                 icon: _isProcessing
// //                     ? const SizedBox(
// //                         width: 18,
// //                         height: 18,
// //                         child: CircularProgressIndicator(strokeWidth: 2),
// //                       )
// //                     : const Icon(Icons.call_split_rounded),
// //                 label: Text(_isProcessing ? 'Splitting...' : 'Split PDF'),
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

// class PdfSplit extends StatefulWidget {
//   const PdfSplit({super.key});

//   @override
//   State<PdfSplit> createState() => _PdfSplitState();
// }

// class _PdfSplitState extends State<PdfSplit> {
//   String? _selectedPdfPath;
//   String? _outputPdfPath;
//   bool _isProcessing = false;

//   final TextEditingController _startPageController = TextEditingController(
//     text: '1',
//   );
//   final TextEditingController _endPageController = TextEditingController(
//     text: '1',
//   );

//   @override
//   void dispose() {
//     _startPageController.dispose();
//     _endPageController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickPdf() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//       allowMultiple: false,
//     );

//     if (result == null ||
//         result.files.isEmpty ||
//         result.files.single.path == null) {
//       return;
//     }

//     final path = result.files.single.path!;
//     setState(() {
//       _selectedPdfPath = path;
//       _outputPdfPath = null;
//     });

//     final bytes = await File(path).readAsBytes();
//     final doc = PdfDocument(inputBytes: bytes);
//     final totalPages = doc.pages.count;
//     doc.dispose();

//     if (!mounted) return;

//     _startPageController.text = '1';
//     _endPageController.text = totalPages.toString();

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('PDF loaded. Total pages: $totalPages')),
//     );
//   }

//   Future<String> _savePdf(List<int> bytes) async {
//     final fileName = 'split_${DateTime.now().millisecondsSinceEpoch}.pdf';
//     final dir = await getApplicationDocumentsDirectory();
//     final filePath = '${dir.path}/$fileName';
//     await File(filePath).writeAsBytes(bytes, flush: true);
//     return filePath;
//   }

//   Future<void> _splitPdf() async {
//     if (_selectedPdfPath == null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Please pick a PDF first')));
//       return;
//     }

//     final startPage = int.tryParse(_startPageController.text.trim());
//     final endPage = int.tryParse(_endPageController.text.trim());

//     if (startPage == null ||
//         endPage == null ||
//         startPage < 1 ||
//         endPage < startPage) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a valid page range')),
//       );
//       return;
//     }

//     setState(() => _isProcessing = true);

//     try {
//       final inputBytes = await File(_selectedPdfPath!).readAsBytes();
//       final loadedDocument = PdfDocument(inputBytes: inputBytes);
//       final totalPages = loadedDocument.pages.count;

//       if (endPage > totalPages) {
//         loadedDocument.dispose();
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('End page cannot exceed total pages ($totalPages)'),
//             ),
//           );
//         }
//         return;
//       }

//       final newDocument = PdfDocument();

//       for (int pageIndex = startPage - 1; pageIndex < endPage; pageIndex++) {
//         final loadedPage = loadedDocument.pages[pageIndex];
//         final template = loadedPage.createTemplate();

//         final page = newDocument.pages.add();
//         page.graphics.drawPdfTemplate(template, Offset.zero);
//       }

//       loadedDocument.dispose();

//       final bytes = await newDocument.save();
//       newDocument.dispose();

//       final savedPath = await _savePdf(bytes);

//       if (!mounted) return;

//       setState(() {
//         _outputPdfPath = savedPath;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Split PDF saved successfully')),
//       );
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text('Split failed: $e')));
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isProcessing = false);
//       }
//     }
//   }

//   Future<void> _openSplitPdf() async {
//     if (_outputPdfPath == null) return;
//     await OpenFile.open(_outputPdfPath!);
//   }

//   Future<void> _shareSplitPdf() async {
//     if (_outputPdfPath == null) return;
//     await Share.shareXFiles([XFile(_outputPdfPath!)], text: 'Split PDF');
//   }

//   void _clearAll() {
//     setState(() {
//       _selectedPdfPath = null;
//       _outputPdfPath = null;
//       _startPageController.text = '1';
//       _endPageController.text = '1';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final fileName = _selectedPdfPath == null
//         ? 'No file selected'
//         : _selectedPdfPath!.split(Platform.pathSeparator).last;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF Split'),
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
//                 onPressed: _pickPdf,
//                 icon: const Icon(Icons.picture_as_pdf_rounded),
//                 label: const Text('Pick PDF File'),
//               ),
//               const SizedBox(height: 12),
//               Card(
//                 child: ListTile(
//                   leading: const Icon(Icons.description_rounded),
//                   title: Text(fileName),
//                   subtitle: Text(_selectedPdfPath ?? 'Select one PDF to split'),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _startPageController,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                         labelText: 'Start Page',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: TextField(
//                       controller: _endPageController,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                         labelText: 'End Page',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               if (_outputPdfPath != null) ...[
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Theme.of(
//                       context,
//                     ).colorScheme.surfaceContainerHighest,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text('Saved on device: $_outputPdfPath'),
//                 ),
//                 const SizedBox(height: 12),
//                 OutlinedButton.icon(
//                   onPressed: _openSplitPdf,
//                   icon: const Icon(Icons.open_in_new_rounded),
//                   label: const Text('Open Split PDF'),
//                 ),
//                 const SizedBox(height: 10),
//                 OutlinedButton.icon(
//                   onPressed: _shareSplitPdf,
//                   icon: const Icon(Icons.share_rounded),
//                   label: const Text('Share Split PDF'),
//                 ),
//                 const SizedBox(height: 12),
//               ],
//               ElevatedButton.icon(
//                 onPressed: _isProcessing ? null : _splitPdf,
//                 icon: _isProcessing
//                     ? const SizedBox(
//                         width: 18,
//                         height: 18,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       )
//                     : const Icon(Icons.call_split_rounded),
//                 label: Text(_isProcessing ? 'Splitting...' : 'Split PDF'),
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

class PdfSplit extends StatefulWidget {
  const PdfSplit({super.key});

  @override
  State<PdfSplit> createState() => _PdfSplitState();
}

class _PdfSplitState extends State<PdfSplit> {
  String? _selectedPdfPath;
  String? _outputPdfPath;
  bool _isProcessing = false;

  final TextEditingController _startPageController = TextEditingController(
    text: '1',
  );
  final TextEditingController _endPageController = TextEditingController(
    text: '1',
  );

  @override
  void dispose() {
    _startPageController.dispose();
    _endPageController.dispose();
    super.dispose();
  }

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result == null ||
        result.files.isEmpty ||
        result.files.single.path == null) {
      return;
    }

    final path = result.files.single.path!;
    setState(() {
      _selectedPdfPath = path;
      _outputPdfPath = null;
    });

    final bytes = await File(path).readAsBytes();
    final doc = PdfDocument(inputBytes: bytes);
    final totalPages = doc.pages.count;
    doc.dispose();

    if (!mounted) return;

    _startPageController.text = '1';
    _endPageController.text = totalPages.toString();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF loaded. Total pages: $totalPages')),
    );
  }

  Future<String> _savePdf(List<int> bytes) async {
    final fileName = 'split_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/$fileName';
    await File(filePath).writeAsBytes(bytes, flush: true);
    return filePath;
  }

  Future<void> _splitPdf() async {
    if (_selectedPdfPath == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please pick a PDF first')));
      return;
    }

    final startPage = int.tryParse(_startPageController.text.trim());
    final endPage = int.tryParse(_endPageController.text.trim());

    if (startPage == null ||
        endPage == null ||
        startPage < 1 ||
        endPage < startPage) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid page range')),
      );
      return;
    }

    setState(() => _isProcessing = true);

    try {
      final inputBytes = await File(_selectedPdfPath!).readAsBytes();
      final loadedDocument = PdfDocument(inputBytes: inputBytes);
      final totalPages = loadedDocument.pages.count;

      if (endPage > totalPages) {
        loadedDocument.dispose();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('End page cannot exceed total pages ($totalPages)'),
            ),
          );
        }
        return;
      }

      final newDocument = PdfDocument();

      for (int pageIndex = startPage - 1; pageIndex < endPage; pageIndex++) {
        final loadedPage = loadedDocument.pages[pageIndex];
        final template = loadedPage.createTemplate();

        final page = newDocument.pages.add();
        page.graphics.drawPdfTemplate(template, Offset.zero);
      }

      loadedDocument.dispose();

      final bytes = await newDocument.save();
      newDocument.dispose();

      final savedPath = await _savePdf(bytes);

      if (!mounted) return;

      setState(() {
        _outputPdfPath = savedPath;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Split PDF saved successfully')),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Split failed: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _openSplitPdf() async {
    if (_outputPdfPath == null) return;
    await OpenFile.open(_outputPdfPath!);
  }

  Future<void> _shareSplitPdf() async {
    if (_outputPdfPath == null) return;
    await Share.shareXFiles([XFile(_outputPdfPath!)], text: 'Split PDF');
  }

  void _clearAll() {
    setState(() {
      _selectedPdfPath = null;
      _outputPdfPath = null;
      _startPageController.text = '1';
      _endPageController.text = '1';
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final fileName = _selectedPdfPath == null
        ? 'No file selected'
        : _selectedPdfPath!.split(Platform.pathSeparator).last;

    return Scaffold(
      appBar: AppBar(
        // ── Hero icon matching the card ──
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'tool-icon-PDF Split',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.withOpacity(0.95),
                    Colors.pink.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.call_split_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('PDF Split'),
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
                onPressed: _pickPdf,
                icon: const Icon(Icons.picture_as_pdf_rounded),
                label: const Text('Pick PDF File'),
              ),
              const SizedBox(height: 12),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.description_rounded),
                  title: Text(fileName),
                  subtitle: Text(_selectedPdfPath ?? 'Select one PDF to split'),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _startPageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Start Page',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _endPageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'End Page',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
                  child: Text('Saved on device: $_outputPdfPath'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _openSplitPdf,
                  icon: const Icon(Icons.open_in_new_rounded),
                  label: const Text('Open Split PDF'),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: _shareSplitPdf,
                  icon: const Icon(Icons.share_rounded),
                  label: const Text('Share Split PDF'),
                ),
                const SizedBox(height: 12),
              ],
              ElevatedButton.icon(
                onPressed: _isProcessing ? null : _splitPdf,
                icon: _isProcessing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.call_split_rounded),
                label: Text(_isProcessing ? 'Splitting...' : 'Split PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
