// // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // import 'package:provider/provider.dart';

// // // // // // // // // // // // // import '../services/theme_service.dart';
// // // // // // // // // // // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // // // // // // // // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // // // // // // // // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // // // // // // // // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // // // // // // // // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // // // // // // // // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // // // // // // // // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // // // // // // // // // // import '../features/pdf_split/pdf_split.dart';
// // // // // // // // // // // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // // // // // // // // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // // // // // // // // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // // // // // // // // // // import '../features/image_converter/image_converter_screen.dart';

// // // // // // // // // // // // // class HomeScreen extends StatefulWidget {
// // // // // // // // // // // // //   const HomeScreen({super.key});

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // // // // // // // // // // }

// // // // // // // // // // // // // class _HomeScreenState extends State<HomeScreen> {
// // // // // // // // // // // // //   final TextEditingController _searchController = TextEditingController();
// // // // // // // // // // // // //   String _query = '';
// // // // // // // // // // // // //   String _selectedCategory = 'All';

// // // // // // // // // // // // //   final List<String> _categories = [
// // // // // // // // // // // // //     'All',
// // // // // // // // // // // // //     'Media',
// // // // // // // // // // // // //     'PDF',
// // // // // // // // // // // // //     'Calculators',
// // // // // // // // // // // // //     'Scanning',
// // // // // // // // // // // // //   ];

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   void initState() {
// // // // // // // // // // // // //     super.initState();
// // // // // // // // // // // // //     _searchController.addListener(() {
// // // // // // // // // // // // //       setState(() {
// // // // // // // // // // // // //         _query = _searchController.text.toLowerCase().trim();
// // // // // // // // // // // // //       });
// // // // // // // // // // // // //     });
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // //     _searchController.dispose();
// // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   List<_ToolItem> _tools(BuildContext context) {
// // // // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // // // //     return [
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'QR Code Generator',
// // // // // // // // // // // // //         subtitle: 'Create modern QR codes',
// // // // // // // // // // // // //         icon: Icons.qr_code_rounded,
// // // // // // // // // // // // //         color: colorScheme.primary,
// // // // // // // // // // // // //         category: 'Scanning',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const QrCodeGeneratorScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'Barcode Generator',
// // // // // // // // // // // // //         subtitle: 'Generate barcodes instantly',
// // // // // // // // // // // // //         icon: Icons.document_scanner,
// // // // // // // // // // // // //         color: Colors.teal,
// // // // // // // // // // // // //         category: 'Scanning',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const BarcodeGeneratorScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'Image Compressor',
// // // // // // // // // // // // //         subtitle: 'Reduce image size fast',
// // // // // // // // // // // // //         icon: Icons.compress_rounded,
// // // // // // // // // // // // //         color: Colors.green,
// // // // // // // // // // // // //         category: 'Media',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const ImageCompressorScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'Age Calculator',
// // // // // // // // // // // // //         subtitle: 'Calculate exact age',
// // // // // // // // // // // // //         icon: Icons.cake_rounded,
// // // // // // // // // // // // //         color: Colors.orange,
// // // // // // // // // // // // //         category: 'Calculators',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const AgeCalculatorScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'BMI Calculator',
// // // // // // // // // // // // //         subtitle: 'Track your body mass index',
// // // // // // // // // // // // //         icon: Icons.monitor_weight_rounded,
// // // // // // // // // // // // //         color: Colors.cyan,
// // // // // // // // // // // // //         category: 'Calculators',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const BmiCalculatorScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'Unit Converter',
// // // // // // // // // // // // //         subtitle: 'Convert units quickly',
// // // // // // // // // // // // //         icon: Icons.swap_horiz_rounded,
// // // // // // // // // // // // //         color: Colors.indigo,
// // // // // // // // // // // // //         category: 'Calculators',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const UnitConverterScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'PDF Merge',
// // // // // // // // // // // // //         subtitle: 'Join multiple PDFs',
// // // // // // // // // // // // //         icon: Icons.picture_as_pdf_rounded,
// // // // // // // // // // // // //         color: Colors.redAccent,
// // // // // // // // // // // // //         category: 'PDF',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const PdfMergeScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'PDF Split',
// // // // // // // // // // // // //         subtitle: 'Split PDF pages',
// // // // // // // // // // // // //         icon: Icons.call_split_rounded,
// // // // // // // // // // // // //         color: Colors.pink,
// // // // // // // // // // // // //         category: 'PDF',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const PdfSplit()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'Image to PDF',
// // // // // // // // // // // // //         subtitle: 'Convert images to PDF',
// // // // // // // // // // // // //         icon: Icons.insert_drive_file_rounded,
// // // // // // // // // // // // //         color: Colors.brown,
// // // // // // // // // // // // //         category: 'Media',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const ImageToPdfScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'Image Converter',
// // // // // // // // // // // // //         subtitle: 'Change image formats',
// // // // // // // // // // // // //         icon: Icons.image_rounded,
// // // // // // // // // // // // //         color: Colors.deepOrange,
// // // // // // // // // // // // //         category: 'Media',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const ImageConverterScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'Image Resizer',
// // // // // // // // // // // // //         subtitle: 'Resize images precisely',
// // // // // // // // // // // // //         icon: Icons.photo_size_select_large_rounded,
// // // // // // // // // // // // //         color: Colors.blue,
// // // // // // // // // // // // //         category: 'Media',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const ImageResizerScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // // //         title: 'QR / Barcode Scanner',
// // // // // // // // // // // // //         subtitle: 'Scan codes with camera',
// // // // // // // // // // // // //         icon: Icons.document_scanner_rounded,
// // // // // // // // // // // // //         color: Colors.deepPurple,
// // // // // // // // // // // // //         category: 'Scanning',
// // // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // // //           context,
// // // // // // // // // // // // //           MaterialPageRoute(builder: (_) => const QrBarcodeScannerScreen()),
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //     ];
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // //     final themeService = context.watch<ThemeService>();
// // // // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // // // //     final allTools = _tools(context);
// // // // // // // // // // // // //     final filteredTools = allTools.where((tool) {
// // // // // // // // // // // // //       final matchesQuery =
// // // // // // // // // // // // //           _query.isEmpty ||
// // // // // // // // // // // // //           tool.title.toLowerCase().contains(_query) ||
// // // // // // // // // // // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // // // // // // // // // // //           tool.category.toLowerCase().contains(_query);

// // // // // // // // // // // // //       final matchesCategory =
// // // // // // // // // // // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;

// // // // // // // // // // // // //       return matchesQuery && matchesCategory;
// // // // // // // // // // // // //     }).toList();

// // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // //       body: SafeArea(
// // // // // // // // // // // // //         child: CustomScrollView(
// // // // // // // // // // // // //           slivers: [
// // // // // // // // // // // // //             SliverToBoxAdapter(
// // // // // // // // // // // // //               child: Padding(
// // // // // // // // // // // // //                 padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // // // // // // // // //                 child: Column(
// // // // // // // // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // // //                   children: [
// // // // // // // // // // // // //                     Row(
// // // // // // // // // // // // //                       children: [
// // // // // // // // // // // // //                         Container(
// // // // // // // // // // // // //                           width: 54,
// // // // // // // // // // // // //                           height: 54,
// // // // // // // // // // // // //                           decoration: BoxDecoration(
// // // // // // // // // // // // //                             gradient: LinearGradient(
// // // // // // // // // // // // //                               colors: [
// // // // // // // // // // // // //                                 colorScheme.primary,
// // // // // // // // // // // // //                                 colorScheme.tertiary,
// // // // // // // // // // // // //                               ],
// // // // // // // // // // // // //                             ),
// // // // // // // // // // // // //                             borderRadius: BorderRadius.circular(18),
// // // // // // // // // // // // //                           ),
// // // // // // // // // // // // //                           child: const Icon(
// // // // // // // // // // // // //                             Icons.dashboard_rounded,
// // // // // // // // // // // // //                             color: Colors.white,
// // // // // // // // // // // // //                             size: 30,
// // // // // // // // // // // // //                           ),
// // // // // // // // // // // // //                         ),
// // // // // // // // // // // // //                         const SizedBox(width: 14),
// // // // // // // // // // // // //                         Expanded(
// // // // // // // // // // // // //                           child: Column(
// // // // // // // // // // // // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // // //                             children: [
// // // // // // // // // // // // //                               Text(
// // // // // // // // // // // // //                                 'ToolKit Pro',
// // // // // // // // // // // // //                                 style: Theme.of(context).textTheme.headlineSmall
// // // // // // // // // // // // //                                     ?.copyWith(
// // // // // // // // // // // // //                                       fontWeight: FontWeight.w900,
// // // // // // // // // // // // //                                       letterSpacing: -0.5,
// // // // // // // // // // // // //                                     ),
// // // // // // // // // // // // //                               ),
// // // // // // // // // // // // //                               const SizedBox(height: 4),
// // // // // // // // // // // // //                               Text(
// // // // // // // // // // // // //                                 'Fast utilities, clean workflow, pro interface',
// // // // // // // // // // // // //                                 style: Theme.of(context).textTheme.bodyMedium
// // // // // // // // // // // // //                                     ?.copyWith(
// // // // // // // // // // // // //                                       color: colorScheme.onSurfaceVariant,
// // // // // // // // // // // // //                                     ),
// // // // // // // // // // // // //                               ),
// // // // // // // // // // // // //                             ],
// // // // // // // // // // // // //                           ),
// // // // // // // // // // // // //                         ),
// // // // // // // // // // // // //                         IconButton.filledTonal(
// // // // // // // // // // // // //                           onPressed: () =>
// // // // // // // // // // // // //                               context.read<ThemeService>().toggleTheme(),
// // // // // // // // // // // // //                           icon: Icon(
// // // // // // // // // // // // //                             themeService.isDark
// // // // // // // // // // // // //                                 ? Icons.light_mode_rounded
// // // // // // // // // // // // //                                 : Icons.dark_mode_rounded,
// // // // // // // // // // // // //                           ),
// // // // // // // // // // // // //                         ),
// // // // // // // // // // // // //                       ],
// // // // // // // // // // // // //                     ),
// // // // // // // // // // // // //                     const SizedBox(height: 18),
// // // // // // // // // // // // //                     Container(
// // // // // // // // // // // // //                       width: double.infinity,
// // // // // // // // // // // // //                       padding: const EdgeInsets.all(18),
// // // // // // // // // // // // //                       decoration: BoxDecoration(
// // // // // // // // // // // // //                         borderRadius: BorderRadius.circular(26),
// // // // // // // // // // // // //                         gradient: LinearGradient(
// // // // // // // // // // // // //                           begin: Alignment.topLeft,
// // // // // // // // // // // // //                           end: Alignment.bottomRight,
// // // // // // // // // // // // //                           colors: [
// // // // // // // // // // // // //                             colorScheme.primaryContainer,
// // // // // // // // // // // // //                             colorScheme.tertiaryContainer,
// // // // // // // // // // // // //                           ],
// // // // // // // // // // // // //                         ),
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                       child: Row(
// // // // // // // // // // // // //                         children: [
// // // // // // // // // // // // //                           Expanded(
// // // // // // // // // // // // //                             child: Column(
// // // // // // // // // // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // // //                               children: [
// // // // // // // // // // // // //                                 Text(
// // // // // // // // // // // // //                                   'Professional workspace',
// // // // // // // // // // // // //                                   style: Theme.of(context).textTheme.titleLarge
// // // // // // // // // // // // //                                       ?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // // // // // //                                 ),
// // // // // // // // // // // // //                                 const SizedBox(height: 8),
// // // // // // // // // // // // //                                 Text(
// // // // // // // // // // // // //                                   'Search, launch, and manage your tools from one premium dashboard.',
// // // // // // // // // // // // //                                   style: Theme.of(context).textTheme.bodyMedium,
// // // // // // // // // // // // //                                 ),
// // // // // // // // // // // // //                               ],
// // // // // // // // // // // // //                             ),
// // // // // // // // // // // // //                           ),
// // // // // // // // // // // // //                           const SizedBox(width: 12),
// // // // // // // // // // // // //                           Container(
// // // // // // // // // // // // //                             width: 66,
// // // // // // // // // // // // //                             height: 66,
// // // // // // // // // // // // //                             decoration: BoxDecoration(
// // // // // // // // // // // // //                               color: colorScheme.surface.withOpacity(0.35),
// // // // // // // // // // // // //                               borderRadius: BorderRadius.circular(20),
// // // // // // // // // // // // //                             ),
// // // // // // // // // // // // //                             child: Icon(
// // // // // // // // // // // // //                               Icons.auto_awesome_rounded,
// // // // // // // // // // // // //                               size: 34,
// // // // // // // // // // // // //                               color: colorScheme.onPrimaryContainer,
// // // // // // // // // // // // //                             ),
// // // // // // // // // // // // //                           ),
// // // // // // // // // // // // //                         ],
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                     ),
// // // // // // // // // // // // //                     const SizedBox(height: 18),
// // // // // // // // // // // // //                     SearchBar(
// // // // // // // // // // // // //                       controller: _searchController,
// // // // // // // // // // // // //                       hintText: 'Search tools, calculators, PDFs...',
// // // // // // // // // // // // //                       leading: const Icon(Icons.search_rounded),
// // // // // // // // // // // // //                       trailing: const [Icon(Icons.tune_rounded)],
// // // // // // // // // // // // //                       elevation: const WidgetStatePropertyAll(0),
// // // // // // // // // // // // //                       backgroundColor: WidgetStatePropertyAll(
// // // // // // // // // // // // //                         colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                       padding: const WidgetStatePropertyAll(
// // // // // // // // // // // // //                         EdgeInsets.symmetric(horizontal: 18),
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                     ),
// // // // // // // // // // // // //                   ],
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //             SliverToBoxAdapter(
// // // // // // // // // // // // //               child: Padding(
// // // // // // // // // // // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // // // // // //                 child: SizedBox(
// // // // // // // // // // // // //                   height: 42,
// // // // // // // // // // // // //                   child: ListView.separated(
// // // // // // // // // // // // //                     scrollDirection: Axis.horizontal,
// // // // // // // // // // // // //                     itemCount: _categories.length,
// // // // // // // // // // // // //                     separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // // // // // // // // //                     itemBuilder: (context, index) {
// // // // // // // // // // // // //                       final category = _categories[index];
// // // // // // // // // // // // //                       final selected = category == _selectedCategory;

// // // // // // // // // // // // //                       return ChoiceChip(
// // // // // // // // // // // // //                         label: Text(category),
// // // // // // // // // // // // //                         selected: selected,
// // // // // // // // // // // // //                         onSelected: (_) {
// // // // // // // // // // // // //                           setState(() {
// // // // // // // // // // // // //                             _selectedCategory = category;
// // // // // // // // // // // // //                           });
// // // // // // // // // // // // //                         },
// // // // // // // // // // // // //                       );
// // // // // // // // // // // // //                     },
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //             SliverToBoxAdapter(
// // // // // // // // // // // // //               child: Padding(
// // // // // // // // // // // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // // // // // //                 child: Row(
// // // // // // // // // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // // // // // //                   children: [
// // // // // // // // // // // // //                     Text(
// // // // // // // // // // // // //                       'Featured tools',
// // // // // // // // // // // // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // // // // // // // // // //                         fontWeight: FontWeight.w800,
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                     ),
// // // // // // // // // // // // //                     Text(
// // // // // // // // // // // // //                       '${filteredTools.length} shown',
// // // // // // // // // // // // //                       style: TextStyle(
// // // // // // // // // // // // //                         color: colorScheme.primary,
// // // // // // // // // // // // //                         fontWeight: FontWeight.w700,
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                     ),
// // // // // // // // // // // // //                   ],
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //             if (filteredTools.isEmpty)
// // // // // // // // // // // // //               SliverFillRemaining(
// // // // // // // // // // // // //                 hasScrollBody: false,
// // // // // // // // // // // // //                 child: _EmptyState(query: _query, category: _selectedCategory),
// // // // // // // // // // // // //               )
// // // // // // // // // // // // //             else
// // // // // // // // // // // // //               SliverPadding(
// // // // // // // // // // // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // // // // // // // // //                 sliver: SliverGrid(
// // // // // // // // // // // // //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // // // // // // // //                     crossAxisCount: 2,
// // // // // // // // // // // // //                     mainAxisSpacing: 14,
// // // // // // // // // // // // //                     crossAxisSpacing: 14,
// // // // // // // // // // // // //                     childAspectRatio: 0.82,
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                   delegate: SliverChildBuilderDelegate((context, index) {
// // // // // // // // // // // // //                     final tool = filteredTools[index];
// // // // // // // // // // // // //                     return _ToolCard(tool: tool);
// // // // // // // // // // // // //                   }, childCount: filteredTools.length),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //           ],
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //     );
// // // // // // // // // // // // //   }
// // // // // // // // // // // // // }

// // // // // // // // // // // // // class _ToolCard extends StatelessWidget {
// // // // // // // // // // // // //   final _ToolItem tool;
// // // // // // // // // // // // //   const _ToolCard({required this.tool});

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // // // //     return InkWell(
// // // // // // // // // // // // //       borderRadius: BorderRadius.circular(24),
// // // // // // // // // // // // //       onTap: tool.implemented
// // // // // // // // // // // // //           ? tool.onTap
// // // // // // // // // // // // //           : () {
// // // // // // // // // // // // //               ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // // // // // //                 SnackBar(
// // // // // // // // // // // // //                   content: Text('${tool.title} is coming soon.'),
// // // // // // // // // // // // //                   behavior: SnackBarBehavior.floating,
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //               );
// // // // // // // // // // // // //             },
// // // // // // // // // // // // //       child: Container(
// // // // // // // // // // // // //         decoration: BoxDecoration(
// // // // // // // // // // // // //           color: colorScheme.surface,
// // // // // // // // // // // // //           borderRadius: BorderRadius.circular(24),
// // // // // // // // // // // // //           border: Border.all(
// // // // // // // // // // // // //             color: colorScheme.outlineVariant.withOpacity(0.25),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //           boxShadow: [
// // // // // // // // // // // // //             BoxShadow(
// // // // // // // // // // // // //               color: Colors.black.withOpacity(0.05),
// // // // // // // // // // // // //               blurRadius: 20,
// // // // // // // // // // // // //               offset: const Offset(0, 10),
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //           ],
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //         child: Stack(
// // // // // // // // // // // // //           children: [
// // // // // // // // // // // // //             Positioned(
// // // // // // // // // // // // //               top: 14,
// // // // // // // // // // // // //               right: 14,
// // // // // // // // // // // // //               child: Container(
// // // // // // // // // // // // //                 padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
// // // // // // // // // // // // //                 decoration: BoxDecoration(
// // // // // // // // // // // // //                   color: tool.implemented
// // // // // // // // // // // // //                       ? tool.color.withOpacity(0.12)
// // // // // // // // // // // // //                       : Colors.grey.withOpacity(0.12),
// // // // // // // // // // // // //                   borderRadius: BorderRadius.circular(999),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //                 child: Text(
// // // // // // // // // // // // //                   tool.implemented ? 'Live' : 'Soon',
// // // // // // // // // // // // //                   style: TextStyle(
// // // // // // // // // // // // //                     fontSize: 10,
// // // // // // // // // // // // //                     fontWeight: FontWeight.w800,
// // // // // // // // // // // // //                     color: tool.implemented ? tool.color : Colors.grey,
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //             Padding(
// // // // // // // // // // // // //               padding: const EdgeInsets.all(16),
// // // // // // // // // // // // //               child: Column(
// // // // // // // // // // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // // // // // //                 children: [
// // // // // // // // // // // // //                   Container(
// // // // // // // // // // // // //                     width: 56,
// // // // // // // // // // // // //                     height: 56,
// // // // // // // // // // // // //                     decoration: BoxDecoration(
// // // // // // // // // // // // //                       gradient: LinearGradient(
// // // // // // // // // // // // //                         colors: [
// // // // // // // // // // // // //                           tool.color.withOpacity(0.95),
// // // // // // // // // // // // //                           tool.color.withOpacity(0.55),
// // // // // // // // // // // // //                         ],
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                       borderRadius: BorderRadius.circular(18),
// // // // // // // // // // // // //                     ),
// // // // // // // // // // // // //                     child: Icon(tool.icon, color: Colors.white, size: 29),
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                   Column(
// // // // // // // // // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // // //                     children: [
// // // // // // // // // // // // //                       Text(
// // // // // // // // // // // // //                         tool.title,
// // // // // // // // // // // // //                         style: const TextStyle(
// // // // // // // // // // // // //                           fontSize: 15,
// // // // // // // // // // // // //                           fontWeight: FontWeight.w800,
// // // // // // // // // // // // //                         ),
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                       const SizedBox(height: 6),
// // // // // // // // // // // // //                       Text(
// // // // // // // // // // // // //                         tool.subtitle,
// // // // // // // // // // // // //                         maxLines: 2,
// // // // // // // // // // // // //                         style: TextStyle(
// // // // // // // // // // // // //                           color: colorScheme.onSurfaceVariant,
// // // // // // // // // // // // //                           fontSize: 12.5,
// // // // // // // // // // // // //                           height: 1.25,
// // // // // // // // // // // // //                         ),
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                     ],
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                 ],
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //           ],
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //     );
// // // // // // // // // // // // //   }
// // // // // // // // // // // // // }

// // // // // // // // // // // // // class _EmptyState extends StatelessWidget {
// // // // // // // // // // // // //   final String query;
// // // // // // // // // // // // //   final String category;

// // // // // // // // // // // // //   const _EmptyState({required this.query, required this.category});

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // // // //     return Center(
// // // // // // // // // // // // //       child: Padding(
// // // // // // // // // // // // //         padding: const EdgeInsets.all(24),
// // // // // // // // // // // // //         child: Column(
// // // // // // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // // // // // //           children: [
// // // // // // // // // // // // //             Container(
// // // // // // // // // // // // //               width: 94,
// // // // // // // // // // // // //               height: 94,
// // // // // // // // // // // // //               decoration: BoxDecoration(
// // // // // // // // // // // // //                 color: colorScheme.primaryContainer,
// // // // // // // // // // // // //                 borderRadius: BorderRadius.circular(28),
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //               child: Icon(
// // // // // // // // // // // // //                 Icons.search_off_rounded,
// // // // // // // // // // // // //                 size: 44,
// // // // // // // // // // // // //                 color: colorScheme.onPrimaryContainer,
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //             const SizedBox(height: 18),
// // // // // // // // // // // // //             Text(
// // // // // // // // // // // // //               'No matching tools',
// // // // // // // // // // // // //               style: Theme.of(
// // // // // // // // // // // // //                 context,
// // // // // // // // // // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //             const SizedBox(height: 8),
// // // // // // // // // // // // //             Text(
// // // // // // // // // // // // //               query.isEmpty
// // // // // // // // // // // // //                   ? 'No tools found in $category.'
// // // // // // // // // // // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // // // // // // // // // // //               textAlign: TextAlign.center,
// // // // // // // // // // // // //               style: TextStyle(
// // // // // // // // // // // // //                 color: colorScheme.onSurfaceVariant,
// // // // // // // // // // // // //                 height: 1.4,
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //           ],
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //     );
// // // // // // // // // // // // //   }
// // // // // // // // // // // // // }

// // // // // // // // // // // // // class _ToolItem {
// // // // // // // // // // // // //   final String title;
// // // // // // // // // // // // //   final String subtitle;
// // // // // // // // // // // // //   final IconData icon;
// // // // // // // // // // // // //   final Color color;
// // // // // // // // // // // // //   final String category;
// // // // // // // // // // // // //   final bool implemented;
// // // // // // // // // // // // //   final VoidCallback? onTap;

// // // // // // // // // // // // //   const _ToolItem({
// // // // // // // // // // // // //     required this.title,
// // // // // // // // // // // // //     required this.subtitle,
// // // // // // // // // // // // //     required this.icon,
// // // // // // // // // // // // //     required this.color,
// // // // // // // // // // // // //     required this.category,
// // // // // // // // // // // // //     required this.implemented,
// // // // // // // // // // // // //     this.onTap,
// // // // // // // // // // // // //   });
// // // // // // // // // // // // // }
// // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // import 'package:provider/provider.dart';

// // // // // // // // // // // // import '../services/theme_service.dart';
// // // // // // // // // // // // import '../utils/app_transitions.dart';
// // // // // // // // // // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // // // // // // // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // // // // // // // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // // // // // // // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // // // // // // // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // // // // // // // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // // // // // // // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // // // // // // // // // import '../features/pdf_split/pdf_split.dart';
// // // // // // // // // // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // // // // // // // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // // // // // // // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // // // // // // // // // import '../features/image_converter/image_converter_screen.dart';

// // // // // // // // // // // // class HomeScreen extends StatefulWidget {
// // // // // // // // // // // //   const HomeScreen({super.key});

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // // // // // // // // // }

// // // // // // // // // // // // class _HomeScreenState extends State<HomeScreen>
// // // // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // // // //   final TextEditingController _searchController = TextEditingController();
// // // // // // // // // // // //   String _query = '';
// // // // // // // // // // // //   String _selectedCategory = 'All';

// // // // // // // // // // // //   // Controls the initial fade-in of the home screen itself.
// // // // // // // // // // // //   late final AnimationController _fadeInController;
// // // // // // // // // // // //   late final Animation<double> _fadeIn;

// // // // // // // // // // // //   final List<String> _categories = [
// // // // // // // // // // // //     'All',
// // // // // // // // // // // //     'Media',
// // // // // // // // // // // //     'PDF',
// // // // // // // // // // // //     'Calculators',
// // // // // // // // // // // //     'Scanning',
// // // // // // // // // // // //   ];

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void initState() {
// // // // // // // // // // // //     super.initState();

// // // // // // // // // // // //     _fadeInController = AnimationController(
// // // // // // // // // // // //       vsync: this,
// // // // // // // // // // // //       duration: const Duration(milliseconds: 520),
// // // // // // // // // // // //     );
// // // // // // // // // // // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // // // // // // // // // // //     // Small delay so the first frame is fully laid out before animating.
// // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // //       _fadeInController.forward();
// // // // // // // // // // // //     });

// // // // // // // // // // // //     _searchController.addListener(() {
// // // // // // // // // // // //       setState(() {
// // // // // // // // // // // //         _query = _searchController.text.toLowerCase().trim();
// // // // // // // // // // // //       });
// // // // // // // // // // // //     });
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // //     _fadeInController.dispose();
// // // // // // // // // // // //     _searchController.dispose();
// // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // //   }

// // // // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // // // //   // Tool definitions
// // // // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // // // //   List<_ToolItem> _tools(BuildContext context) {
// // // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // // //     return [
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'QR Code Generator',
// // // // // // // // // // // //         subtitle: 'Create modern QR codes',
// // // // // // // // // // // //         icon: Icons.qr_code_rounded,
// // // // // // // // // // // //         color: colorScheme.primary,
// // // // // // // // // // // //         category: 'Scanning',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const QrCodeGeneratorScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'Barcode Generator',
// // // // // // // // // // // //         subtitle: 'Generate barcodes instantly',
// // // // // // // // // // // //         icon: Icons.document_scanner,
// // // // // // // // // // // //         color: Colors.teal,
// // // // // // // // // // // //         category: 'Scanning',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const BarcodeGeneratorScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'Image Compressor',
// // // // // // // // // // // //         subtitle: 'Reduce image size fast',
// // // // // // // // // // // //         icon: Icons.compress_rounded,
// // // // // // // // // // // //         color: Colors.green,
// // // // // // // // // // // //         category: 'Media',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const ImageCompressorScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'Age Calculator',
// // // // // // // // // // // //         subtitle: 'Calculate exact age',
// // // // // // // // // // // //         icon: Icons.cake_rounded,
// // // // // // // // // // // //         color: Colors.orange,
// // // // // // // // // // // //         category: 'Calculators',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const AgeCalculatorScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'BMI Calculator',
// // // // // // // // // // // //         subtitle: 'Track your body mass index',
// // // // // // // // // // // //         icon: Icons.monitor_weight_rounded,
// // // // // // // // // // // //         color: Colors.cyan,
// // // // // // // // // // // //         category: 'Calculators',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const BmiCalculatorScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'Unit Converter',
// // // // // // // // // // // //         subtitle: 'Convert units quickly',
// // // // // // // // // // // //         icon: Icons.swap_horiz_rounded,
// // // // // // // // // // // //         color: Colors.indigo,
// // // // // // // // // // // //         category: 'Calculators',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const UnitConverterScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'PDF Merge',
// // // // // // // // // // // //         subtitle: 'Join multiple PDFs',
// // // // // // // // // // // //         icon: Icons.picture_as_pdf_rounded,
// // // // // // // // // // // //         color: Colors.redAccent,
// // // // // // // // // // // //         category: 'PDF',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const PdfMergeScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'PDF Split',
// // // // // // // // // // // //         subtitle: 'Split PDF pages',
// // // // // // // // // // // //         icon: Icons.call_split_rounded,
// // // // // // // // // // // //         color: Colors.pink,
// // // // // // // // // // // //         category: 'PDF',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () =>
// // // // // // // // // // // //             Navigator.push(context, AppTransitions.scaleUp(const PdfSplit())),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'Image to PDF',
// // // // // // // // // // // //         subtitle: 'Convert images to PDF',
// // // // // // // // // // // //         icon: Icons.insert_drive_file_rounded,
// // // // // // // // // // // //         color: Colors.brown,
// // // // // // // // // // // //         category: 'Media',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const ImageToPdfScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'Image Converter',
// // // // // // // // // // // //         subtitle: 'Change image formats',
// // // // // // // // // // // //         icon: Icons.image_rounded,
// // // // // // // // // // // //         color: Colors.deepOrange,
// // // // // // // // // // // //         category: 'Media',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const ImageConverterScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'Image Resizer',
// // // // // // // // // // // //         subtitle: 'Resize images precisely',
// // // // // // // // // // // //         icon: Icons.photo_size_select_large_rounded,
// // // // // // // // // // // //         color: Colors.blue,
// // // // // // // // // // // //         category: 'Media',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const ImageResizerScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       _ToolItem(
// // // // // // // // // // // //         title: 'QR / Barcode Scanner',
// // // // // // // // // // // //         subtitle: 'Scan codes with camera',
// // // // // // // // // // // //         icon: Icons.document_scanner_rounded,
// // // // // // // // // // // //         color: Colors.deepPurple,
// // // // // // // // // // // //         category: 'Scanning',
// // // // // // // // // // // //         implemented: true,
// // // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // // //           context,
// // // // // // // // // // // //           AppTransitions.scaleUp(const QrBarcodeScannerScreen()),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     ];
// // // // // // // // // // // //   }

// // // // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // // // //   // Build
// // // // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     final themeService = context.watch<ThemeService>();
// // // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // // //     final allTools = _tools(context);
// // // // // // // // // // // //     final filteredTools = allTools.where((tool) {
// // // // // // // // // // // //       final matchesQuery =
// // // // // // // // // // // //           _query.isEmpty ||
// // // // // // // // // // // //           tool.title.toLowerCase().contains(_query) ||
// // // // // // // // // // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // // // // // // // // // //           tool.category.toLowerCase().contains(_query);

// // // // // // // // // // // //       final matchesCategory =
// // // // // // // // // // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;

// // // // // // // // // // // //       return matchesQuery && matchesCategory;
// // // // // // // // // // // //     }).toList();

// // // // // // // // // // // //     return FadeTransition(
// // // // // // // // // // // //       opacity: _fadeIn,
// // // // // // // // // // // //       child: Scaffold(
// // // // // // // // // // // //         body: SafeArea(
// // // // // // // // // // // //           child: CustomScrollView(
// // // // // // // // // // // //             slivers: [
// // // // // // // // // // // //               // ── Header ──────────────────────────────────────────────────────
// // // // // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // // // // //                 child: Padding(
// // // // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // // // // // // // //                   child: Column(
// // // // // // // // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // //                     children: [
// // // // // // // // // // // //                       Row(
// // // // // // // // // // // //                         children: [
// // // // // // // // // // // //                           Container(
// // // // // // // // // // // //                             width: 54,
// // // // // // // // // // // //                             height: 54,
// // // // // // // // // // // //                             decoration: BoxDecoration(
// // // // // // // // // // // //                               gradient: LinearGradient(
// // // // // // // // // // // //                                 colors: [
// // // // // // // // // // // //                                   colorScheme.primary,
// // // // // // // // // // // //                                   colorScheme.tertiary,
// // // // // // // // // // // //                                 ],
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                               borderRadius: BorderRadius.circular(18),
// // // // // // // // // // // //                             ),
// // // // // // // // // // // //                             child: const Icon(
// // // // // // // // // // // //                               Icons.dashboard_rounded,
// // // // // // // // // // // //                               color: Colors.white,
// // // // // // // // // // // //                               size: 30,
// // // // // // // // // // // //                             ),
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                           const SizedBox(width: 14),
// // // // // // // // // // // //                           Expanded(
// // // // // // // // // // // //                             child: Column(
// // // // // // // // // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // //                               children: [
// // // // // // // // // // // //                                 Text(
// // // // // // // // // // // //                                   'ToolKit Pro',
// // // // // // // // // // // //                                   style: Theme.of(context)
// // // // // // // // // // // //                                       .textTheme
// // // // // // // // // // // //                                       .headlineSmall
// // // // // // // // // // // //                                       ?.copyWith(
// // // // // // // // // // // //                                         fontWeight: FontWeight.w900,
// // // // // // // // // // // //                                         letterSpacing: -0.5,
// // // // // // // // // // // //                                       ),
// // // // // // // // // // // //                                 ),
// // // // // // // // // // // //                                 const SizedBox(height: 4),
// // // // // // // // // // // //                                 Text(
// // // // // // // // // // // //                                   'Fast utilities, clean workflow, pro interface',
// // // // // // // // // // // //                                   style: Theme.of(context).textTheme.bodyMedium
// // // // // // // // // // // //                                       ?.copyWith(
// // // // // // // // // // // //                                         color: colorScheme.onSurfaceVariant,
// // // // // // // // // // // //                                       ),
// // // // // // // // // // // //                                 ),
// // // // // // // // // // // //                               ],
// // // // // // // // // // // //                             ),
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                           // Theme toggle with a subtle rotation animation.
// // // // // // // // // // // //                           _AnimatedThemeButton(themeService: themeService),
// // // // // // // // // // // //                         ],
// // // // // // // // // // // //                       ),
// // // // // // // // // // // //                       const SizedBox(height: 18),
// // // // // // // // // // // //                       Container(
// // // // // // // // // // // //                         width: double.infinity,
// // // // // // // // // // // //                         padding: const EdgeInsets.all(18),
// // // // // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // // // // //                           borderRadius: BorderRadius.circular(26),
// // // // // // // // // // // //                           gradient: LinearGradient(
// // // // // // // // // // // //                             begin: Alignment.topLeft,
// // // // // // // // // // // //                             end: Alignment.bottomRight,
// // // // // // // // // // // //                             colors: [
// // // // // // // // // // // //                               colorScheme.primaryContainer,
// // // // // // // // // // // //                               colorScheme.tertiaryContainer,
// // // // // // // // // // // //                             ],
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                         child: Row(
// // // // // // // // // // // //                           children: [
// // // // // // // // // // // //                             Expanded(
// // // // // // // // // // // //                               child: Column(
// // // // // // // // // // // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // //                                 children: [
// // // // // // // // // // // //                                   Text(
// // // // // // // // // // // //                                     'Professional workspace',
// // // // // // // // // // // //                                     style: Theme.of(context)
// // // // // // // // // // // //                                         .textTheme
// // // // // // // // // // // //                                         .titleLarge
// // // // // // // // // // // //                                         ?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // // // // //                                   ),
// // // // // // // // // // // //                                   const SizedBox(height: 8),
// // // // // // // // // // // //                                   Text(
// // // // // // // // // // // //                                     'Search, launch, and manage your tools from one premium dashboard.',
// // // // // // // // // // // //                                     style: Theme.of(
// // // // // // // // // // // //                                       context,
// // // // // // // // // // // //                                     ).textTheme.bodyMedium,
// // // // // // // // // // // //                                   ),
// // // // // // // // // // // //                                 ],
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                             ),
// // // // // // // // // // // //                             const SizedBox(width: 12),
// // // // // // // // // // // //                             Container(
// // // // // // // // // // // //                               width: 66,
// // // // // // // // // // // //                               height: 66,
// // // // // // // // // // // //                               decoration: BoxDecoration(
// // // // // // // // // // // //                                 color: colorScheme.surface.withOpacity(0.35),
// // // // // // // // // // // //                                 borderRadius: BorderRadius.circular(20),
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                               child: Icon(
// // // // // // // // // // // //                                 Icons.auto_awesome_rounded,
// // // // // // // // // // // //                                 size: 34,
// // // // // // // // // // // //                                 color: colorScheme.onPrimaryContainer,
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                             ),
// // // // // // // // // // // //                           ],
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                       ),
// // // // // // // // // // // //                       const SizedBox(height: 18),
// // // // // // // // // // // //                       SearchBar(
// // // // // // // // // // // //                         controller: _searchController,
// // // // // // // // // // // //                         hintText: 'Search tools, calculators, PDFs...',
// // // // // // // // // // // //                         leading: const Icon(Icons.search_rounded),
// // // // // // // // // // // //                         trailing: const [Icon(Icons.tune_rounded)],
// // // // // // // // // // // //                         elevation: const WidgetStatePropertyAll(0),
// // // // // // // // // // // //                         backgroundColor: WidgetStatePropertyAll(
// // // // // // // // // // // //                           colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                         padding: const WidgetStatePropertyAll(
// // // // // // // // // // // //                           EdgeInsets.symmetric(horizontal: 18),
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                       ),
// // // // // // // // // // // //                     ],
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //               ),

// // // // // // // // // // // //               // ── Category chips ───────────────────────────────────────────────
// // // // // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // // // // //                 child: Padding(
// // // // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // // // // //                   child: SizedBox(
// // // // // // // // // // // //                     height: 42,
// // // // // // // // // // // //                     child: ListView.separated(
// // // // // // // // // // // //                       scrollDirection: Axis.horizontal,
// // // // // // // // // // // //                       itemCount: _categories.length,
// // // // // // // // // // // //                       separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // // // // // // // //                       itemBuilder: (context, index) {
// // // // // // // // // // // //                         final category = _categories[index];
// // // // // // // // // // // //                         final selected = category == _selectedCategory;

// // // // // // // // // // // //                         return AnimatedScale(
// // // // // // // // // // // //                           scale: selected ? 1.05 : 1.0,
// // // // // // // // // // // //                           duration: const Duration(milliseconds: 180),
// // // // // // // // // // // //                           curve: Curves.easeOutCubic,
// // // // // // // // // // // //                           child: ChoiceChip(
// // // // // // // // // // // //                             label: Text(category),
// // // // // // // // // // // //                             selected: selected,
// // // // // // // // // // // //                             onSelected: (_) {
// // // // // // // // // // // //                               setState(() {
// // // // // // // // // // // //                                 _selectedCategory = category;
// // // // // // // // // // // //                               });
// // // // // // // // // // // //                             },
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         );
// // // // // // // // // // // //                       },
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //               ),

// // // // // // // // // // // //               // ── Section header ───────────────────────────────────────────────
// // // // // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // // // // //                 child: Padding(
// // // // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // // // // //                   child: Row(
// // // // // // // // // // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // // // // //                     children: [
// // // // // // // // // // // //                       Text(
// // // // // // // // // // // //                         'Featured tools',
// // // // // // // // // // // //                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // // // // // // // // //                           fontWeight: FontWeight.w800,
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                       ),
// // // // // // // // // // // //                       AnimatedSwitcher(
// // // // // // // // // // // //                         duration: const Duration(milliseconds: 220),
// // // // // // // // // // // //                         child: Text(
// // // // // // // // // // // //                           '${filteredTools.length} shown',
// // // // // // // // // // // //                           key: ValueKey(filteredTools.length),
// // // // // // // // // // // //                           style: TextStyle(
// // // // // // // // // // // //                             color: colorScheme.primary,
// // // // // // // // // // // //                             fontWeight: FontWeight.w700,
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                       ),
// // // // // // // // // // // //                     ],
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //               ),

// // // // // // // // // // // //               // ── Tool grid ───────────────────────────────────────────────────
// // // // // // // // // // // //               if (filteredTools.isEmpty)
// // // // // // // // // // // //                 SliverFillRemaining(
// // // // // // // // // // // //                   hasScrollBody: false,
// // // // // // // // // // // //                   child: _EmptyState(
// // // // // // // // // // // //                     query: _query,
// // // // // // // // // // // //                     category: _selectedCategory,
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 )
// // // // // // // // // // // //               else
// // // // // // // // // // // //                 SliverPadding(
// // // // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // // // // // // // //                   sliver: SliverGrid(
// // // // // // // // // // // //                     gridDelegate:
// // // // // // // // // // // //                         const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // // // // // // //                           crossAxisCount: 2,
// // // // // // // // // // // //                           mainAxisSpacing: 14,
// // // // // // // // // // // //                           crossAxisSpacing: 14,
// // // // // // // // // // // //                           childAspectRatio: 0.82,
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                     delegate: SliverChildBuilderDelegate((context, index) {
// // // // // // // // // // // //                       final tool = filteredTools[index];
// // // // // // // // // // // //                       // Stagger card entry animations.
// // // // // // // // // // // //                       return _StaggeredToolCard(tool: tool, index: index);
// // // // // // // // // // // //                     }, childCount: filteredTools.length),
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //             ],
// // // // // // // // // // // //           ),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // // Animated theme toggle button
// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // class _AnimatedThemeButton extends StatefulWidget {
// // // // // // // // // // // //   final ThemeService themeService;
// // // // // // // // // // // //   const _AnimatedThemeButton({required this.themeService});

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   State<_AnimatedThemeButton> createState() => _AnimatedThemeButtonState();
// // // // // // // // // // // // }

// // // // // // // // // // // // class _AnimatedThemeButtonState extends State<_AnimatedThemeButton>
// // // // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // // // //   late final AnimationController _ctrl;
// // // // // // // // // // // //   late final Animation<double> _rotate;

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void initState() {
// // // // // // // // // // // //     super.initState();
// // // // // // // // // // // //     _ctrl = AnimationController(
// // // // // // // // // // // //       vsync: this,
// // // // // // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // // // // // //     );
// // // // // // // // // // // //     _rotate = Tween<double>(
// // // // // // // // // // // //       begin: 0.0,
// // // // // // // // // // // //       end: 0.5,
// // // // // // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // //     _ctrl.dispose();
// // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // //   }

// // // // // // // // // // // //   void _toggle() {
// // // // // // // // // // // //     _ctrl.forward(from: 0.0);
// // // // // // // // // // // //     widget.themeService.toggleTheme();
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     return RotationTransition(
// // // // // // // // // // // //       turns: _rotate,
// // // // // // // // // // // //       child: IconButton.filledTonal(
// // // // // // // // // // // //         onPressed: _toggle,
// // // // // // // // // // // //         icon: Icon(
// // // // // // // // // // // //           widget.themeService.isDark
// // // // // // // // // // // //               ? Icons.light_mode_rounded
// // // // // // // // // // // //               : Icons.dark_mode_rounded,
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // // Staggered tool card — fades + slides in based on grid index
// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // class _StaggeredToolCard extends StatefulWidget {
// // // // // // // // // // // //   final _ToolItem tool;
// // // // // // // // // // // //   final int index;
// // // // // // // // // // // //   const _StaggeredToolCard({required this.tool, required this.index});

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // // // // // // // // // // }

// // // // // // // // // // // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // // // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // // // //   late final AnimationController _ctrl;
// // // // // // // // // // // //   late final Animation<double> _fade;
// // // // // // // // // // // //   late final Animation<Offset> _slide;

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void initState() {
// // // // // // // // // // // //     super.initState();
// // // // // // // // // // // //     _ctrl = AnimationController(
// // // // // // // // // // // //       vsync: this,
// // // // // // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // // // // // //     );
// // // // // // // // // // // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // // // // // // // // // // //     _slide = Tween<Offset>(
// // // // // // // // // // // //       begin: const Offset(0, 0.08),
// // // // // // // // // // // //       end: Offset.zero,
// // // // // // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // // // // // // // // // // //     // Stagger delay: 35 ms per card, capped at 280 ms.
// // // // // // // // // // // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // // // // // // // // // // //     Future.delayed(delay, () {
// // // // // // // // // // // //       if (mounted) _ctrl.forward();
// // // // // // // // // // // //     });
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // //     _ctrl.dispose();
// // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     return FadeTransition(
// // // // // // // // // // // //       opacity: _fade,
// // // // // // // // // // // //       child: SlideTransition(
// // // // // // // // // // // //         position: _slide,
// // // // // // // // // // // //         child: _ToolCard(tool: widget.tool),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // // Tool card with press feedback
// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // class _ToolCard extends StatefulWidget {
// // // // // // // // // // // //   final _ToolItem tool;
// // // // // // // // // // // //   const _ToolCard({required this.tool});

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   State<_ToolCard> createState() => _ToolCardState();
// // // // // // // // // // // // }

// // // // // // // // // // // // class _ToolCardState extends State<_ToolCard>
// // // // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // // // //   late final AnimationController _pressCtrl;
// // // // // // // // // // // //   late final Animation<double> _pressScale;

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void initState() {
// // // // // // // // // // // //     super.initState();
// // // // // // // // // // // //     _pressCtrl = AnimationController(
// // // // // // // // // // // //       vsync: this,
// // // // // // // // // // // //       duration: const Duration(milliseconds: 100),
// // // // // // // // // // // //       reverseDuration: const Duration(milliseconds: 200),
// // // // // // // // // // // //       lowerBound: 0.0,
// // // // // // // // // // // //       upperBound: 1.0,
// // // // // // // // // // // //     );
// // // // // // // // // // // //     _pressScale = Tween<double>(
// // // // // // // // // // // //       begin: 1.0,
// // // // // // // // // // // //       end: 0.95,
// // // // // // // // // // // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // //     _pressCtrl.dispose();
// // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // // // // // // // // //     final tool = widget.tool;

// // // // // // // // // // // //     return ScaleTransition(
// // // // // // // // // // // //       scale: _pressScale,
// // // // // // // // // // // //       child: GestureDetector(
// // // // // // // // // // // //         onTapDown: (_) => _pressCtrl.forward(),
// // // // // // // // // // // //         onTapUp: (_) => _pressCtrl.reverse(),
// // // // // // // // // // // //         onTapCancel: () => _pressCtrl.reverse(),
// // // // // // // // // // // //         onTap: tool.implemented
// // // // // // // // // // // //             ? tool.onTap
// // // // // // // // // // // //             : () {
// // // // // // // // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // // // // //                   SnackBar(
// // // // // // // // // // // //                     content: Text('${tool.title} is coming soon.'),
// // // // // // // // // // // //                     behavior: SnackBarBehavior.floating,
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 );
// // // // // // // // // // // //               },
// // // // // // // // // // // //         child: Container(
// // // // // // // // // // // //           decoration: BoxDecoration(
// // // // // // // // // // // //             color: colorScheme.surface,
// // // // // // // // // // // //             borderRadius: BorderRadius.circular(24),
// // // // // // // // // // // //             border: Border.all(
// // // // // // // // // // // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //             boxShadow: [
// // // // // // // // // // // //               BoxShadow(
// // // // // // // // // // // //                 color: Colors.black.withOpacity(0.05),
// // // // // // // // // // // //                 blurRadius: 20,
// // // // // // // // // // // //                 offset: const Offset(0, 10),
// // // // // // // // // // // //               ),
// // // // // // // // // // // //             ],
// // // // // // // // // // // //           ),
// // // // // // // // // // // //           child: Stack(
// // // // // // // // // // // //             children: [
// // // // // // // // // // // //               Positioned(
// // // // // // // // // // // //                 top: 14,
// // // // // // // // // // // //                 right: 14,
// // // // // // // // // // // //                 child: Container(
// // // // // // // // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // // // // // // // //                     horizontal: 9,
// // // // // // // // // // // //                     vertical: 4,
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                   decoration: BoxDecoration(
// // // // // // // // // // // //                     color: tool.implemented
// // // // // // // // // // // //                         ? tool.color.withOpacity(0.12)
// // // // // // // // // // // //                         : Colors.grey.withOpacity(0.12),
// // // // // // // // // // // //                     borderRadius: BorderRadius.circular(999),
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                   child: Text(
// // // // // // // // // // // //                     tool.implemented ? 'Live' : 'Soon',
// // // // // // // // // // // //                     style: TextStyle(
// // // // // // // // // // // //                       fontSize: 10,
// // // // // // // // // // // //                       fontWeight: FontWeight.w800,
// // // // // // // // // // // //                       color: tool.implemented ? tool.color : Colors.grey,
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //               ),
// // // // // // // // // // // //               Padding(
// // // // // // // // // // // //                 padding: const EdgeInsets.all(16),
// // // // // // // // // // // //                 child: Column(
// // // // // // // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // // // // //                   children: [
// // // // // // // // // // // //                     // Hero wraps the icon so it morphs into the AppBar icon
// // // // // // // // // // // //                     // on the destination screen (when supported).
// // // // // // // // // // // //                     Hero(
// // // // // // // // // // // //                       tag: 'tool-icon-${tool.title}',
// // // // // // // // // // // //                       child: Container(
// // // // // // // // // // // //                         width: 56,
// // // // // // // // // // // //                         height: 56,
// // // // // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // // // // //                           gradient: LinearGradient(
// // // // // // // // // // // //                             colors: [
// // // // // // // // // // // //                               tool.color.withOpacity(0.95),
// // // // // // // // // // // //                               tool.color.withOpacity(0.55),
// // // // // // // // // // // //                             ],
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                           borderRadius: BorderRadius.circular(18),
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // // // // // // // // // // //                       ),
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     Column(
// // // // // // // // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // //                       children: [
// // // // // // // // // // // //                         Text(
// // // // // // // // // // // //                           tool.title,
// // // // // // // // // // // //                           style: const TextStyle(
// // // // // // // // // // // //                             fontSize: 15,
// // // // // // // // // // // //                             fontWeight: FontWeight.w800,
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                         const SizedBox(height: 6),
// // // // // // // // // // // //                         Text(
// // // // // // // // // // // //                           tool.subtitle,
// // // // // // // // // // // //                           maxLines: 2,
// // // // // // // // // // // //                           style: TextStyle(
// // // // // // // // // // // //                             color: colorScheme.onSurfaceVariant,
// // // // // // // // // // // //                             fontSize: 12.5,
// // // // // // // // // // // //                             height: 1.25,
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                       ],
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                   ],
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //               ),
// // // // // // // // // // // //             ],
// // // // // // // // // // // //           ),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // // Empty state
// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // class _EmptyState extends StatelessWidget {
// // // // // // // // // // // //   final String query;
// // // // // // // // // // // //   final String category;

// // // // // // // // // // // //   const _EmptyState({required this.query, required this.category});

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // // //     return Center(
// // // // // // // // // // // //       child: Padding(
// // // // // // // // // // // //         padding: const EdgeInsets.all(24),
// // // // // // // // // // // //         child: Column(
// // // // // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // // // // //           children: [
// // // // // // // // // // // //             Container(
// // // // // // // // // // // //               width: 94,
// // // // // // // // // // // //               height: 94,
// // // // // // // // // // // //               decoration: BoxDecoration(
// // // // // // // // // // // //                 color: colorScheme.primaryContainer,
// // // // // // // // // // // //                 borderRadius: BorderRadius.circular(28),
// // // // // // // // // // // //               ),
// // // // // // // // // // // //               child: Icon(
// // // // // // // // // // // //                 Icons.search_off_rounded,
// // // // // // // // // // // //                 size: 44,
// // // // // // // // // // // //                 color: colorScheme.onPrimaryContainer,
// // // // // // // // // // // //               ),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //             const SizedBox(height: 18),
// // // // // // // // // // // //             Text(
// // // // // // // // // // // //               'No matching tools',
// // // // // // // // // // // //               style: Theme.of(
// // // // // // // // // // // //                 context,
// // // // // // // // // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //             const SizedBox(height: 8),
// // // // // // // // // // // //             Text(
// // // // // // // // // // // //               query.isEmpty
// // // // // // // // // // // //                   ? 'No tools found in $category.'
// // // // // // // // // // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // // // // // // // // // //               textAlign: TextAlign.center,
// // // // // // // // // // // //               style: TextStyle(
// // // // // // // // // // // //                 color: colorScheme.onSurfaceVariant,
// // // // // // // // // // // //                 height: 1.4,
// // // // // // // // // // // //               ),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //           ],
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // // Data model
// // // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // class _ToolItem {
// // // // // // // // // // // //   final String title;
// // // // // // // // // // // //   final String subtitle;
// // // // // // // // // // // //   final IconData icon;
// // // // // // // // // // // //   final Color color;
// // // // // // // // // // // //   final String category;
// // // // // // // // // // // //   final bool implemented;
// // // // // // // // // // // //   final VoidCallback? onTap;

// // // // // // // // // // // //   const _ToolItem({
// // // // // // // // // // // //     required this.title,
// // // // // // // // // // // //     required this.subtitle,
// // // // // // // // // // // //     required this.icon,
// // // // // // // // // // // //     required this.color,
// // // // // // // // // // // //     required this.category,
// // // // // // // // // // // //     required this.implemented,
// // // // // // // // // // // //     this.onTap,
// // // // // // // // // // // //   });
// // // // // // // // // // // // }
// // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // import 'package:provider/provider.dart';

// // // // // // // // // // // import '../services/theme_service.dart';
// // // // // // // // // // // import '../utils/app_transitions.dart';
// // // // // // // // // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // // // // // // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // // // // // // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // // // // // // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // // // // // // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // // // // // // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // // // // // // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // // // // // // // // import '../features/pdf_split/pdf_split.dart';
// // // // // // // // // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // // // // // // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // // // // // // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // // // // // // // // import '../features/image_converter/image_converter_screen.dart';

// // // // // // // // // // // class HomeScreen extends StatefulWidget {
// // // // // // // // // // //   const HomeScreen({super.key});

// // // // // // // // // // //   @override
// // // // // // // // // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // // // // // // // // }

// // // // // // // // // // // class _HomeScreenState extends State<HomeScreen>
// // // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // // //   final TextEditingController _searchController = TextEditingController();
// // // // // // // // // // //   String _query = '';
// // // // // // // // // // //   String _selectedCategory = 'All';

// // // // // // // // // // //   // Controls the initial fade-in of the home screen itself.
// // // // // // // // // // //   late final AnimationController _fadeInController;
// // // // // // // // // // //   late final Animation<double> _fadeIn;

// // // // // // // // // // //   final List<String> _categories = [
// // // // // // // // // // //     'All',
// // // // // // // // // // //     'Media',
// // // // // // // // // // //     'PDF',
// // // // // // // // // // //     'Calculators',
// // // // // // // // // // //     'Scanning',
// // // // // // // // // // //   ];

// // // // // // // // // // //   @override
// // // // // // // // // // //   void initState() {
// // // // // // // // // // //     super.initState();

// // // // // // // // // // //     _fadeInController = AnimationController(
// // // // // // // // // // //       vsync: this,
// // // // // // // // // // //       duration: const Duration(milliseconds: 520),
// // // // // // // // // // //     );
// // // // // // // // // // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // // // // // // // // // //     // Small delay so the first frame is fully laid out before animating.
// // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // //       _fadeInController.forward();
// // // // // // // // // // //     });

// // // // // // // // // // //     _searchController.addListener(() {
// // // // // // // // // // //       setState(() {
// // // // // // // // // // //         _query = _searchController.text.toLowerCase().trim();
// // // // // // // // // // //       });
// // // // // // // // // // //     });
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   void dispose() {
// // // // // // // // // // //     _fadeInController.dispose();
// // // // // // // // // // //     _searchController.dispose();
// // // // // // // // // // //     super.dispose();
// // // // // // // // // // //   }

// // // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // // //   // Tool definitions
// // // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // // //   List<_ToolItem> _tools(BuildContext context) {
// // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // //     return [
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'QR Code Generator',
// // // // // // // // // // //         subtitle: 'Create modern QR codes',
// // // // // // // // // // //         icon: Icons.qr_code_rounded,
// // // // // // // // // // //         color: colorScheme.primary,
// // // // // // // // // // //         category: 'Scanning',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const QrCodeGeneratorScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'Barcode Generator',
// // // // // // // // // // //         subtitle: 'Generate barcodes instantly',
// // // // // // // // // // //         icon: Icons.document_scanner,
// // // // // // // // // // //         color: Colors.teal,
// // // // // // // // // // //         category: 'Scanning',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const BarcodeGeneratorScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'Image Compressor',
// // // // // // // // // // //         subtitle: 'Reduce image size fast',
// // // // // // // // // // //         icon: Icons.compress_rounded,
// // // // // // // // // // //         color: Colors.green,
// // // // // // // // // // //         category: 'Media',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const ImageCompressorScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'Age Calculator',
// // // // // // // // // // //         subtitle: 'Calculate exact age',
// // // // // // // // // // //         icon: Icons.cake_rounded,
// // // // // // // // // // //         color: Colors.orange,
// // // // // // // // // // //         category: 'Calculators',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.bottomSheet(const AgeCalculatorScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'BMI Calculator',
// // // // // // // // // // //         subtitle: 'Track your body mass index',
// // // // // // // // // // //         icon: Icons.monitor_weight_rounded,
// // // // // // // // // // //         color: Colors.cyan,
// // // // // // // // // // //         category: 'Calculators',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const BmiCalculatorScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'Unit Converter',
// // // // // // // // // // //         subtitle: 'Convert units quickly',
// // // // // // // // // // //         icon: Icons.swap_horiz_rounded,
// // // // // // // // // // //         color: Colors.indigo,
// // // // // // // // // // //         category: 'Calculators',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const UnitConverterScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'PDF Merge',
// // // // // // // // // // //         subtitle: 'Join multiple PDFs',
// // // // // // // // // // //         icon: Icons.picture_as_pdf_rounded,
// // // // // // // // // // //         color: Colors.redAccent,
// // // // // // // // // // //         category: 'PDF',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const PdfMergeScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'PDF Split',
// // // // // // // // // // //         subtitle: 'Split PDF pages',
// // // // // // // // // // //         icon: Icons.call_split_rounded,
// // // // // // // // // // //         color: Colors.pink,
// // // // // // // // // // //         category: 'PDF',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () =>
// // // // // // // // // // //             Navigator.push(context, AppTransitions.scaleUp(const PdfSplit())),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'Image to PDF',
// // // // // // // // // // //         subtitle: 'Convert images to PDF',
// // // // // // // // // // //         icon: Icons.insert_drive_file_rounded,
// // // // // // // // // // //         color: Colors.brown,
// // // // // // // // // // //         category: 'Media',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const ImageToPdfScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'Image Converter',
// // // // // // // // // // //         subtitle: 'Change image formats',
// // // // // // // // // // //         icon: Icons.image_rounded,
// // // // // // // // // // //         color: Colors.deepOrange,
// // // // // // // // // // //         category: 'Media',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const ImageConverterScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'Image Resizer',
// // // // // // // // // // //         subtitle: 'Resize images precisely',
// // // // // // // // // // //         icon: Icons.photo_size_select_large_rounded,
// // // // // // // // // // //         color: Colors.blue,
// // // // // // // // // // //         category: 'Media',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const ImageResizerScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       _ToolItem(
// // // // // // // // // // //         title: 'QR / Barcode Scanner',
// // // // // // // // // // //         subtitle: 'Scan codes with camera',
// // // // // // // // // // //         icon: Icons.document_scanner_rounded,
// // // // // // // // // // //         color: Colors.deepPurple,
// // // // // // // // // // //         category: 'Scanning',
// // // // // // // // // // //         implemented: true,
// // // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // // //           context,
// // // // // // // // // // //           AppTransitions.scaleUp(const QrBarcodeScannerScreen()),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //     ];
// // // // // // // // // // //   }

// // // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // // //   // Build
// // // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     final themeService = context.watch<ThemeService>();
// // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // //     final allTools = _tools(context);
// // // // // // // // // // //     final filteredTools = allTools.where((tool) {
// // // // // // // // // // //       final matchesQuery =
// // // // // // // // // // //           _query.isEmpty ||
// // // // // // // // // // //           tool.title.toLowerCase().contains(_query) ||
// // // // // // // // // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // // // // // // // // //           tool.category.toLowerCase().contains(_query);

// // // // // // // // // // //       final matchesCategory =
// // // // // // // // // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;

// // // // // // // // // // //       return matchesQuery && matchesCategory;
// // // // // // // // // // //     }).toList();

// // // // // // // // // // //     return FadeTransition(
// // // // // // // // // // //       opacity: _fadeIn,
// // // // // // // // // // //       child: Scaffold(
// // // // // // // // // // //         body: SafeArea(
// // // // // // // // // // //           child: CustomScrollView(
// // // // // // // // // // //             slivers: [
// // // // // // // // // // //               // ── Header ──────────────────────────────────────────────────────
// // // // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // // // //                 child: Padding(
// // // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // // // // // // //                   child: Column(
// // // // // // // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // //                     children: [
// // // // // // // // // // //                       Row(
// // // // // // // // // // //                         children: [
// // // // // // // // // // //                           Container(
// // // // // // // // // // //                             width: 54,
// // // // // // // // // // //                             height: 54,
// // // // // // // // // // //                             decoration: BoxDecoration(
// // // // // // // // // // //                               gradient: LinearGradient(
// // // // // // // // // // //                                 colors: [
// // // // // // // // // // //                                   colorScheme.primary,
// // // // // // // // // // //                                   colorScheme.tertiary,
// // // // // // // // // // //                                 ],
// // // // // // // // // // //                               ),
// // // // // // // // // // //                               borderRadius: BorderRadius.circular(18),
// // // // // // // // // // //                             ),
// // // // // // // // // // //                             child: const Icon(
// // // // // // // // // // //                               Icons.dashboard_rounded,
// // // // // // // // // // //                               color: Colors.white,
// // // // // // // // // // //                               size: 30,
// // // // // // // // // // //                             ),
// // // // // // // // // // //                           ),
// // // // // // // // // // //                           const SizedBox(width: 14),
// // // // // // // // // // //                           Expanded(
// // // // // // // // // // //                             child: Column(
// // // // // // // // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // //                               children: [
// // // // // // // // // // //                                 Text(
// // // // // // // // // // //                                   'ToolKit Pro',
// // // // // // // // // // //                                   style: Theme.of(context)
// // // // // // // // // // //                                       .textTheme
// // // // // // // // // // //                                       .headlineSmall
// // // // // // // // // // //                                       ?.copyWith(
// // // // // // // // // // //                                         fontWeight: FontWeight.w900,
// // // // // // // // // // //                                         letterSpacing: -0.5,
// // // // // // // // // // //                                       ),
// // // // // // // // // // //                                 ),
// // // // // // // // // // //                                 const SizedBox(height: 4),
// // // // // // // // // // //                                 Text(
// // // // // // // // // // //                                   'Fast utilities, clean workflow, pro interface',
// // // // // // // // // // //                                   style: Theme.of(context).textTheme.bodyMedium
// // // // // // // // // // //                                       ?.copyWith(
// // // // // // // // // // //                                         color: colorScheme.onSurfaceVariant,
// // // // // // // // // // //                                       ),
// // // // // // // // // // //                                 ),
// // // // // // // // // // //                               ],
// // // // // // // // // // //                             ),
// // // // // // // // // // //                           ),
// // // // // // // // // // //                           // Theme toggle with a subtle rotation animation.
// // // // // // // // // // //                           _AnimatedThemeButton(themeService: themeService),
// // // // // // // // // // //                         ],
// // // // // // // // // // //                       ),
// // // // // // // // // // //                       const SizedBox(height: 18),
// // // // // // // // // // //                       Container(
// // // // // // // // // // //                         width: double.infinity,
// // // // // // // // // // //                         padding: const EdgeInsets.all(18),
// // // // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // // // //                           borderRadius: BorderRadius.circular(26),
// // // // // // // // // // //                           gradient: LinearGradient(
// // // // // // // // // // //                             begin: Alignment.topLeft,
// // // // // // // // // // //                             end: Alignment.bottomRight,
// // // // // // // // // // //                             colors: [
// // // // // // // // // // //                               colorScheme.primaryContainer,
// // // // // // // // // // //                               colorScheme.tertiaryContainer,
// // // // // // // // // // //                             ],
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         ),
// // // // // // // // // // //                         child: Row(
// // // // // // // // // // //                           children: [
// // // // // // // // // // //                             Expanded(
// // // // // // // // // // //                               child: Column(
// // // // // // // // // // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // //                                 children: [
// // // // // // // // // // //                                   Text(
// // // // // // // // // // //                                     'Professional workspace',
// // // // // // // // // // //                                     style: Theme.of(context)
// // // // // // // // // // //                                         .textTheme
// // // // // // // // // // //                                         .titleLarge
// // // // // // // // // // //                                         ?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // // // //                                   ),
// // // // // // // // // // //                                   const SizedBox(height: 8),
// // // // // // // // // // //                                   Text(
// // // // // // // // // // //                                     'Search, launch, and manage your tools from one premium dashboard.',
// // // // // // // // // // //                                     style: Theme.of(
// // // // // // // // // // //                                       context,
// // // // // // // // // // //                                     ).textTheme.bodyMedium,
// // // // // // // // // // //                                   ),
// // // // // // // // // // //                                 ],
// // // // // // // // // // //                               ),
// // // // // // // // // // //                             ),
// // // // // // // // // // //                             const SizedBox(width: 12),
// // // // // // // // // // //                             Container(
// // // // // // // // // // //                               width: 66,
// // // // // // // // // // //                               height: 66,
// // // // // // // // // // //                               decoration: BoxDecoration(
// // // // // // // // // // //                                 color: colorScheme.surface.withOpacity(0.35),
// // // // // // // // // // //                                 borderRadius: BorderRadius.circular(20),
// // // // // // // // // // //                               ),
// // // // // // // // // // //                               child: Icon(
// // // // // // // // // // //                                 Icons.auto_awesome_rounded,
// // // // // // // // // // //                                 size: 34,
// // // // // // // // // // //                                 color: colorScheme.onPrimaryContainer,
// // // // // // // // // // //                               ),
// // // // // // // // // // //                             ),
// // // // // // // // // // //                           ],
// // // // // // // // // // //                         ),
// // // // // // // // // // //                       ),
// // // // // // // // // // //                       const SizedBox(height: 18),
// // // // // // // // // // //                       SearchBar(
// // // // // // // // // // //                         controller: _searchController,
// // // // // // // // // // //                         hintText: 'Search tools, calculators, PDFs...',
// // // // // // // // // // //                         leading: const Icon(Icons.search_rounded),
// // // // // // // // // // //                         trailing: const [Icon(Icons.tune_rounded)],
// // // // // // // // // // //                         elevation: const WidgetStatePropertyAll(0),
// // // // // // // // // // //                         backgroundColor: WidgetStatePropertyAll(
// // // // // // // // // // //                           colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // // // // // // // //                         ),
// // // // // // // // // // //                         padding: const WidgetStatePropertyAll(
// // // // // // // // // // //                           EdgeInsets.symmetric(horizontal: 18),
// // // // // // // // // // //                         ),
// // // // // // // // // // //                       ),
// // // // // // // // // // //                     ],
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 ),
// // // // // // // // // // //               ),

// // // // // // // // // // //               // ── Category chips ───────────────────────────────────────────────
// // // // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // // // //                 child: Padding(
// // // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // // // //                   child: SizedBox(
// // // // // // // // // // //                     height: 42,
// // // // // // // // // // //                     child: ListView.separated(
// // // // // // // // // // //                       scrollDirection: Axis.horizontal,
// // // // // // // // // // //                       itemCount: _categories.length,
// // // // // // // // // // //                       separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // // // // // // //                       itemBuilder: (context, index) {
// // // // // // // // // // //                         final category = _categories[index];
// // // // // // // // // // //                         final selected = category == _selectedCategory;

// // // // // // // // // // //                         return AnimatedScale(
// // // // // // // // // // //                           scale: selected ? 1.05 : 1.0,
// // // // // // // // // // //                           duration: const Duration(milliseconds: 180),
// // // // // // // // // // //                           curve: Curves.easeOutCubic,
// // // // // // // // // // //                           child: ChoiceChip(
// // // // // // // // // // //                             label: Text(category),
// // // // // // // // // // //                             selected: selected,
// // // // // // // // // // //                             onSelected: (_) {
// // // // // // // // // // //                               setState(() {
// // // // // // // // // // //                                 _selectedCategory = category;
// // // // // // // // // // //                               });
// // // // // // // // // // //                             },
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         );
// // // // // // // // // // //                       },
// // // // // // // // // // //                     ),
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 ),
// // // // // // // // // // //               ),

// // // // // // // // // // //               // ── Section header ───────────────────────────────────────────────
// // // // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // // // //                 child: Padding(
// // // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // // // //                   child: Row(
// // // // // // // // // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // // // //                     children: [
// // // // // // // // // // //                       Text(
// // // // // // // // // // //                         'Featured tools',
// // // // // // // // // // //                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // // // // // // // //                           fontWeight: FontWeight.w800,
// // // // // // // // // // //                         ),
// // // // // // // // // // //                       ),
// // // // // // // // // // //                       AnimatedSwitcher(
// // // // // // // // // // //                         duration: const Duration(milliseconds: 220),
// // // // // // // // // // //                         child: Text(
// // // // // // // // // // //                           '${filteredTools.length} shown',
// // // // // // // // // // //                           key: ValueKey(filteredTools.length),
// // // // // // // // // // //                           style: TextStyle(
// // // // // // // // // // //                             color: colorScheme.primary,
// // // // // // // // // // //                             fontWeight: FontWeight.w700,
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         ),
// // // // // // // // // // //                       ),
// // // // // // // // // // //                     ],
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 ),
// // // // // // // // // // //               ),

// // // // // // // // // // //               // ── Tool grid ───────────────────────────────────────────────────
// // // // // // // // // // //               if (filteredTools.isEmpty)
// // // // // // // // // // //                 SliverFillRemaining(
// // // // // // // // // // //                   hasScrollBody: false,
// // // // // // // // // // //                   child: _EmptyState(
// // // // // // // // // // //                     query: _query,
// // // // // // // // // // //                     category: _selectedCategory,
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 )
// // // // // // // // // // //               else
// // // // // // // // // // //                 SliverPadding(
// // // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // // // // // // //                   sliver: SliverGrid(
// // // // // // // // // // //                     gridDelegate:
// // // // // // // // // // //                         const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // // // // // //                           crossAxisCount: 2,
// // // // // // // // // // //                           mainAxisSpacing: 14,
// // // // // // // // // // //                           crossAxisSpacing: 14,
// // // // // // // // // // //                           childAspectRatio: 0.82,
// // // // // // // // // // //                         ),
// // // // // // // // // // //                     delegate: SliverChildBuilderDelegate((context, index) {
// // // // // // // // // // //                       final tool = filteredTools[index];
// // // // // // // // // // //                       // Stagger card entry animations.
// // // // // // // // // // //                       return _StaggeredToolCard(tool: tool, index: index);
// // // // // // // // // // //                     }, childCount: filteredTools.length),
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 ),
// // // // // // // // // // //             ],
// // // // // // // // // // //           ),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // Animated theme toggle button
// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // class _AnimatedThemeButton extends StatefulWidget {
// // // // // // // // // // //   final ThemeService themeService;
// // // // // // // // // // //   const _AnimatedThemeButton({required this.themeService});

// // // // // // // // // // //   @override
// // // // // // // // // // //   State<_AnimatedThemeButton> createState() => _AnimatedThemeButtonState();
// // // // // // // // // // // }

// // // // // // // // // // // class _AnimatedThemeButtonState extends State<_AnimatedThemeButton>
// // // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // // //   late final AnimationController _ctrl;
// // // // // // // // // // //   late final Animation<double> _rotate;

// // // // // // // // // // //   @override
// // // // // // // // // // //   void initState() {
// // // // // // // // // // //     super.initState();
// // // // // // // // // // //     _ctrl = AnimationController(
// // // // // // // // // // //       vsync: this,
// // // // // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // // // // //     );
// // // // // // // // // // //     _rotate = Tween<double>(
// // // // // // // // // // //       begin: 0.0,
// // // // // // // // // // //       end: 0.5,
// // // // // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   void dispose() {
// // // // // // // // // // //     _ctrl.dispose();
// // // // // // // // // // //     super.dispose();
// // // // // // // // // // //   }

// // // // // // // // // // //   void _toggle() {
// // // // // // // // // // //     _ctrl.forward(from: 0.0);
// // // // // // // // // // //     widget.themeService.toggleTheme();
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     return RotationTransition(
// // // // // // // // // // //       turns: _rotate,
// // // // // // // // // // //       child: IconButton.filledTonal(
// // // // // // // // // // //         onPressed: _toggle,
// // // // // // // // // // //         icon: Icon(
// // // // // // // // // // //           widget.themeService.isDark
// // // // // // // // // // //               ? Icons.light_mode_rounded
// // // // // // // // // // //               : Icons.dark_mode_rounded,
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // Staggered tool card — fades + slides in based on grid index
// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // class _StaggeredToolCard extends StatefulWidget {
// // // // // // // // // // //   final _ToolItem tool;
// // // // // // // // // // //   final int index;
// // // // // // // // // // //   const _StaggeredToolCard({required this.tool, required this.index});

// // // // // // // // // // //   @override
// // // // // // // // // // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // // // // // // // // // }

// // // // // // // // // // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // // //   late final AnimationController _ctrl;
// // // // // // // // // // //   late final Animation<double> _fade;
// // // // // // // // // // //   late final Animation<Offset> _slide;

// // // // // // // // // // //   @override
// // // // // // // // // // //   void initState() {
// // // // // // // // // // //     super.initState();
// // // // // // // // // // //     _ctrl = AnimationController(
// // // // // // // // // // //       vsync: this,
// // // // // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // // // // //     );
// // // // // // // // // // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // // // // // // // // // //     _slide = Tween<Offset>(
// // // // // // // // // // //       begin: const Offset(0, 0.08),
// // // // // // // // // // //       end: Offset.zero,
// // // // // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // // // // // // // // // //     // Stagger delay: 35 ms per card, capped at 280 ms.
// // // // // // // // // // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // // // // // // // // // //     Future.delayed(delay, () {
// // // // // // // // // // //       if (mounted) _ctrl.forward();
// // // // // // // // // // //     });
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   void dispose() {
// // // // // // // // // // //     _ctrl.dispose();
// // // // // // // // // // //     super.dispose();
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     return FadeTransition(
// // // // // // // // // // //       opacity: _fade,
// // // // // // // // // // //       child: SlideTransition(
// // // // // // // // // // //         position: _slide,
// // // // // // // // // // //         child: _ToolCard(tool: widget.tool),
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // Tool card with press feedback
// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // class _ToolCard extends StatefulWidget {
// // // // // // // // // // //   final _ToolItem tool;
// // // // // // // // // // //   const _ToolCard({required this.tool});

// // // // // // // // // // //   @override
// // // // // // // // // // //   State<_ToolCard> createState() => _ToolCardState();
// // // // // // // // // // // }

// // // // // // // // // // // class _ToolCardState extends State<_ToolCard>
// // // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // // //   late final AnimationController _pressCtrl;
// // // // // // // // // // //   late final Animation<double> _pressScale;

// // // // // // // // // // //   @override
// // // // // // // // // // //   void initState() {
// // // // // // // // // // //     super.initState();
// // // // // // // // // // //     _pressCtrl = AnimationController(
// // // // // // // // // // //       vsync: this,
// // // // // // // // // // //       duration: const Duration(milliseconds: 100),
// // // // // // // // // // //       reverseDuration: const Duration(milliseconds: 200),
// // // // // // // // // // //       lowerBound: 0.0,
// // // // // // // // // // //       upperBound: 1.0,
// // // // // // // // // // //     );
// // // // // // // // // // //     _pressScale = Tween<double>(
// // // // // // // // // // //       begin: 1.0,
// // // // // // // // // // //       end: 0.95,
// // // // // // // // // // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   void dispose() {
// // // // // // // // // // //     _pressCtrl.dispose();
// // // // // // // // // // //     super.dispose();
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // // // // // // // //     final tool = widget.tool;

// // // // // // // // // // //     return ScaleTransition(
// // // // // // // // // // //       scale: _pressScale,
// // // // // // // // // // //       child: GestureDetector(
// // // // // // // // // // //         onTapDown: (_) => _pressCtrl.forward(),
// // // // // // // // // // //         onTapUp: (_) => _pressCtrl.reverse(),
// // // // // // // // // // //         onTapCancel: () => _pressCtrl.reverse(),
// // // // // // // // // // //         onTap: tool.implemented
// // // // // // // // // // //             ? tool.onTap
// // // // // // // // // // //             : () {
// // // // // // // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // // // //                   SnackBar(
// // // // // // // // // // //                     content: Text('${tool.title} is coming soon.'),
// // // // // // // // // // //                     behavior: SnackBarBehavior.floating,
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 );
// // // // // // // // // // //               },
// // // // // // // // // // //         child: Container(
// // // // // // // // // // //           decoration: BoxDecoration(
// // // // // // // // // // //             color: colorScheme.surface,
// // // // // // // // // // //             borderRadius: BorderRadius.circular(24),
// // // // // // // // // // //             border: Border.all(
// // // // // // // // // // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // // // // // // // // // //             ),
// // // // // // // // // // //             boxShadow: [
// // // // // // // // // // //               BoxShadow(
// // // // // // // // // // //                 color: Colors.black.withOpacity(0.05),
// // // // // // // // // // //                 blurRadius: 20,
// // // // // // // // // // //                 offset: const Offset(0, 10),
// // // // // // // // // // //               ),
// // // // // // // // // // //             ],
// // // // // // // // // // //           ),
// // // // // // // // // // //           child: Stack(
// // // // // // // // // // //             children: [
// // // // // // // // // // //               Positioned(
// // // // // // // // // // //                 top: 14,
// // // // // // // // // // //                 right: 14,
// // // // // // // // // // //                 child: Container(
// // // // // // // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // // // // // // //                     horizontal: 9,
// // // // // // // // // // //                     vertical: 4,
// // // // // // // // // // //                   ),
// // // // // // // // // // //                   decoration: BoxDecoration(
// // // // // // // // // // //                     color: tool.implemented
// // // // // // // // // // //                         ? tool.color.withOpacity(0.12)
// // // // // // // // // // //                         : Colors.grey.withOpacity(0.12),
// // // // // // // // // // //                     borderRadius: BorderRadius.circular(999),
// // // // // // // // // // //                   ),
// // // // // // // // // // //                   child: Text(
// // // // // // // // // // //                     tool.implemented ? 'Live' : 'Soon',
// // // // // // // // // // //                     style: TextStyle(
// // // // // // // // // // //                       fontSize: 10,
// // // // // // // // // // //                       fontWeight: FontWeight.w800,
// // // // // // // // // // //                       color: tool.implemented ? tool.color : Colors.grey,
// // // // // // // // // // //                     ),
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 ),
// // // // // // // // // // //               ),
// // // // // // // // // // //               Padding(
// // // // // // // // // // //                 padding: const EdgeInsets.all(16),
// // // // // // // // // // //                 child: Column(
// // // // // // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // // // //                   children: [
// // // // // // // // // // //                     // Hero wraps the icon so it morphs into the AppBar icon
// // // // // // // // // // //                     // on the destination screen (when supported).
// // // // // // // // // // //                     Hero(
// // // // // // // // // // //                       tag: 'tool-icon-${tool.title}',
// // // // // // // // // // //                       child: Container(
// // // // // // // // // // //                         width: 56,
// // // // // // // // // // //                         height: 56,
// // // // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // // // //                           gradient: LinearGradient(
// // // // // // // // // // //                             colors: [
// // // // // // // // // // //                               tool.color.withOpacity(0.95),
// // // // // // // // // // //                               tool.color.withOpacity(0.55),
// // // // // // // // // // //                             ],
// // // // // // // // // // //                           ),
// // // // // // // // // // //                           borderRadius: BorderRadius.circular(18),
// // // // // // // // // // //                         ),
// // // // // // // // // // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // // // // // // // // // //                       ),
// // // // // // // // // // //                     ),
// // // // // // // // // // //                     Column(
// // // // // // // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // //                       children: [
// // // // // // // // // // //                         Text(
// // // // // // // // // // //                           tool.title,
// // // // // // // // // // //                           style: const TextStyle(
// // // // // // // // // // //                             fontSize: 15,
// // // // // // // // // // //                             fontWeight: FontWeight.w800,
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         ),
// // // // // // // // // // //                         const SizedBox(height: 6),
// // // // // // // // // // //                         Text(
// // // // // // // // // // //                           tool.subtitle,
// // // // // // // // // // //                           maxLines: 2,
// // // // // // // // // // //                           style: TextStyle(
// // // // // // // // // // //                             color: colorScheme.onSurfaceVariant,
// // // // // // // // // // //                             fontSize: 12.5,
// // // // // // // // // // //                             height: 1.25,
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         ),
// // // // // // // // // // //                       ],
// // // // // // // // // // //                     ),
// // // // // // // // // // //                   ],
// // // // // // // // // // //                 ),
// // // // // // // // // // //               ),
// // // // // // // // // // //             ],
// // // // // // // // // // //           ),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // Empty state
// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // class _EmptyState extends StatelessWidget {
// // // // // // // // // // //   final String query;
// // // // // // // // // // //   final String category;

// // // // // // // // // // //   const _EmptyState({required this.query, required this.category});

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // // //     return Center(
// // // // // // // // // // //       child: Padding(
// // // // // // // // // // //         padding: const EdgeInsets.all(24),
// // // // // // // // // // //         child: Column(
// // // // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // // // //           children: [
// // // // // // // // // // //             Container(
// // // // // // // // // // //               width: 94,
// // // // // // // // // // //               height: 94,
// // // // // // // // // // //               decoration: BoxDecoration(
// // // // // // // // // // //                 color: colorScheme.primaryContainer,
// // // // // // // // // // //                 borderRadius: BorderRadius.circular(28),
// // // // // // // // // // //               ),
// // // // // // // // // // //               child: Icon(
// // // // // // // // // // //                 Icons.search_off_rounded,
// // // // // // // // // // //                 size: 44,
// // // // // // // // // // //                 color: colorScheme.onPrimaryContainer,
// // // // // // // // // // //               ),
// // // // // // // // // // //             ),
// // // // // // // // // // //             const SizedBox(height: 18),
// // // // // // // // // // //             Text(
// // // // // // // // // // //               'No matching tools',
// // // // // // // // // // //               style: Theme.of(
// // // // // // // // // // //                 context,
// // // // // // // // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // // // //             ),
// // // // // // // // // // //             const SizedBox(height: 8),
// // // // // // // // // // //             Text(
// // // // // // // // // // //               query.isEmpty
// // // // // // // // // // //                   ? 'No tools found in $category.'
// // // // // // // // // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // // // // // // // // //               textAlign: TextAlign.center,
// // // // // // // // // // //               style: TextStyle(
// // // // // // // // // // //                 color: colorScheme.onSurfaceVariant,
// // // // // // // // // // //                 height: 1.4,
// // // // // // // // // // //               ),
// // // // // // // // // // //             ),
// // // // // // // // // // //           ],
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // // Data model
// // // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // class _ToolItem {
// // // // // // // // // // //   final String title;
// // // // // // // // // // //   final String subtitle;
// // // // // // // // // // //   final IconData icon;
// // // // // // // // // // //   final Color color;
// // // // // // // // // // //   final String category;
// // // // // // // // // // //   final bool implemented;
// // // // // // // // // // //   final VoidCallback? onTap;

// // // // // // // // // // //   const _ToolItem({
// // // // // // // // // // //     required this.title,
// // // // // // // // // // //     required this.subtitle,
// // // // // // // // // // //     required this.icon,
// // // // // // // // // // //     required this.color,
// // // // // // // // // // //     required this.category,
// // // // // // // // // // //     required this.implemented,
// // // // // // // // // // //     this.onTap,
// // // // // // // // // // //   });
// // // // // // // // // // // }
// // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // import 'package:provider/provider.dart';

// // // // // // // // // // import '../services/theme_service.dart';
// // // // // // // // // // import '../utils/app_transitions.dart';
// // // // // // // // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // // // // // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // // // // // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // // // // // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // // // // // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // // // // // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // // // // // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // // // // // // // import '../features/pdf_split/pdf_split.dart';
// // // // // // // // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // // // // // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // // // // // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // // // // // // // import '../features/image_converter/image_converter_screen.dart';

// // // // // // // // // // class HomeScreen extends StatefulWidget {
// // // // // // // // // //   const HomeScreen({super.key});

// // // // // // // // // //   @override
// // // // // // // // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // // // // // // // }

// // // // // // // // // // class _HomeScreenState extends State<HomeScreen>
// // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // //   final TextEditingController _searchController = TextEditingController();
// // // // // // // // // //   String _query = '';
// // // // // // // // // //   String _selectedCategory = 'All';

// // // // // // // // // //   // Controls the initial fade-in of the home screen itself.
// // // // // // // // // //   late final AnimationController _fadeInController;
// // // // // // // // // //   late final Animation<double> _fadeIn;

// // // // // // // // // //   final List<String> _categories = [
// // // // // // // // // //     'All',
// // // // // // // // // //     'Media',
// // // // // // // // // //     'PDF',
// // // // // // // // // //     'Calculators',
// // // // // // // // // //     'Scanning',
// // // // // // // // // //   ];

// // // // // // // // // //   @override
// // // // // // // // // //   void initState() {
// // // // // // // // // //     super.initState();

// // // // // // // // // //     _fadeInController = AnimationController(
// // // // // // // // // //       vsync: this,
// // // // // // // // // //       duration: const Duration(milliseconds: 520),
// // // // // // // // // //     );
// // // // // // // // // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // // // // // // // // //     // Small delay so the first frame is fully laid out before animating.
// // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // //       _fadeInController.forward();
// // // // // // // // // //     });

// // // // // // // // // //     _searchController.addListener(() {
// // // // // // // // // //       setState(() {
// // // // // // // // // //         _query = _searchController.text.toLowerCase().trim();
// // // // // // // // // //       });
// // // // // // // // // //     });
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   void dispose() {
// // // // // // // // // //     _fadeInController.dispose();
// // // // // // // // // //     _searchController.dispose();
// // // // // // // // // //     super.dispose();
// // // // // // // // // //   }

// // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // //   // Tool definitions
// // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // //   List<_ToolItem> _tools(BuildContext context) {
// // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // //     return [
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'QR Code Generator',
// // // // // // // // // //         subtitle: 'Create modern QR codes',
// // // // // // // // // //         icon: Icons.qr_code_rounded,
// // // // // // // // // //         color: colorScheme.primary,
// // // // // // // // // //         category: 'Scanning',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const QrCodeGeneratorScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'Barcode Generator',
// // // // // // // // // //         subtitle: 'Generate barcodes instantly',
// // // // // // // // // //         icon: Icons.document_scanner,
// // // // // // // // // //         color: Colors.teal,
// // // // // // // // // //         category: 'Scanning',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const BarcodeGeneratorScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'Image Compressor',
// // // // // // // // // //         subtitle: 'Reduce image size fast',
// // // // // // // // // //         icon: Icons.compress_rounded,
// // // // // // // // // //         color: Colors.green,
// // // // // // // // // //         category: 'Media',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const ImageCompressorScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'Age Calculator',
// // // // // // // // // //         subtitle: 'Calculate exact age',
// // // // // // // // // //         icon: Icons.cake_rounded,
// // // // // // // // // //         color: Colors.orange,
// // // // // // // // // //         category: 'Calculators',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.bottomSheet(
// // // // // // // // // //             const AgeCalculatorScreen(),
// // // // // // // // // //             duration: const Duration(milliseconds: 550),
// // // // // // // // // //           ),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'BMI Calculator',
// // // // // // // // // //         subtitle: 'Track your body mass index',
// // // // // // // // // //         icon: Icons.monitor_weight_rounded,
// // // // // // // // // //         color: Colors.cyan,
// // // // // // // // // //         category: 'Calculators',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const BmiCalculatorScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'Unit Converter',
// // // // // // // // // //         subtitle: 'Convert units quickly',
// // // // // // // // // //         icon: Icons.swap_horiz_rounded,
// // // // // // // // // //         color: Colors.indigo,
// // // // // // // // // //         category: 'Calculators',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const UnitConverterScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'PDF Merge',
// // // // // // // // // //         subtitle: 'Join multiple PDFs',
// // // // // // // // // //         icon: Icons.picture_as_pdf_rounded,
// // // // // // // // // //         color: Colors.redAccent,
// // // // // // // // // //         category: 'PDF',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const PdfMergeScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'PDF Split',
// // // // // // // // // //         subtitle: 'Split PDF pages',
// // // // // // // // // //         icon: Icons.call_split_rounded,
// // // // // // // // // //         color: Colors.pink,
// // // // // // // // // //         category: 'PDF',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () =>
// // // // // // // // // //             Navigator.push(context, AppTransitions.scaleUp(const PdfSplit())),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'Image to PDF',
// // // // // // // // // //         subtitle: 'Convert images to PDF',
// // // // // // // // // //         icon: Icons.insert_drive_file_rounded,
// // // // // // // // // //         color: Colors.brown,
// // // // // // // // // //         category: 'Media',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const ImageToPdfScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'Image Converter',
// // // // // // // // // //         subtitle: 'Change image formats',
// // // // // // // // // //         icon: Icons.image_rounded,
// // // // // // // // // //         color: Colors.deepOrange,
// // // // // // // // // //         category: 'Media',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const ImageConverterScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'Image Resizer',
// // // // // // // // // //         subtitle: 'Resize images precisely',
// // // // // // // // // //         icon: Icons.photo_size_select_large_rounded,
// // // // // // // // // //         color: Colors.blue,
// // // // // // // // // //         category: 'Media',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const ImageResizerScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       _ToolItem(
// // // // // // // // // //         title: 'QR / Barcode Scanner',
// // // // // // // // // //         subtitle: 'Scan codes with camera',
// // // // // // // // // //         icon: Icons.document_scanner_rounded,
// // // // // // // // // //         color: Colors.deepPurple,
// // // // // // // // // //         category: 'Scanning',
// // // // // // // // // //         implemented: true,
// // // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // // //           context,
// // // // // // // // // //           AppTransitions.scaleUp(const QrBarcodeScannerScreen()),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //     ];
// // // // // // // // // //   }

// // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // //   // Build
// // // // // // // // // //   // ---------------------------------------------------------------------------
// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     final themeService = context.watch<ThemeService>();
// // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // //     final allTools = _tools(context);
// // // // // // // // // //     final filteredTools = allTools.where((tool) {
// // // // // // // // // //       final matchesQuery =
// // // // // // // // // //           _query.isEmpty ||
// // // // // // // // // //           tool.title.toLowerCase().contains(_query) ||
// // // // // // // // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // // // // // // // //           tool.category.toLowerCase().contains(_query);

// // // // // // // // // //       final matchesCategory =
// // // // // // // // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;

// // // // // // // // // //       return matchesQuery && matchesCategory;
// // // // // // // // // //     }).toList();

// // // // // // // // // //     return FadeTransition(
// // // // // // // // // //       opacity: _fadeIn,
// // // // // // // // // //       child: Scaffold(
// // // // // // // // // //         body: SafeArea(
// // // // // // // // // //           child: CustomScrollView(
// // // // // // // // // //             slivers: [
// // // // // // // // // //               // ── Header ──────────────────────────────────────────────────────
// // // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // // //                 child: Padding(
// // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // // // // // //                   child: Column(
// // // // // // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // //                     children: [
// // // // // // // // // //                       Row(
// // // // // // // // // //                         children: [
// // // // // // // // // //                           Container(
// // // // // // // // // //                             width: 54,
// // // // // // // // // //                             height: 54,
// // // // // // // // // //                             decoration: BoxDecoration(
// // // // // // // // // //                               gradient: LinearGradient(
// // // // // // // // // //                                 colors: [
// // // // // // // // // //                                   colorScheme.primary,
// // // // // // // // // //                                   colorScheme.tertiary,
// // // // // // // // // //                                 ],
// // // // // // // // // //                               ),
// // // // // // // // // //                               borderRadius: BorderRadius.circular(18),
// // // // // // // // // //                             ),
// // // // // // // // // //                             child: const Icon(
// // // // // // // // // //                               Icons.dashboard_rounded,
// // // // // // // // // //                               color: Colors.white,
// // // // // // // // // //                               size: 30,
// // // // // // // // // //                             ),
// // // // // // // // // //                           ),
// // // // // // // // // //                           const SizedBox(width: 14),
// // // // // // // // // //                           Expanded(
// // // // // // // // // //                             child: Column(
// // // // // // // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // //                               children: [
// // // // // // // // // //                                 Text(
// // // // // // // // // //                                   'ToolKit Pro',
// // // // // // // // // //                                   style: Theme.of(context)
// // // // // // // // // //                                       .textTheme
// // // // // // // // // //                                       .headlineSmall
// // // // // // // // // //                                       ?.copyWith(
// // // // // // // // // //                                         fontWeight: FontWeight.w900,
// // // // // // // // // //                                         letterSpacing: -0.5,
// // // // // // // // // //                                       ),
// // // // // // // // // //                                 ),
// // // // // // // // // //                                 const SizedBox(height: 4),
// // // // // // // // // //                                 Text(
// // // // // // // // // //                                   'Fast utilities, clean workflow, pro interface',
// // // // // // // // // //                                   style: Theme.of(context).textTheme.bodyMedium
// // // // // // // // // //                                       ?.copyWith(
// // // // // // // // // //                                         color: colorScheme.onSurfaceVariant,
// // // // // // // // // //                                       ),
// // // // // // // // // //                                 ),
// // // // // // // // // //                               ],
// // // // // // // // // //                             ),
// // // // // // // // // //                           ),
// // // // // // // // // //                           // Theme toggle with a subtle rotation animation.
// // // // // // // // // //                           _AnimatedThemeButton(themeService: themeService),
// // // // // // // // // //                         ],
// // // // // // // // // //                       ),
// // // // // // // // // //                       const SizedBox(height: 18),
// // // // // // // // // //                       Container(
// // // // // // // // // //                         width: double.infinity,
// // // // // // // // // //                         padding: const EdgeInsets.all(18),
// // // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // // //                           borderRadius: BorderRadius.circular(26),
// // // // // // // // // //                           gradient: LinearGradient(
// // // // // // // // // //                             begin: Alignment.topLeft,
// // // // // // // // // //                             end: Alignment.bottomRight,
// // // // // // // // // //                             colors: [
// // // // // // // // // //                               colorScheme.primaryContainer,
// // // // // // // // // //                               colorScheme.tertiaryContainer,
// // // // // // // // // //                             ],
// // // // // // // // // //                           ),
// // // // // // // // // //                         ),
// // // // // // // // // //                         child: Row(
// // // // // // // // // //                           children: [
// // // // // // // // // //                             Expanded(
// // // // // // // // // //                               child: Column(
// // // // // // // // // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // //                                 children: [
// // // // // // // // // //                                   Text(
// // // // // // // // // //                                     'Professional workspace',
// // // // // // // // // //                                     style: Theme.of(context)
// // // // // // // // // //                                         .textTheme
// // // // // // // // // //                                         .titleLarge
// // // // // // // // // //                                         ?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // // //                                   ),
// // // // // // // // // //                                   const SizedBox(height: 8),
// // // // // // // // // //                                   Text(
// // // // // // // // // //                                     'Search, launch, and manage your tools from one premium dashboard.',
// // // // // // // // // //                                     style: Theme.of(
// // // // // // // // // //                                       context,
// // // // // // // // // //                                     ).textTheme.bodyMedium,
// // // // // // // // // //                                   ),
// // // // // // // // // //                                 ],
// // // // // // // // // //                               ),
// // // // // // // // // //                             ),
// // // // // // // // // //                             const SizedBox(width: 12),
// // // // // // // // // //                             Container(
// // // // // // // // // //                               width: 66,
// // // // // // // // // //                               height: 66,
// // // // // // // // // //                               decoration: BoxDecoration(
// // // // // // // // // //                                 color: colorScheme.surface.withOpacity(0.35),
// // // // // // // // // //                                 borderRadius: BorderRadius.circular(20),
// // // // // // // // // //                               ),
// // // // // // // // // //                               child: Icon(
// // // // // // // // // //                                 Icons.auto_awesome_rounded,
// // // // // // // // // //                                 size: 34,
// // // // // // // // // //                                 color: colorScheme.onPrimaryContainer,
// // // // // // // // // //                               ),
// // // // // // // // // //                             ),
// // // // // // // // // //                           ],
// // // // // // // // // //                         ),
// // // // // // // // // //                       ),
// // // // // // // // // //                       const SizedBox(height: 18),
// // // // // // // // // //                       SearchBar(
// // // // // // // // // //                         controller: _searchController,
// // // // // // // // // //                         hintText: 'Search tools, calculators, PDFs...',
// // // // // // // // // //                         leading: const Icon(Icons.search_rounded),
// // // // // // // // // //                         trailing: const [Icon(Icons.tune_rounded)],
// // // // // // // // // //                         elevation: const WidgetStatePropertyAll(0),
// // // // // // // // // //                         backgroundColor: WidgetStatePropertyAll(
// // // // // // // // // //                           colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // // // // // // //                         ),
// // // // // // // // // //                         padding: const WidgetStatePropertyAll(
// // // // // // // // // //                           EdgeInsets.symmetric(horizontal: 18),
// // // // // // // // // //                         ),
// // // // // // // // // //                       ),
// // // // // // // // // //                     ],
// // // // // // // // // //                   ),
// // // // // // // // // //                 ),
// // // // // // // // // //               ),

// // // // // // // // // //               // ── Category chips ───────────────────────────────────────────────
// // // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // // //                 child: Padding(
// // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // // //                   child: SizedBox(
// // // // // // // // // //                     height: 42,
// // // // // // // // // //                     child: ListView.separated(
// // // // // // // // // //                       scrollDirection: Axis.horizontal,
// // // // // // // // // //                       itemCount: _categories.length,
// // // // // // // // // //                       separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // // // // // //                       itemBuilder: (context, index) {
// // // // // // // // // //                         final category = _categories[index];
// // // // // // // // // //                         final selected = category == _selectedCategory;

// // // // // // // // // //                         return AnimatedScale(
// // // // // // // // // //                           scale: selected ? 1.05 : 1.0,
// // // // // // // // // //                           duration: const Duration(milliseconds: 180),
// // // // // // // // // //                           curve: Curves.easeOutCubic,
// // // // // // // // // //                           child: ChoiceChip(
// // // // // // // // // //                             label: Text(category),
// // // // // // // // // //                             selected: selected,
// // // // // // // // // //                             onSelected: (_) {
// // // // // // // // // //                               setState(() {
// // // // // // // // // //                                 _selectedCategory = category;
// // // // // // // // // //                               });
// // // // // // // // // //                             },
// // // // // // // // // //                           ),
// // // // // // // // // //                         );
// // // // // // // // // //                       },
// // // // // // // // // //                     ),
// // // // // // // // // //                   ),
// // // // // // // // // //                 ),
// // // // // // // // // //               ),

// // // // // // // // // //               // ── Section header ───────────────────────────────────────────────
// // // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // // //                 child: Padding(
// // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // // //                   child: Row(
// // // // // // // // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // // //                     children: [
// // // // // // // // // //                       Text(
// // // // // // // // // //                         'Featured tools',
// // // // // // // // // //                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // // // // // // //                           fontWeight: FontWeight.w800,
// // // // // // // // // //                         ),
// // // // // // // // // //                       ),
// // // // // // // // // //                       AnimatedSwitcher(
// // // // // // // // // //                         duration: const Duration(milliseconds: 220),
// // // // // // // // // //                         child: Text(
// // // // // // // // // //                           '${filteredTools.length} shown',
// // // // // // // // // //                           key: ValueKey(filteredTools.length),
// // // // // // // // // //                           style: TextStyle(
// // // // // // // // // //                             color: colorScheme.primary,
// // // // // // // // // //                             fontWeight: FontWeight.w700,
// // // // // // // // // //                           ),
// // // // // // // // // //                         ),
// // // // // // // // // //                       ),
// // // // // // // // // //                     ],
// // // // // // // // // //                   ),
// // // // // // // // // //                 ),
// // // // // // // // // //               ),

// // // // // // // // // //               // ── Tool grid ───────────────────────────────────────────────────
// // // // // // // // // //               if (filteredTools.isEmpty)
// // // // // // // // // //                 SliverFillRemaining(
// // // // // // // // // //                   hasScrollBody: false,
// // // // // // // // // //                   child: _EmptyState(
// // // // // // // // // //                     query: _query,
// // // // // // // // // //                     category: _selectedCategory,
// // // // // // // // // //                   ),
// // // // // // // // // //                 )
// // // // // // // // // //               else
// // // // // // // // // //                 SliverPadding(
// // // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // // // // // //                   sliver: SliverGrid(
// // // // // // // // // //                     gridDelegate:
// // // // // // // // // //                         const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // // // // //                           crossAxisCount: 2,
// // // // // // // // // //                           mainAxisSpacing: 14,
// // // // // // // // // //                           crossAxisSpacing: 14,
// // // // // // // // // //                           childAspectRatio: 0.82,
// // // // // // // // // //                         ),
// // // // // // // // // //                     delegate: SliverChildBuilderDelegate((context, index) {
// // // // // // // // // //                       final tool = filteredTools[index];
// // // // // // // // // //                       // Stagger card entry animations.
// // // // // // // // // //                       return _StaggeredToolCard(tool: tool, index: index);
// // // // // // // // // //                     }, childCount: filteredTools.length),
// // // // // // // // // //                   ),
// // // // // // // // // //                 ),
// // // // // // // // // //             ],
// // // // // // // // // //           ),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // Animated theme toggle button
// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // class _AnimatedThemeButton extends StatefulWidget {
// // // // // // // // // //   final ThemeService themeService;
// // // // // // // // // //   const _AnimatedThemeButton({required this.themeService});

// // // // // // // // // //   @override
// // // // // // // // // //   State<_AnimatedThemeButton> createState() => _AnimatedThemeButtonState();
// // // // // // // // // // }

// // // // // // // // // // class _AnimatedThemeButtonState extends State<_AnimatedThemeButton>
// // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // //   late final AnimationController _ctrl;
// // // // // // // // // //   late final Animation<double> _rotate;

// // // // // // // // // //   @override
// // // // // // // // // //   void initState() {
// // // // // // // // // //     super.initState();
// // // // // // // // // //     _ctrl = AnimationController(
// // // // // // // // // //       vsync: this,
// // // // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // // // //     );
// // // // // // // // // //     _rotate = Tween<double>(
// // // // // // // // // //       begin: 0.0,
// // // // // // // // // //       end: 0.5,
// // // // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   void dispose() {
// // // // // // // // // //     _ctrl.dispose();
// // // // // // // // // //     super.dispose();
// // // // // // // // // //   }

// // // // // // // // // //   void _toggle() {
// // // // // // // // // //     _ctrl.forward(from: 0.0);
// // // // // // // // // //     widget.themeService.toggleTheme();
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return RotationTransition(
// // // // // // // // // //       turns: _rotate,
// // // // // // // // // //       child: IconButton.filledTonal(
// // // // // // // // // //         onPressed: _toggle,
// // // // // // // // // //         icon: Icon(
// // // // // // // // // //           widget.themeService.isDark
// // // // // // // // // //               ? Icons.light_mode_rounded
// // // // // // // // // //               : Icons.dark_mode_rounded,
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // Staggered tool card — fades + slides in based on grid index
// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // class _StaggeredToolCard extends StatefulWidget {
// // // // // // // // // //   final _ToolItem tool;
// // // // // // // // // //   final int index;
// // // // // // // // // //   const _StaggeredToolCard({required this.tool, required this.index});

// // // // // // // // // //   @override
// // // // // // // // // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // // // // // // // // }

// // // // // // // // // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // //   late final AnimationController _ctrl;
// // // // // // // // // //   late final Animation<double> _fade;
// // // // // // // // // //   late final Animation<Offset> _slide;

// // // // // // // // // //   @override
// // // // // // // // // //   void initState() {
// // // // // // // // // //     super.initState();
// // // // // // // // // //     _ctrl = AnimationController(
// // // // // // // // // //       vsync: this,
// // // // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // // // //     );
// // // // // // // // // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // // // // // // // // //     _slide = Tween<Offset>(
// // // // // // // // // //       begin: const Offset(0, 0.08),
// // // // // // // // // //       end: Offset.zero,
// // // // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // // // // // // // // //     // Stagger delay: 35 ms per card, capped at 280 ms.
// // // // // // // // // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // // // // // // // // //     Future.delayed(delay, () {
// // // // // // // // // //       if (mounted) _ctrl.forward();
// // // // // // // // // //     });
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   void dispose() {
// // // // // // // // // //     _ctrl.dispose();
// // // // // // // // // //     super.dispose();
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return FadeTransition(
// // // // // // // // // //       opacity: _fade,
// // // // // // // // // //       child: SlideTransition(
// // // // // // // // // //         position: _slide,
// // // // // // // // // //         child: _ToolCard(tool: widget.tool),
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // Tool card with press feedback
// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // class _ToolCard extends StatefulWidget {
// // // // // // // // // //   final _ToolItem tool;
// // // // // // // // // //   const _ToolCard({required this.tool});

// // // // // // // // // //   @override
// // // // // // // // // //   State<_ToolCard> createState() => _ToolCardState();
// // // // // // // // // // }

// // // // // // // // // // class _ToolCardState extends State<_ToolCard>
// // // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // // //   late final AnimationController _pressCtrl;
// // // // // // // // // //   late final Animation<double> _pressScale;

// // // // // // // // // //   @override
// // // // // // // // // //   void initState() {
// // // // // // // // // //     super.initState();
// // // // // // // // // //     _pressCtrl = AnimationController(
// // // // // // // // // //       vsync: this,
// // // // // // // // // //       duration: const Duration(milliseconds: 100),
// // // // // // // // // //       reverseDuration: const Duration(milliseconds: 200),
// // // // // // // // // //       lowerBound: 0.0,
// // // // // // // // // //       upperBound: 1.0,
// // // // // // // // // //     );
// // // // // // // // // //     _pressScale = Tween<double>(
// // // // // // // // // //       begin: 1.0,
// // // // // // // // // //       end: 0.95,
// // // // // // // // // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   void dispose() {
// // // // // // // // // //     _pressCtrl.dispose();
// // // // // // // // // //     super.dispose();
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // // // // // // //     final tool = widget.tool;

// // // // // // // // // //     return ScaleTransition(
// // // // // // // // // //       scale: _pressScale,
// // // // // // // // // //       child: GestureDetector(
// // // // // // // // // //         onTapDown: (_) => _pressCtrl.forward(),
// // // // // // // // // //         onTapUp: (_) => _pressCtrl.reverse(),
// // // // // // // // // //         onTapCancel: () => _pressCtrl.reverse(),
// // // // // // // // // //         onTap: tool.implemented
// // // // // // // // // //             ? tool.onTap
// // // // // // // // // //             : () {
// // // // // // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // // //                   SnackBar(
// // // // // // // // // //                     content: Text('${tool.title} is coming soon.'),
// // // // // // // // // //                     behavior: SnackBarBehavior.floating,
// // // // // // // // // //                   ),
// // // // // // // // // //                 );
// // // // // // // // // //               },
// // // // // // // // // //         child: Container(
// // // // // // // // // //           decoration: BoxDecoration(
// // // // // // // // // //             color: colorScheme.surface,
// // // // // // // // // //             borderRadius: BorderRadius.circular(24),
// // // // // // // // // //             border: Border.all(
// // // // // // // // // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // // // // // // // // //             ),
// // // // // // // // // //             boxShadow: [
// // // // // // // // // //               BoxShadow(
// // // // // // // // // //                 color: Colors.black.withOpacity(0.05),
// // // // // // // // // //                 blurRadius: 20,
// // // // // // // // // //                 offset: const Offset(0, 10),
// // // // // // // // // //               ),
// // // // // // // // // //             ],
// // // // // // // // // //           ),
// // // // // // // // // //           child: Stack(
// // // // // // // // // //             children: [
// // // // // // // // // //               Positioned(
// // // // // // // // // //                 top: 14,
// // // // // // // // // //                 right: 14,
// // // // // // // // // //                 child: Container(
// // // // // // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // // // // // //                     horizontal: 9,
// // // // // // // // // //                     vertical: 4,
// // // // // // // // // //                   ),
// // // // // // // // // //                   decoration: BoxDecoration(
// // // // // // // // // //                     color: tool.implemented
// // // // // // // // // //                         ? tool.color.withOpacity(0.12)
// // // // // // // // // //                         : Colors.grey.withOpacity(0.12),
// // // // // // // // // //                     borderRadius: BorderRadius.circular(999),
// // // // // // // // // //                   ),
// // // // // // // // // //                   child: Text(
// // // // // // // // // //                     tool.implemented ? 'Live' : 'Soon',
// // // // // // // // // //                     style: TextStyle(
// // // // // // // // // //                       fontSize: 10,
// // // // // // // // // //                       fontWeight: FontWeight.w800,
// // // // // // // // // //                       color: tool.implemented ? tool.color : Colors.grey,
// // // // // // // // // //                     ),
// // // // // // // // // //                   ),
// // // // // // // // // //                 ),
// // // // // // // // // //               ),
// // // // // // // // // //               Padding(
// // // // // // // // // //                 padding: const EdgeInsets.all(16),
// // // // // // // // // //                 child: Column(
// // // // // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // // //                   children: [
// // // // // // // // // //                     // Hero wraps the icon so it morphs into the AppBar icon
// // // // // // // // // //                     // on the destination screen (when supported).
// // // // // // // // // //                     Hero(
// // // // // // // // // //                       tag: 'tool-icon-${tool.title}',
// // // // // // // // // //                       child: Container(
// // // // // // // // // //                         width: 56,
// // // // // // // // // //                         height: 56,
// // // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // // //                           gradient: LinearGradient(
// // // // // // // // // //                             colors: [
// // // // // // // // // //                               tool.color.withOpacity(0.95),
// // // // // // // // // //                               tool.color.withOpacity(0.55),
// // // // // // // // // //                             ],
// // // // // // // // // //                           ),
// // // // // // // // // //                           borderRadius: BorderRadius.circular(18),
// // // // // // // // // //                         ),
// // // // // // // // // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // // // // // // // // //                       ),
// // // // // // // // // //                     ),
// // // // // // // // // //                     Column(
// // // // // // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // //                       children: [
// // // // // // // // // //                         Text(
// // // // // // // // // //                           tool.title,
// // // // // // // // // //                           style: const TextStyle(
// // // // // // // // // //                             fontSize: 15,
// // // // // // // // // //                             fontWeight: FontWeight.w800,
// // // // // // // // // //                           ),
// // // // // // // // // //                         ),
// // // // // // // // // //                         const SizedBox(height: 6),
// // // // // // // // // //                         Text(
// // // // // // // // // //                           tool.subtitle,
// // // // // // // // // //                           maxLines: 2,
// // // // // // // // // //                           style: TextStyle(
// // // // // // // // // //                             color: colorScheme.onSurfaceVariant,
// // // // // // // // // //                             fontSize: 12.5,
// // // // // // // // // //                             height: 1.25,
// // // // // // // // // //                           ),
// // // // // // // // // //                         ),
// // // // // // // // // //                       ],
// // // // // // // // // //                     ),
// // // // // // // // // //                   ],
// // // // // // // // // //                 ),
// // // // // // // // // //               ),
// // // // // // // // // //             ],
// // // // // // // // // //           ),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // Empty state
// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // class _EmptyState extends StatelessWidget {
// // // // // // // // // //   final String query;
// // // // // // // // // //   final String category;

// // // // // // // // // //   const _EmptyState({required this.query, required this.category});

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // // //     return Center(
// // // // // // // // // //       child: Padding(
// // // // // // // // // //         padding: const EdgeInsets.all(24),
// // // // // // // // // //         child: Column(
// // // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // // //           children: [
// // // // // // // // // //             Container(
// // // // // // // // // //               width: 94,
// // // // // // // // // //               height: 94,
// // // // // // // // // //               decoration: BoxDecoration(
// // // // // // // // // //                 color: colorScheme.primaryContainer,
// // // // // // // // // //                 borderRadius: BorderRadius.circular(28),
// // // // // // // // // //               ),
// // // // // // // // // //               child: Icon(
// // // // // // // // // //                 Icons.search_off_rounded,
// // // // // // // // // //                 size: 44,
// // // // // // // // // //                 color: colorScheme.onPrimaryContainer,
// // // // // // // // // //               ),
// // // // // // // // // //             ),
// // // // // // // // // //             const SizedBox(height: 18),
// // // // // // // // // //             Text(
// // // // // // // // // //               'No matching tools',
// // // // // // // // // //               style: Theme.of(
// // // // // // // // // //                 context,
// // // // // // // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // // //             ),
// // // // // // // // // //             const SizedBox(height: 8),
// // // // // // // // // //             Text(
// // // // // // // // // //               query.isEmpty
// // // // // // // // // //                   ? 'No tools found in $category.'
// // // // // // // // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // // // // // // // //               textAlign: TextAlign.center,
// // // // // // // // // //               style: TextStyle(
// // // // // // // // // //                 color: colorScheme.onSurfaceVariant,
// // // // // // // // // //                 height: 1.4,
// // // // // // // // // //               ),
// // // // // // // // // //             ),
// // // // // // // // // //           ],
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // // Data model
// // // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // class _ToolItem {
// // // // // // // // // //   final String title;
// // // // // // // // // //   final String subtitle;
// // // // // // // // // //   final IconData icon;
// // // // // // // // // //   final Color color;
// // // // // // // // // //   final String category;
// // // // // // // // // //   final bool implemented;
// // // // // // // // // //   final VoidCallback? onTap;

// // // // // // // // // //   const _ToolItem({
// // // // // // // // // //     required this.title,
// // // // // // // // // //     required this.subtitle,
// // // // // // // // // //     required this.icon,
// // // // // // // // // //     required this.color,
// // // // // // // // // //     required this.category,
// // // // // // // // // //     required this.implemented,
// // // // // // // // // //     this.onTap,
// // // // // // // // // //   });
// // // // // // // // // // }
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:provider/provider.dart';

// // // // // // // // // import '../services/theme_service.dart';
// // // // // // // // // import '../utils/app_transitions.dart';
// // // // // // // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // // // // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // // // // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // // // // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // // // // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // // // // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // // // // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // // // // // // import '../features/pdf_split/pdf_split.dart';
// // // // // // // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // // // // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // // // // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // // // // // // import '../features/image_converter/image_converter_screen.dart';
// // // // // // // // // import '../features/pdf_compress/pdf_compress_screen.dart';

// // // // // // // // // class HomeScreen extends StatefulWidget {
// // // // // // // // //   const HomeScreen({super.key});

// // // // // // // // //   @override
// // // // // // // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // // // // // // }

// // // // // // // // // class _HomeScreenState extends State<HomeScreen>
// // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // //   final TextEditingController _searchController = TextEditingController();
// // // // // // // // //   String _query = '';
// // // // // // // // //   String _selectedCategory = 'All';

// // // // // // // // //   late final AnimationController _fadeInController;
// // // // // // // // //   late final Animation<double> _fadeIn;

// // // // // // // // //   final List<String> _categories = [
// // // // // // // // //     'All',
// // // // // // // // //     'Media',
// // // // // // // // //     'PDF',
// // // // // // // // //     'Calculators',
// // // // // // // // //     'Scanning',
// // // // // // // // //   ];

// // // // // // // // //   @override
// // // // // // // // //   void initState() {
// // // // // // // // //     super.initState();

// // // // // // // // //     _fadeInController = AnimationController(
// // // // // // // // //       vsync: this,
// // // // // // // // //       duration: const Duration(milliseconds: 520),
// // // // // // // // //     );
// // // // // // // // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // //       _fadeInController.forward();
// // // // // // // // //     });

// // // // // // // // //     _searchController.addListener(() {
// // // // // // // // //       setState(() {
// // // // // // // // //         _query = _searchController.text.toLowerCase().trim();
// // // // // // // // //       });
// // // // // // // // //     });
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   void dispose() {
// // // // // // // // //     _fadeInController.dispose();
// // // // // // // // //     _searchController.dispose();
// // // // // // // // //     super.dispose();
// // // // // // // // //   }

// // // // // // // // //   // ─── Tool definitions (all use elasticIn) ──────────────────────────────

// // // // // // // // //   List<_ToolItem> _tools(BuildContext context) {
// // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // //     return [
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'QR Code Generator',
// // // // // // // // //         subtitle: 'Create modern QR codes',
// // // // // // // // //         icon: Icons.qr_code_rounded,
// // // // // // // // //         color: colorScheme.primary,
// // // // // // // // //         category: 'Scanning',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'Barcode Generator',
// // // // // // // // //         subtitle: 'Generate barcodes instantly',
// // // // // // // // //         icon: Icons.document_scanner,
// // // // // // // // //         color: Colors.teal,
// // // // // // // // //         category: 'Scanning',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'Image Compressor',
// // // // // // // // //         subtitle: 'Reduce image size fast',
// // // // // // // // //         icon: Icons.compress_rounded,
// // // // // // // // //         color: Colors.green,
// // // // // // // // //         category: 'Media',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const ImageCompressorScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'Age Calculator',
// // // // // // // // //         subtitle: 'Calculate exact age',
// // // // // // // // //         icon: Icons.cake_rounded,
// // // // // // // // //         color: Colors.orange,
// // // // // // // // //         category: 'Calculators',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const AgeCalculatorScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'BMI Calculator',
// // // // // // // // //         subtitle: 'Track your body mass index',
// // // // // // // // //         icon: Icons.monitor_weight_rounded,
// // // // // // // // //         color: Colors.cyan,
// // // // // // // // //         category: 'Calculators',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const BmiCalculatorScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'Unit Converter',
// // // // // // // // //         subtitle: 'Convert units quickly',
// // // // // // // // //         icon: Icons.swap_horiz_rounded,
// // // // // // // // //         color: Colors.indigo,
// // // // // // // // //         category: 'Calculators',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const UnitConverterScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'PDF Merge',
// // // // // // // // //         subtitle: 'Join multiple PDFs',
// // // // // // // // //         icon: Icons.picture_as_pdf_rounded,
// // // // // // // // //         color: Colors.redAccent,
// // // // // // // // //         category: 'PDF',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const PdfMergeScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),

// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'PDF Compress',
// // // // // // // // //         subtitle: 'Compress  heavy  PDFs',
// // // // // // // // //         icon: Icons.contrast_rounded,
// // // // // // // // //         color: Colors.amber,
// // // // // // // // //         category: 'PDF',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const PdfCompressScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'PDF Split',
// // // // // // // // //         subtitle: 'Split PDF pages',
// // // // // // // // //         icon: Icons.call_split_rounded,
// // // // // // // // //         color: Colors.pink,
// // // // // // // // //         category: 'PDF',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () =>
// // // // // // // // //             Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'Image to PDF',
// // // // // // // // //         subtitle: 'Convert images to PDF',
// // // // // // // // //         icon: Icons.insert_drive_file_rounded,
// // // // // // // // //         color: Colors.brown,
// // // // // // // // //         category: 'Media',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const ImageToPdfScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'Image Converter',
// // // // // // // // //         subtitle: 'Change image formats',
// // // // // // // // //         icon: Icons.image_rounded,
// // // // // // // // //         color: Colors.deepOrange,
// // // // // // // // //         category: 'Media',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const ImageConverterScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'Image Resizer',
// // // // // // // // //         subtitle: 'Resize images precisely',
// // // // // // // // //         icon: Icons.photo_size_select_large_rounded,
// // // // // // // // //         color: Colors.blue,
// // // // // // // // //         category: 'Media',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const ImageResizerScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       _ToolItem(
// // // // // // // // //         title: 'QR / Barcode Scanner',
// // // // // // // // //         subtitle: 'Scan codes with camera',
// // // // // // // // //         icon: Icons.document_scanner_rounded,
// // // // // // // // //         color: Colors.deepPurple,
// // // // // // // // //         category: 'Scanning',
// // // // // // // // //         implemented: true,
// // // // // // // // //         onTap: () => Navigator.push(
// // // // // // // // //           context,
// // // // // // // // //           AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     ];
// // // // // // // // //   }

// // // // // // // // //   // ─── Build ───────────────────────────────────────────────────────────────────

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     final themeService = context.watch<ThemeService>();
// // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // //     final allTools = _tools(context);
// // // // // // // // //     final filteredTools = allTools.where((tool) {
// // // // // // // // //       final matchesQuery =
// // // // // // // // //           _query.isEmpty ||
// // // // // // // // //           tool.title.toLowerCase().contains(_query) ||
// // // // // // // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // // // // // // //           tool.category.toLowerCase().contains(_query);

// // // // // // // // //       final matchesCategory =
// // // // // // // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;

// // // // // // // // //       return matchesQuery && matchesCategory;
// // // // // // // // //     }).toList();

// // // // // // // // //     return FadeTransition(
// // // // // // // // //       opacity: _fadeIn,
// // // // // // // // //       child: Scaffold(
// // // // // // // // //         body: SafeArea(
// // // // // // // // //           child: CustomScrollView(
// // // // // // // // //             slivers: [
// // // // // // // // //               // ── Header ──────────────────────────────────────────────────────
// // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // //                 child: Padding(
// // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // // // // //                   child: Column(
// // // // // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //                     children: [
// // // // // // // // //                       Row(
// // // // // // // // //                         children: [
// // // // // // // // //                           Container(
// // // // // // // // //                             width: 54,
// // // // // // // // //                             height: 54,
// // // // // // // // //                             decoration: BoxDecoration(
// // // // // // // // //                               gradient: LinearGradient(
// // // // // // // // //                                 colors: [
// // // // // // // // //                                   colorScheme.primary,
// // // // // // // // //                                   colorScheme.tertiary,
// // // // // // // // //                                 ],
// // // // // // // // //                               ),
// // // // // // // // //                               borderRadius: BorderRadius.circular(18),
// // // // // // // // //                             ),
// // // // // // // // //                             child: const Icon(
// // // // // // // // //                               Icons.dashboard_rounded,
// // // // // // // // //                               color: Colors.white,
// // // // // // // // //                               size: 30,
// // // // // // // // //                             ),
// // // // // // // // //                           ),
// // // // // // // // //                           const SizedBox(width: 14),
// // // // // // // // //                           Expanded(
// // // // // // // // //                             child: Column(
// // // // // // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //                               children: [
// // // // // // // // //                                 Text(
// // // // // // // // //                                   'ToolKit Pro',
// // // // // // // // //                                   style: Theme.of(context)
// // // // // // // // //                                       .textTheme
// // // // // // // // //                                       .headlineSmall
// // // // // // // // //                                       ?.copyWith(
// // // // // // // // //                                         fontWeight: FontWeight.w900,
// // // // // // // // //                                         letterSpacing: -0.5,
// // // // // // // // //                                       ),
// // // // // // // // //                                 ),
// // // // // // // // //                                 const SizedBox(height: 4),
// // // // // // // // //                                 Text(
// // // // // // // // //                                   'Fast utilities, clean workflow, pro interface',
// // // // // // // // //                                   style: Theme.of(context).textTheme.bodyMedium
// // // // // // // // //                                       ?.copyWith(
// // // // // // // // //                                         color: colorScheme.onSurfaceVariant,
// // // // // // // // //                                       ),
// // // // // // // // //                                 ),
// // // // // // // // //                               ],
// // // // // // // // //                             ),
// // // // // // // // //                           ),
// // // // // // // // //                           _AnimatedThemeButton(themeService: themeService),
// // // // // // // // //                         ],
// // // // // // // // //                       ),
// // // // // // // // //                       const SizedBox(height: 18),
// // // // // // // // //                       Container(
// // // // // // // // //                         width: double.infinity,
// // // // // // // // //                         padding: const EdgeInsets.all(18),
// // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // //                           borderRadius: BorderRadius.circular(26),
// // // // // // // // //                           gradient: LinearGradient(
// // // // // // // // //                             begin: Alignment.topLeft,
// // // // // // // // //                             end: Alignment.bottomRight,
// // // // // // // // //                             colors: [
// // // // // // // // //                               colorScheme.primaryContainer,
// // // // // // // // //                               colorScheme.tertiaryContainer,
// // // // // // // // //                             ],
// // // // // // // // //                           ),
// // // // // // // // //                         ),
// // // // // // // // //                         child: Row(
// // // // // // // // //                           children: [
// // // // // // // // //                             Expanded(
// // // // // // // // //                               child: Column(
// // // // // // // // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //                                 children: [
// // // // // // // // //                                   Text(
// // // // // // // // //                                     'Professional workspace',
// // // // // // // // //                                     style: Theme.of(context)
// // // // // // // // //                                         .textTheme
// // // // // // // // //                                         .titleLarge
// // // // // // // // //                                         ?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // //                                   ),
// // // // // // // // //                                   const SizedBox(height: 8),
// // // // // // // // //                                   Text(
// // // // // // // // //                                     'Search, launch, and manage your tools from one premium dashboard.',
// // // // // // // // //                                     style: Theme.of(
// // // // // // // // //                                       context,
// // // // // // // // //                                     ).textTheme.bodyMedium,
// // // // // // // // //                                   ),
// // // // // // // // //                                 ],
// // // // // // // // //                               ),
// // // // // // // // //                             ),
// // // // // // // // //                             const SizedBox(width: 12),
// // // // // // // // //                             Container(
// // // // // // // // //                               width: 66,
// // // // // // // // //                               height: 66,
// // // // // // // // //                               decoration: BoxDecoration(
// // // // // // // // //                                 color: colorScheme.surface.withOpacity(0.35),
// // // // // // // // //                                 borderRadius: BorderRadius.circular(20),
// // // // // // // // //                               ),
// // // // // // // // //                               child: Icon(
// // // // // // // // //                                 Icons.auto_awesome_rounded,
// // // // // // // // //                                 size: 34,
// // // // // // // // //                                 color: colorScheme.onPrimaryContainer,
// // // // // // // // //                               ),
// // // // // // // // //                             ),
// // // // // // // // //                           ],
// // // // // // // // //                         ),
// // // // // // // // //                       ),
// // // // // // // // //                       const SizedBox(height: 18),
// // // // // // // // //                       SearchBar(
// // // // // // // // //                         controller: _searchController,
// // // // // // // // //                         hintText: 'Search tools, calculators, PDFs...',
// // // // // // // // //                         leading: const Icon(Icons.search_rounded),
// // // // // // // // //                         trailing: const [Icon(Icons.tune_rounded)],
// // // // // // // // //                         elevation: const WidgetStatePropertyAll(0),
// // // // // // // // //                         backgroundColor: WidgetStatePropertyAll(
// // // // // // // // //                           colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // // // // // //                         ),
// // // // // // // // //                         padding: const WidgetStatePropertyAll(
// // // // // // // // //                           EdgeInsets.symmetric(horizontal: 18),
// // // // // // // // //                         ),
// // // // // // // // //                       ),
// // // // // // // // //                     ],
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //               ),

// // // // // // // // //               // ── Category chips ───────────────────────────────────────────────
// // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // //                 child: Padding(
// // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // //                   child: SizedBox(
// // // // // // // // //                     height: 42,
// // // // // // // // //                     child: ListView.separated(
// // // // // // // // //                       scrollDirection: Axis.horizontal,
// // // // // // // // //                       itemCount: _categories.length,
// // // // // // // // //                       separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // // // // //                       itemBuilder: (context, index) {
// // // // // // // // //                         final category = _categories[index];
// // // // // // // // //                         final selected = category == _selectedCategory;

// // // // // // // // //                         return AnimatedScale(
// // // // // // // // //                           scale: selected ? 1.05 : 1.0,
// // // // // // // // //                           duration: const Duration(milliseconds: 180),
// // // // // // // // //                           curve: Curves.easeOutCubic,
// // // // // // // // //                           child: ChoiceChip(
// // // // // // // // //                             label: Text(category),
// // // // // // // // //                             selected: selected,
// // // // // // // // //                             onSelected: (_) {
// // // // // // // // //                               setState(() {
// // // // // // // // //                                 _selectedCategory = category;
// // // // // // // // //                               });
// // // // // // // // //                             },
// // // // // // // // //                           ),
// // // // // // // // //                         );
// // // // // // // // //                       },
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //               ),

// // // // // // // // //               // ── Section header ───────────────────────────────────────────────
// // // // // // // // //               SliverToBoxAdapter(
// // // // // // // // //                 child: Padding(
// // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // // //                   child: Row(
// // // // // // // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // //                     children: [
// // // // // // // // //                       Text(
// // // // // // // // //                         'Featured tools',
// // // // // // // // //                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // // // // // //                           fontWeight: FontWeight.w800,
// // // // // // // // //                         ),
// // // // // // // // //                       ),
// // // // // // // // //                       AnimatedSwitcher(
// // // // // // // // //                         duration: const Duration(milliseconds: 220),
// // // // // // // // //                         child: Text(
// // // // // // // // //                           '${filteredTools.length} shown',
// // // // // // // // //                           key: ValueKey(filteredTools.length),
// // // // // // // // //                           style: TextStyle(
// // // // // // // // //                             color: colorScheme.primary,
// // // // // // // // //                             fontWeight: FontWeight.w700,
// // // // // // // // //                           ),
// // // // // // // // //                         ),
// // // // // // // // //                       ),
// // // // // // // // //                     ],
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //               ),

// // // // // // // // //               // ── Tool grid ───────────────────────────────────────────────────
// // // // // // // // //               if (filteredTools.isEmpty)
// // // // // // // // //                 SliverFillRemaining(
// // // // // // // // //                   hasScrollBody: false,
// // // // // // // // //                   child: _EmptyState(
// // // // // // // // //                     query: _query,
// // // // // // // // //                     category: _selectedCategory,
// // // // // // // // //                   ),
// // // // // // // // //                 )
// // // // // // // // //               else
// // // // // // // // //                 SliverPadding(
// // // // // // // // //                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // // // // //                   sliver: SliverGrid(
// // // // // // // // //                     gridDelegate:
// // // // // // // // //                         const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // // // //                           crossAxisCount: 2,
// // // // // // // // //                           mainAxisSpacing: 14,
// // // // // // // // //                           crossAxisSpacing: 14,
// // // // // // // // //                           childAspectRatio: 0.82,
// // // // // // // // //                         ),
// // // // // // // // //                     delegate: SliverChildBuilderDelegate((context, index) {
// // // // // // // // //                       final tool = filteredTools[index];
// // // // // // // // //                       return _StaggeredToolCard(tool: tool, index: index);
// // // // // // // // //                     }, childCount: filteredTools.length),
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // Animated theme toggle button
// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // class _AnimatedThemeButton extends StatefulWidget {
// // // // // // // // //   final ThemeService themeService;
// // // // // // // // //   const _AnimatedThemeButton({required this.themeService});

// // // // // // // // //   @override
// // // // // // // // //   State<_AnimatedThemeButton> createState() => _AnimatedThemeButtonState();
// // // // // // // // // }

// // // // // // // // // class _AnimatedThemeButtonState extends State<_AnimatedThemeButton>
// // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // //   late final AnimationController _ctrl;
// // // // // // // // //   late final Animation<double> _rotate;

// // // // // // // // //   @override
// // // // // // // // //   void initState() {
// // // // // // // // //     super.initState();
// // // // // // // // //     _ctrl = AnimationController(
// // // // // // // // //       vsync: this,
// // // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // // //     );
// // // // // // // // //     _rotate = Tween<double>(
// // // // // // // // //       begin: 0.0,
// // // // // // // // //       end: 0.5,
// // // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   void dispose() {
// // // // // // // // //     _ctrl.dispose();
// // // // // // // // //     super.dispose();
// // // // // // // // //   }

// // // // // // // // //   void _toggle() {
// // // // // // // // //     _ctrl.forward(from: 0.0);
// // // // // // // // //     widget.themeService.toggleTheme();
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return RotationTransition(
// // // // // // // // //       turns: _rotate,
// // // // // // // // //       child: IconButton.filledTonal(
// // // // // // // // //         onPressed: _toggle,
// // // // // // // // //         icon: Icon(
// // // // // // // // //           widget.themeService.isDark
// // // // // // // // //               ? Icons.light_mode_rounded
// // // // // // // // //               : Icons.dark_mode_rounded,
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // Staggered tool card — fades + slides in based on grid index
// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // class _StaggeredToolCard extends StatefulWidget {
// // // // // // // // //   final _ToolItem tool;
// // // // // // // // //   final int index;
// // // // // // // // //   const _StaggeredToolCard({required this.tool, required this.index});

// // // // // // // // //   @override
// // // // // // // // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // // // // // // // }

// // // // // // // // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // //   late final AnimationController _ctrl;
// // // // // // // // //   late final Animation<double> _fade;
// // // // // // // // //   late final Animation<Offset> _slide;

// // // // // // // // //   @override
// // // // // // // // //   void initState() {
// // // // // // // // //     super.initState();
// // // // // // // // //     _ctrl = AnimationController(
// // // // // // // // //       vsync: this,
// // // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // // //     );
// // // // // // // // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // // // // // // // //     _slide = Tween<Offset>(
// // // // // // // // //       begin: const Offset(0, 0.08),
// // // // // // // // //       end: Offset.zero,
// // // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // // // // // // // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // // // // // // // //     Future.delayed(delay, () {
// // // // // // // // //       if (mounted) _ctrl.forward();
// // // // // // // // //     });
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   void dispose() {
// // // // // // // // //     _ctrl.dispose();
// // // // // // // // //     super.dispose();
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return FadeTransition(
// // // // // // // // //       opacity: _fade,
// // // // // // // // //       child: SlideTransition(
// // // // // // // // //         position: _slide,
// // // // // // // // //         child: _ToolCard(tool: widget.tool),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // Tool card with press feedback
// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // class _ToolCard extends StatefulWidget {
// // // // // // // // //   final _ToolItem tool;
// // // // // // // // //   const _ToolCard({required this.tool});

// // // // // // // // //   @override
// // // // // // // // //   State<_ToolCard> createState() => _ToolCardState();
// // // // // // // // // }

// // // // // // // // // class _ToolCardState extends State<_ToolCard>
// // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // //   late final AnimationController _pressCtrl;
// // // // // // // // //   late final Animation<double> _pressScale;

// // // // // // // // //   @override
// // // // // // // // //   void initState() {
// // // // // // // // //     super.initState();
// // // // // // // // //     _pressCtrl = AnimationController(
// // // // // // // // //       vsync: this,
// // // // // // // // //       duration: const Duration(milliseconds: 100),
// // // // // // // // //       reverseDuration: const Duration(milliseconds: 200),
// // // // // // // // //       lowerBound: 0.0,
// // // // // // // // //       upperBound: 1.0,
// // // // // // // // //     );
// // // // // // // // //     _pressScale = Tween<double>(
// // // // // // // // //       begin: 1.0,
// // // // // // // // //       end: 0.95,
// // // // // // // // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   void dispose() {
// // // // // // // // //     _pressCtrl.dispose();
// // // // // // // // //     super.dispose();
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // // // // // //     final tool = widget.tool;

// // // // // // // // //     return ScaleTransition(
// // // // // // // // //       scale: _pressScale,
// // // // // // // // //       child: GestureDetector(
// // // // // // // // //         onTapDown: (_) => _pressCtrl.forward(),
// // // // // // // // //         onTapUp: (_) => _pressCtrl.reverse(),
// // // // // // // // //         onTapCancel: () => _pressCtrl.reverse(),
// // // // // // // // //         onTap: tool.implemented
// // // // // // // // //             ? tool.onTap
// // // // // // // // //             : () {
// // // // // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // //                   SnackBar(
// // // // // // // // //                     content: Text('${tool.title} is coming soon.'),
// // // // // // // // //                     behavior: SnackBarBehavior.floating,
// // // // // // // // //                   ),
// // // // // // // // //                 );
// // // // // // // // //               },
// // // // // // // // //         child: Container(
// // // // // // // // //           decoration: BoxDecoration(
// // // // // // // // //             color: colorScheme.surface,
// // // // // // // // //             borderRadius: BorderRadius.circular(24),
// // // // // // // // //             border: Border.all(
// // // // // // // // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // // // // // // // //             ),
// // // // // // // // //             boxShadow: [
// // // // // // // // //               BoxShadow(
// // // // // // // // //                 color: Colors.black.withOpacity(0.05),
// // // // // // // // //                 blurRadius: 20,
// // // // // // // // //                 offset: const Offset(0, 10),
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //           child: Stack(
// // // // // // // // //             children: [
// // // // // // // // //               Positioned(
// // // // // // // // //                 top: 14,
// // // // // // // // //                 right: 14,
// // // // // // // // //                 child: Container(
// // // // // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // // // // //                     horizontal: 9,
// // // // // // // // //                     vertical: 4,
// // // // // // // // //                   ),
// // // // // // // // //                   decoration: BoxDecoration(
// // // // // // // // //                     color: tool.implemented
// // // // // // // // //                         ? tool.color.withOpacity(0.12)
// // // // // // // // //                         : Colors.grey.withOpacity(0.12),
// // // // // // // // //                     borderRadius: BorderRadius.circular(999),
// // // // // // // // //                   ),
// // // // // // // // //                   child: Text(
// // // // // // // // //                     tool.implemented ? 'Live' : 'Soon',
// // // // // // // // //                     style: TextStyle(
// // // // // // // // //                       fontSize: 10,
// // // // // // // // //                       fontWeight: FontWeight.w800,
// // // // // // // // //                       color: tool.implemented ? tool.color : Colors.grey,
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //               Padding(
// // // // // // // // //                 padding: const EdgeInsets.all(16),
// // // // // // // // //                 child: Column(
// // // // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // //                   children: [
// // // // // // // // //                     Hero(
// // // // // // // // //                       tag: 'tool-icon-${tool.title}',
// // // // // // // // //                       child: Container(
// // // // // // // // //                         width: 56,
// // // // // // // // //                         height: 56,
// // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // //                           gradient: LinearGradient(
// // // // // // // // //                             colors: [
// // // // // // // // //                               tool.color.withOpacity(0.95),
// // // // // // // // //                               tool.color.withOpacity(0.55),
// // // // // // // // //                             ],
// // // // // // // // //                           ),
// // // // // // // // //                           borderRadius: BorderRadius.circular(18),
// // // // // // // // //                         ),
// // // // // // // // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // // // // // // // //                       ),
// // // // // // // // //                     ),
// // // // // // // // //                     Column(
// // // // // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //                       children: [
// // // // // // // // //                         Text(
// // // // // // // // //                           tool.title,
// // // // // // // // //                           style: const TextStyle(
// // // // // // // // //                             fontSize: 15,
// // // // // // // // //                             fontWeight: FontWeight.w800,
// // // // // // // // //                           ),
// // // // // // // // //                         ),
// // // // // // // // //                         const SizedBox(height: 6),
// // // // // // // // //                         Text(
// // // // // // // // //                           tool.subtitle,
// // // // // // // // //                           maxLines: 2,
// // // // // // // // //                           style: TextStyle(
// // // // // // // // //                             color: colorScheme.onSurfaceVariant,
// // // // // // // // //                             fontSize: 12.5,
// // // // // // // // //                             height: 1.25,
// // // // // // // // //                           ),
// // // // // // // // //                         ),
// // // // // // // // //                       ],
// // // // // // // // //                     ),
// // // // // // // // //                   ],
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // Empty state
// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // class _EmptyState extends StatelessWidget {
// // // // // // // // //   final String query;
// // // // // // // // //   final String category;

// // // // // // // // //   const _EmptyState({required this.query, required this.category});

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // // //     return Center(
// // // // // // // // //       child: Padding(
// // // // // // // // //         padding: const EdgeInsets.all(24),
// // // // // // // // //         child: Column(
// // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // //           children: [
// // // // // // // // //             Container(
// // // // // // // // //               width: 94,
// // // // // // // // //               height: 94,
// // // // // // // // //               decoration: BoxDecoration(
// // // // // // // // //                 color: colorScheme.primaryContainer,
// // // // // // // // //                 borderRadius: BorderRadius.circular(28),
// // // // // // // // //               ),
// // // // // // // // //               child: Icon(
// // // // // // // // //                 Icons.search_off_rounded,
// // // // // // // // //                 size: 44,
// // // // // // // // //                 color: colorScheme.onPrimaryContainer,
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //             const SizedBox(height: 18),
// // // // // // // // //             Text(
// // // // // // // // //               'No matching tools',
// // // // // // // // //               style: Theme.of(
// // // // // // // // //                 context,
// // // // // // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // // //             ),
// // // // // // // // //             const SizedBox(height: 8),
// // // // // // // // //             Text(
// // // // // // // // //               query.isEmpty
// // // // // // // // //                   ? 'No tools found in $category.'
// // // // // // // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // // // // // // //               textAlign: TextAlign.center,
// // // // // // // // //               style: TextStyle(
// // // // // // // // //                 color: colorScheme.onSurfaceVariant,
// // // // // // // // //                 height: 1.4,
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //           ],
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // // Data model
// // // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // class _ToolItem {
// // // // // // // // //   final String title;
// // // // // // // // //   final String subtitle;
// // // // // // // // //   final IconData icon;
// // // // // // // // //   final Color color;
// // // // // // // // //   final String category;
// // // // // // // // //   final bool implemented;
// // // // // // // // //   final VoidCallback? onTap;

// // // // // // // // //   const _ToolItem({
// // // // // // // // //     required this.title,
// // // // // // // // //     required this.subtitle,
// // // // // // // // //     required this.icon,
// // // // // // // // //     required this.color,
// // // // // // // // //     required this.category,
// // // // // // // // //     required this.implemented,
// // // // // // // // //     this.onTap,
// // // // // // // // //   });
// // // // // // // // // }
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:provider/provider.dart';

// // // // // // // // import '../services/theme_service.dart';
// // // // // // // // import '../utils/app_transitions.dart';
// // // // // // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // // // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // // // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // // // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // // // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // // // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // // // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // // // // // import '../features/pdf_split/pdf_split.dart';
// // // // // // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // // // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // // // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // // // // // import '../features/image_converter/image_converter_screen.dart';
// // // // // // // // import '../features/pdf_compress/pdf_compress_screen.dart';

// // // // // // // // class HomeScreen extends StatefulWidget {
// // // // // // // //   const HomeScreen({super.key});

// // // // // // // //   @override
// // // // // // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // // // // // }

// // // // // // // // class _HomeScreenState extends State<HomeScreen>
// // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // //   final TextEditingController _searchController = TextEditingController();
// // // // // // // //   String _query = '';
// // // // // // // //   String _selectedCategory = 'All';

// // // // // // // //   late final AnimationController _fadeInController;
// // // // // // // //   late final Animation<double> _fadeIn;

// // // // // // // //   final List<String> _categories = [
// // // // // // // //     'All',
// // // // // // // //     'Media',
// // // // // // // //     'PDF',
// // // // // // // //     'Calculators',
// // // // // // // //     'Scanning',
// // // // // // // //   ];

// // // // // // // //   @override
// // // // // // // //   void initState() {
// // // // // // // //     super.initState();

// // // // // // // //     _fadeInController = AnimationController(
// // // // // // // //       vsync: this,
// // // // // // // //       duration: const Duration(milliseconds: 520),
// // // // // // // //     );
// // // // // // // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // //       _fadeInController.forward();
// // // // // // // //     });

// // // // // // // //     _searchController.addListener(() {
// // // // // // // //       setState(() {
// // // // // // // //         _query = _searchController.text.toLowerCase().trim();
// // // // // // // //       });
// // // // // // // //     });
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   void dispose() {
// // // // // // // //     _fadeInController.dispose();
// // // // // // // //     _searchController.dispose();
// // // // // // // //     super.dispose();
// // // // // // // //   }

// // // // // // // //   List<_ToolItem> _tools(BuildContext context) {
// // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // //     return [
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'QR Code Generator',
// // // // // // // //         subtitle: 'Create modern QR codes',
// // // // // // // //         icon: Icons.qr_code_rounded,
// // // // // // // //         color: colorScheme.primary,
// // // // // // // //         category: 'Scanning',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'Barcode Generator',
// // // // // // // //         subtitle: 'Generate barcodes instantly',
// // // // // // // //         icon: Icons.document_scanner,
// // // // // // // //         color: Colors.teal,
// // // // // // // //         category: 'Scanning',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'Image Compressor',
// // // // // // // //         subtitle: 'Reduce image size fast',
// // // // // // // //         icon: Icons.compress_rounded,
// // // // // // // //         color: Colors.green,
// // // // // // // //         category: 'Media',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const ImageCompressorScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'Age Calculator',
// // // // // // // //         subtitle: 'Calculate exact age',
// // // // // // // //         icon: Icons.cake_rounded,
// // // // // // // //         color: Colors.orange,
// // // // // // // //         category: 'Calculators',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const AgeCalculatorScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'BMI Calculator',
// // // // // // // //         subtitle: 'Track your body mass index',
// // // // // // // //         icon: Icons.monitor_weight_rounded,
// // // // // // // //         color: Colors.cyan,
// // // // // // // //         category: 'Calculators',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const BmiCalculatorScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'Unit Converter',
// // // // // // // //         subtitle: 'Convert units quickly',
// // // // // // // //         icon: Icons.swap_horiz_rounded,
// // // // // // // //         color: Colors.indigo,
// // // // // // // //         category: 'Calculators',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const UnitConverterScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'PDF Merge',
// // // // // // // //         subtitle: 'Join multiple PDFs',
// // // // // // // //         icon: Icons.picture_as_pdf_rounded,
// // // // // // // //         color: Colors.redAccent,
// // // // // // // //         category: 'PDF',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const PdfMergeScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       // _ToolItem(
// // // // // // // //       //   title: 'PDF Compress',
// // // // // // // //       //   subtitle: 'Compress  heavy  PDFs',
// // // // // // // //       //   icon: Icons.compress,
// // // // // // // //       //   color: Colors.amber,
// // // // // // // //       //   category: 'PDF',
// // // // // // // //       //   implemented: true,
// // // // // // // //       //   onTap: () => Navigator.push(
// // // // // // // //       //     context,
// // // // // // // //       //     AppTransitions.elasticIn(const PdfCompressScreen()),
// // // // // // // //       //   ),
// // // // // // // //       // ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'PDF Split',
// // // // // // // //         subtitle: 'Split PDF pages',
// // // // // // // //         icon: Icons.call_split_rounded,
// // // // // // // //         color: Colors.pink,
// // // // // // // //         category: 'PDF',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () =>
// // // // // // // //             Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'Image to PDF',
// // // // // // // //         subtitle: 'Convert images to PDF',
// // // // // // // //         icon: Icons.insert_drive_file_rounded,
// // // // // // // //         color: Colors.brown,
// // // // // // // //         category: 'Media',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const ImageToPdfScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'Image Converter',
// // // // // // // //         subtitle: 'Change image formats',
// // // // // // // //         icon: Icons.image_rounded,
// // // // // // // //         color: Colors.deepOrange,
// // // // // // // //         category: 'Media',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const ImageConverterScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'Image Resizer',
// // // // // // // //         subtitle: 'Resize images precisely',
// // // // // // // //         icon: Icons.photo_size_select_large_rounded,
// // // // // // // //         color: Colors.blue,
// // // // // // // //         category: 'Media',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const ImageResizerScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       _ToolItem(
// // // // // // // //         title: 'QR / Barcode Scanner',
// // // // // // // //         subtitle: 'Scan codes with camera',
// // // // // // // //         icon: Icons.document_scanner_rounded,
// // // // // // // //         color: Colors.deepPurple,
// // // // // // // //         category: 'Scanning',
// // // // // // // //         implemented: true,
// // // // // // // //         onTap: () => Navigator.push(
// // // // // // // //           context,
// // // // // // // //           AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     ];
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     final themeService = context.watch<ThemeService>();
// // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // //     final allTools = _tools(context);
// // // // // // // //     final filteredTools = allTools.where((tool) {
// // // // // // // //       final matchesQuery =
// // // // // // // //           _query.isEmpty ||
// // // // // // // //           tool.title.toLowerCase().contains(_query) ||
// // // // // // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // // // // // //           tool.category.toLowerCase().contains(_query);

// // // // // // // //       final matchesCategory =
// // // // // // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;

// // // // // // // //       return matchesQuery && matchesCategory;
// // // // // // // //     }).toList();

// // // // // // // //     return FadeTransition(
// // // // // // // //       opacity: _fadeIn,
// // // // // // // //       child: Scaffold(
// // // // // // // //         body: GestureDetector(
// // // // // // // //           onTap: () => FocusScope.of(context).unfocus(),
// // // // // // // //           behavior: HitTestBehavior.opaque,
// // // // // // // //           child: SafeArea(
// // // // // // // //             child: CustomScrollView(
// // // // // // // //               slivers: [
// // // // // // // //                 // ── Header ──────────────────────────────────────────────────────
// // // // // // // //                 SliverToBoxAdapter(
// // // // // // // //                   child: Padding(
// // // // // // // //                     padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // // // //                     child: Column(
// // // // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //                       children: [
// // // // // // // //                         Row(
// // // // // // // //                           children: [
// // // // // // // //                             Container(
// // // // // // // //                               width: 54,
// // // // // // // //                               height: 54,
// // // // // // // //                               decoration: BoxDecoration(
// // // // // // // //                                 gradient: LinearGradient(
// // // // // // // //                                   colors: [
// // // // // // // //                                     colorScheme.primary,
// // // // // // // //                                     colorScheme.tertiary,
// // // // // // // //                                   ],
// // // // // // // //                                 ),
// // // // // // // //                                 borderRadius: BorderRadius.circular(18),
// // // // // // // //                               ),
// // // // // // // //                               child: const Icon(
// // // // // // // //                                 Icons.dashboard_rounded,
// // // // // // // //                                 color: Colors.white,
// // // // // // // //                                 size: 30,
// // // // // // // //                               ),
// // // // // // // //                             ),
// // // // // // // //                             const SizedBox(width: 14),
// // // // // // // //                             Expanded(
// // // // // // // //                               child: Column(
// // // // // // // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //                                 children: [
// // // // // // // //                                   Text(
// // // // // // // //                                     'ToolKit Pro',
// // // // // // // //                                     style: Theme.of(context)
// // // // // // // //                                         .textTheme
// // // // // // // //                                         .headlineSmall
// // // // // // // //                                         ?.copyWith(
// // // // // // // //                                           fontWeight: FontWeight.w900,
// // // // // // // //                                           letterSpacing: -0.5,
// // // // // // // //                                         ),
// // // // // // // //                                   ),
// // // // // // // //                                   const SizedBox(height: 4),
// // // // // // // //                                   Text(
// // // // // // // //                                     'Fast utilities, clean workflow, pro interface',
// // // // // // // //                                     style: Theme.of(context)
// // // // // // // //                                         .textTheme
// // // // // // // //                                         .bodyMedium
// // // // // // // //                                         ?.copyWith(
// // // // // // // //                                           color: colorScheme.onSurfaceVariant,
// // // // // // // //                                         ),
// // // // // // // //                                   ),
// // // // // // // //                                 ],
// // // // // // // //                               ),
// // // // // // // //                             ),
// // // // // // // //                             _AnimatedThemeButton(themeService: themeService),
// // // // // // // //                           ],
// // // // // // // //                         ),
// // // // // // // //                         const SizedBox(height: 18),
// // // // // // // //                         Container(
// // // // // // // //                           width: double.infinity,
// // // // // // // //                           padding: const EdgeInsets.all(18),
// // // // // // // //                           decoration: BoxDecoration(
// // // // // // // //                             borderRadius: BorderRadius.circular(26),
// // // // // // // //                             gradient: LinearGradient(
// // // // // // // //                               begin: Alignment.topLeft,
// // // // // // // //                               end: Alignment.bottomRight,
// // // // // // // //                               colors: [
// // // // // // // //                                 colorScheme.primaryContainer,
// // // // // // // //                                 colorScheme.tertiaryContainer,
// // // // // // // //                               ],
// // // // // // // //                             ),
// // // // // // // //                           ),
// // // // // // // //                           child: Row(
// // // // // // // //                             children: [
// // // // // // // //                               Expanded(
// // // // // // // //                                 child: Column(
// // // // // // // //                                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //                                   children: [
// // // // // // // //                                     Text(
// // // // // // // //                                       'Professional workspace',
// // // // // // // //                                       style: Theme.of(context)
// // // // // // // //                                           .textTheme
// // // // // // // //                                           .titleLarge
// // // // // // // //                                           ?.copyWith(
// // // // // // // //                                             fontWeight: FontWeight.w800,
// // // // // // // //                                           ),
// // // // // // // //                                     ),
// // // // // // // //                                     const SizedBox(height: 8),
// // // // // // // //                                     Text(
// // // // // // // //                                       'Search, launch, and manage your tools from one premium dashboard.',
// // // // // // // //                                       style: Theme.of(
// // // // // // // //                                         context,
// // // // // // // //                                       ).textTheme.bodyMedium,
// // // // // // // //                                     ),
// // // // // // // //                                   ],
// // // // // // // //                                 ),
// // // // // // // //                               ),
// // // // // // // //                               const SizedBox(width: 12),
// // // // // // // //                               Container(
// // // // // // // //                                 width: 66,
// // // // // // // //                                 height: 66,
// // // // // // // //                                 decoration: BoxDecoration(
// // // // // // // //                                   color: colorScheme.surface.withOpacity(0.35),
// // // // // // // //                                   borderRadius: BorderRadius.circular(20),
// // // // // // // //                                 ),
// // // // // // // //                                 child: Icon(
// // // // // // // //                                   Icons.auto_awesome_rounded,
// // // // // // // //                                   size: 34,
// // // // // // // //                                   color: colorScheme.onPrimaryContainer,
// // // // // // // //                                 ),
// // // // // // // //                               ),
// // // // // // // //                             ],
// // // // // // // //                           ),
// // // // // // // //                         ),
// // // // // // // //                         const SizedBox(height: 18),
// // // // // // // //                         SearchBar(
// // // // // // // //                           controller: _searchController,
// // // // // // // //                           hintText: 'Search tools, calculators, PDFs...',
// // // // // // // //                           leading: const Icon(Icons.search_rounded),
// // // // // // // //                           trailing: const [Icon(Icons.tune_rounded)],
// // // // // // // //                           elevation: const WidgetStatePropertyAll(0),
// // // // // // // //                           backgroundColor: WidgetStatePropertyAll(
// // // // // // // //                             colorScheme.surfaceContainerHighest.withOpacity(
// // // // // // // //                               0.75,
// // // // // // // //                             ),
// // // // // // // //                           ),
// // // // // // // //                           padding: const WidgetStatePropertyAll(
// // // // // // // //                             EdgeInsets.symmetric(horizontal: 18),
// // // // // // // //                           ),
// // // // // // // //                         ),
// // // // // // // //                       ],
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                 ),

// // // // // // // //                 // ── Category chips ───────────────────────────────────────────────
// // // // // // // //                 SliverToBoxAdapter(
// // // // // // // //                   child: Padding(
// // // // // // // //                     padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // //                     child: SizedBox(
// // // // // // // //                       height: 42,
// // // // // // // //                       child: ListView.separated(
// // // // // // // //                         scrollDirection: Axis.horizontal,
// // // // // // // //                         itemCount: _categories.length,
// // // // // // // //                         separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // // // //                         itemBuilder: (context, index) {
// // // // // // // //                           final category = _categories[index];
// // // // // // // //                           final selected = category == _selectedCategory;

// // // // // // // //                           return AnimatedScale(
// // // // // // // //                             scale: selected ? 1.05 : 1.0,
// // // // // // // //                             duration: const Duration(milliseconds: 180),
// // // // // // // //                             curve: Curves.easeOutCubic,
// // // // // // // //                             child: ChoiceChip(
// // // // // // // //                               label: Text(category),
// // // // // // // //                               selected: selected,
// // // // // // // //                               onSelected: (_) {
// // // // // // // //                                 setState(() {
// // // // // // // //                                   _selectedCategory = category;
// // // // // // // //                                 });
// // // // // // // //                               },
// // // // // // // //                             ),
// // // // // // // //                           );
// // // // // // // //                         },
// // // // // // // //                       ),
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                 ),

// // // // // // // //                 // ── Section header ───────────────────────────────────────────────
// // // // // // // //                 SliverToBoxAdapter(
// // // // // // // //                   child: Padding(
// // // // // // // //                     padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // // //                     child: Row(
// // // // // // // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // //                       children: [
// // // // // // // //                         Text(
// // // // // // // //                           'Featured tools',
// // // // // // // //                           style: Theme.of(context).textTheme.titleLarge
// // // // // // // //                               ?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // //                         ),
// // // // // // // //                         AnimatedSwitcher(
// // // // // // // //                           duration: const Duration(milliseconds: 220),
// // // // // // // //                           child: Text(
// // // // // // // //                             '${filteredTools.length} shown',
// // // // // // // //                             key: ValueKey(filteredTools.length),
// // // // // // // //                             style: TextStyle(
// // // // // // // //                               color: colorScheme.primary,
// // // // // // // //                               fontWeight: FontWeight.w700,
// // // // // // // //                             ),
// // // // // // // //                           ),
// // // // // // // //                         ),
// // // // // // // //                       ],
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                 ),

// // // // // // // //                 // ── Tool grid ───────────────────────────────────────────────────
// // // // // // // //                 if (filteredTools.isEmpty)
// // // // // // // //                   SliverFillRemaining(
// // // // // // // //                     hasScrollBody: false,
// // // // // // // //                     child: _EmptyState(
// // // // // // // //                       query: _query,
// // // // // // // //                       category: _selectedCategory,
// // // // // // // //                     ),
// // // // // // // //                   )
// // // // // // // //                 else
// // // // // // // //                   SliverPadding(
// // // // // // // //                     padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // // // //                     sliver: SliverGrid(
// // // // // // // //                       gridDelegate:
// // // // // // // //                           const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // // //                             crossAxisCount: 2,
// // // // // // // //                             mainAxisSpacing: 14,
// // // // // // // //                             crossAxisSpacing: 14,
// // // // // // // //                             childAspectRatio: 0.82,
// // // // // // // //                           ),
// // // // // // // //                       delegate: SliverChildBuilderDelegate((context, index) {
// // // // // // // //                         final tool = filteredTools[index];
// // // // // // // //                         return _StaggeredToolCard(tool: tool, index: index);
// // // // // // // //                       }, childCount: filteredTools.length),
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //               ],
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // Animated theme toggle button
// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // class _AnimatedThemeButton extends StatefulWidget {
// // // // // // // //   final ThemeService themeService;
// // // // // // // //   const _AnimatedThemeButton({required this.themeService});

// // // // // // // //   @override
// // // // // // // //   State<_AnimatedThemeButton> createState() => _AnimatedThemeButtonState();
// // // // // // // // }

// // // // // // // // class _AnimatedThemeButtonState extends State<_AnimatedThemeButton>
// // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // //   late final AnimationController _ctrl;
// // // // // // // //   late final Animation<double> _rotate;

// // // // // // // //   @override
// // // // // // // //   void initState() {
// // // // // // // //     super.initState();
// // // // // // // //     _ctrl = AnimationController(
// // // // // // // //       vsync: this,
// // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // //     );
// // // // // // // //     _rotate = Tween<double>(
// // // // // // // //       begin: 0.0,
// // // // // // // //       end: 0.5,
// // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   void dispose() {
// // // // // // // //     _ctrl.dispose();
// // // // // // // //     super.dispose();
// // // // // // // //   }

// // // // // // // //   void _toggle() {
// // // // // // // //     _ctrl.forward(from: 0.0);
// // // // // // // //     widget.themeService.toggleTheme();
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return RotationTransition(
// // // // // // // //       turns: _rotate,
// // // // // // // //       child: IconButton.filledTonal(
// // // // // // // //         onPressed: _toggle,
// // // // // // // //         icon: Icon(
// // // // // // // //           widget.themeService.isDark
// // // // // // // //               ? Icons.light_mode_rounded
// // // // // // // //               : Icons.dark_mode_rounded,
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // Staggered tool card — fades + slides in based on grid index
// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // class _StaggeredToolCard extends StatefulWidget {
// // // // // // // //   final _ToolItem tool;
// // // // // // // //   final int index;
// // // // // // // //   const _StaggeredToolCard({required this.tool, required this.index});

// // // // // // // //   @override
// // // // // // // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // // // // // // }

// // // // // // // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // //   late final AnimationController _ctrl;
// // // // // // // //   late final Animation<double> _fade;
// // // // // // // //   late final Animation<Offset> _slide;

// // // // // // // //   @override
// // // // // // // //   void initState() {
// // // // // // // //     super.initState();
// // // // // // // //     _ctrl = AnimationController(
// // // // // // // //       vsync: this,
// // // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // // //     );
// // // // // // // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // // // // // // //     _slide = Tween<Offset>(
// // // // // // // //       begin: const Offset(0, 0.08),
// // // // // // // //       end: Offset.zero,
// // // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // // // // // // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // // // // // // //     Future.delayed(delay, () {
// // // // // // // //       if (mounted) _ctrl.forward();
// // // // // // // //     });
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   void dispose() {
// // // // // // // //     _ctrl.dispose();
// // // // // // // //     super.dispose();
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return FadeTransition(
// // // // // // // //       opacity: _fade,
// // // // // // // //       child: SlideTransition(
// // // // // // // //         position: _slide,
// // // // // // // //         child: _ToolCard(tool: widget.tool),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // Tool card with press feedback
// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // class _ToolCard extends StatefulWidget {
// // // // // // // //   final _ToolItem tool;
// // // // // // // //   const _ToolCard({required this.tool});

// // // // // // // //   @override
// // // // // // // //   State<_ToolCard> createState() => _ToolCardState();
// // // // // // // // }

// // // // // // // // class _ToolCardState extends State<_ToolCard>
// // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // //   late final AnimationController _pressCtrl;
// // // // // // // //   late final Animation<double> _pressScale;

// // // // // // // //   @override
// // // // // // // //   void initState() {
// // // // // // // //     super.initState();
// // // // // // // //     _pressCtrl = AnimationController(
// // // // // // // //       vsync: this,
// // // // // // // //       duration: const Duration(milliseconds: 100),
// // // // // // // //       reverseDuration: const Duration(milliseconds: 200),
// // // // // // // //       lowerBound: 0.0,
// // // // // // // //       upperBound: 1.0,
// // // // // // // //     );
// // // // // // // //     _pressScale = Tween<double>(
// // // // // // // //       begin: 1.0,
// // // // // // // //       end: 0.95,
// // // // // // // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   void dispose() {
// // // // // // // //     _pressCtrl.dispose();
// // // // // // // //     super.dispose();
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // // // // //     final tool = widget.tool;

// // // // // // // //     return ScaleTransition(
// // // // // // // //       scale: _pressScale,
// // // // // // // //       child: GestureDetector(
// // // // // // // //         onTapDown: (_) => _pressCtrl.forward(),
// // // // // // // //         onTapUp: (_) => _pressCtrl.reverse(),
// // // // // // // //         onTapCancel: () => _pressCtrl.reverse(),
// // // // // // // //         onTap: tool.implemented
// // // // // // // //             ? tool.onTap
// // // // // // // //             : () {
// // // // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // //                   SnackBar(
// // // // // // // //                     content: Text('${tool.title} is coming soon.'),
// // // // // // // //                     behavior: SnackBarBehavior.floating,
// // // // // // // //                   ),
// // // // // // // //                 );
// // // // // // // //               },
// // // // // // // //         child: Container(
// // // // // // // //           decoration: BoxDecoration(
// // // // // // // //             color: colorScheme.surface,
// // // // // // // //             borderRadius: BorderRadius.circular(24),
// // // // // // // //             border: Border.all(
// // // // // // // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // // // // // // //             ),
// // // // // // // //             boxShadow: [
// // // // // // // //               BoxShadow(
// // // // // // // //                 color: Colors.black.withOpacity(0.05),
// // // // // // // //                 blurRadius: 20,
// // // // // // // //                 offset: const Offset(0, 10),
// // // // // // // //               ),
// // // // // // // //             ],
// // // // // // // //           ),
// // // // // // // //           child: Stack(
// // // // // // // //             children: [
// // // // // // // //               Positioned(
// // // // // // // //                 top: 14,
// // // // // // // //                 right: 14,
// // // // // // // //                 child: Container(
// // // // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // // // //                     horizontal: 9,
// // // // // // // //                     vertical: 4,
// // // // // // // //                   ),
// // // // // // // //                   decoration: BoxDecoration(
// // // // // // // //                     color: tool.implemented
// // // // // // // //                         ? tool.color.withOpacity(0.12)
// // // // // // // //                         : Colors.grey.withOpacity(0.12),
// // // // // // // //                     borderRadius: BorderRadius.circular(999),
// // // // // // // //                   ),
// // // // // // // //                   child: Text(
// // // // // // // //                     tool.implemented ? 'Live' : 'Soon',
// // // // // // // //                     style: TextStyle(
// // // // // // // //                       fontSize: 10,
// // // // // // // //                       fontWeight: FontWeight.w800,
// // // // // // // //                       color: tool.implemented ? tool.color : Colors.grey,
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //               Padding(
// // // // // // // //                 padding: const EdgeInsets.all(16),
// // // // // // // //                 child: Column(
// // // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // //                   children: [
// // // // // // // //                     Hero(
// // // // // // // //                       tag: 'tool-icon-${tool.title}',
// // // // // // // //                       child: Container(
// // // // // // // //                         width: 56,
// // // // // // // //                         height: 56,
// // // // // // // //                         decoration: BoxDecoration(
// // // // // // // //                           gradient: LinearGradient(
// // // // // // // //                             colors: [
// // // // // // // //                               tool.color.withOpacity(0.95),
// // // // // // // //                               tool.color.withOpacity(0.55),
// // // // // // // //                             ],
// // // // // // // //                           ),
// // // // // // // //                           borderRadius: BorderRadius.circular(18),
// // // // // // // //                         ),
// // // // // // // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // // // // // // //                       ),
// // // // // // // //                     ),
// // // // // // // //                     Column(
// // // // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //                       children: [
// // // // // // // //                         Text(
// // // // // // // //                           tool.title,
// // // // // // // //                           style: const TextStyle(
// // // // // // // //                             fontSize: 15,
// // // // // // // //                             fontWeight: FontWeight.w800,
// // // // // // // //                           ),
// // // // // // // //                         ),
// // // // // // // //                         const SizedBox(height: 6),
// // // // // // // //                         Text(
// // // // // // // //                           tool.subtitle,
// // // // // // // //                           maxLines: 2,
// // // // // // // //                           style: TextStyle(
// // // // // // // //                             color: colorScheme.onSurfaceVariant,
// // // // // // // //                             fontSize: 12.5,
// // // // // // // //                             height: 1.25,
// // // // // // // //                           ),
// // // // // // // //                         ),
// // // // // // // //                       ],
// // // // // // // //                     ),
// // // // // // // //                   ],
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ],
// // // // // // // //           ),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // Empty state
// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // class _EmptyState extends StatelessWidget {
// // // // // // // //   final String query;
// // // // // // // //   final String category;

// // // // // // // //   const _EmptyState({required this.query, required this.category});

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // // //     return Center(
// // // // // // // //       child: Padding(
// // // // // // // //         padding: const EdgeInsets.all(24),
// // // // // // // //         child: Column(
// // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // //           children: [
// // // // // // // //             Container(
// // // // // // // //               width: 94,
// // // // // // // //               height: 94,
// // // // // // // //               decoration: BoxDecoration(
// // // // // // // //                 color: colorScheme.primaryContainer,
// // // // // // // //                 borderRadius: BorderRadius.circular(28),
// // // // // // // //               ),
// // // // // // // //               child: Icon(
// // // // // // // //                 Icons.search_off_rounded,
// // // // // // // //                 size: 44,
// // // // // // // //                 color: colorScheme.onPrimaryContainer,
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(height: 18),
// // // // // // // //             Text(
// // // // // // // //               'No matching tools',
// // // // // // // //               style: Theme.of(
// // // // // // // //                 context,
// // // // // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(height: 8),
// // // // // // // //             Text(
// // // // // // // //               query.isEmpty
// // // // // // // //                   ? 'No tools found in $category.'
// // // // // // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // // // // // //               textAlign: TextAlign.center,
// // // // // // // //               style: TextStyle(
// // // // // // // //                 color: colorScheme.onSurfaceVariant,
// // // // // // // //                 height: 1.4,
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // // Data model
// // // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // class _ToolItem {
// // // // // // // //   final String title;
// // // // // // // //   final String subtitle;
// // // // // // // //   final IconData icon;
// // // // // // // //   final Color color;
// // // // // // // //   final String category;
// // // // // // // //   final bool implemented;
// // // // // // // //   final VoidCallback? onTap;

// // // // // // // //   const _ToolItem({
// // // // // // // //     required this.title,
// // // // // // // //     required this.subtitle,
// // // // // // // //     required this.icon,
// // // // // // // //     required this.color,
// // // // // // // //     required this.category,
// // // // // // // //     required this.implemented,
// // // // // // // //     this.onTap,
// // // // // // // //   });
// // // // // // // // }

// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:provider/provider.dart';

// // // // // // // import '../services/theme_service.dart';
// // // // // // // import '../utils/app_transitions.dart';
// // // // // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // // // // import '../features/pdf_split/pdf_split.dart';
// // // // // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // // // // import '../features/image_converter/image_converter_screen.dart';
// // // // // // // import '../features/pdf_compress/pdf_compress_screen.dart';

// // // // // // // class HomeScreen extends StatefulWidget {
// // // // // // //   const HomeScreen({super.key});

// // // // // // //   @override
// // // // // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // // // // }

// // // // // // // class _HomeScreenState extends State<HomeScreen>
// // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // //   final TextEditingController _searchController = TextEditingController();
// // // // // // //   String _query = '';
// // // // // // //   String _selectedCategory = 'All';

// // // // // // //   // ── Bottom navigation state ──
// // // // // // //   int _selectedTabIndex = 0;

// // // // // // //   late final AnimationController _fadeInController;
// // // // // // //   late final Animation<double> _fadeIn;

// // // // // // //   final List<String> _categories = [
// // // // // // //     'All',
// // // // // // //     'Media',
// // // // // // //     'PDF',
// // // // // // //     'Calculators',
// // // // // // //     'Scanning',
// // // // // // //   ];

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();

// // // // // // //     _fadeInController = AnimationController(
// // // // // // //       vsync: this,
// // // // // // //       duration: const Duration(milliseconds: 520),
// // // // // // //     );
// // // // // // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // //       _fadeInController.forward();
// // // // // // //     });

// // // // // // //     _searchController.addListener(() {
// // // // // // //       setState(() {
// // // // // // //         _query = _searchController.text.toLowerCase().trim();
// // // // // // //       });
// // // // // // //     });
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void dispose() {
// // // // // // //     _fadeInController.dispose();
// // // // // // //     _searchController.dispose();
// // // // // // //     super.dispose();
// // // // // // //   }

// // // // // // //   void _onTabTapped(int index) {
// // // // // // //     setState(() {
// // // // // // //       _selectedTabIndex = index;
// // // // // // //     });
// // // // // // //   }

// // // // // // //   List<_ToolItem> _tools(BuildContext context) {
// // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // //     return [
// // // // // // //       _ToolItem(
// // // // // // //         title: 'QR Code Generator',
// // // // // // //         subtitle: 'Create modern QR codes',
// // // // // // //         icon: Icons.qr_code_rounded,
// // // // // // //         color: colorScheme.primary,
// // // // // // //         category: 'Scanning',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'Barcode Generator',
// // // // // // //         subtitle: 'Generate barcodes instantly',
// // // // // // //         icon: Icons.document_scanner,
// // // // // // //         color: Colors.teal,
// // // // // // //         category: 'Scanning',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'Image Compressor',
// // // // // // //         subtitle: 'Reduce image size fast',
// // // // // // //         icon: Icons.compress_rounded,
// // // // // // //         color: Colors.green,
// // // // // // //         category: 'Media',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const ImageCompressorScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'Age Calculator',
// // // // // // //         subtitle: 'Calculate exact age',
// // // // // // //         icon: Icons.cake_rounded,
// // // // // // //         color: Colors.orange,
// // // // // // //         category: 'Calculators',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const AgeCalculatorScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'BMI Calculator',
// // // // // // //         subtitle: 'Track your body mass index',
// // // // // // //         icon: Icons.monitor_weight_rounded,
// // // // // // //         color: Colors.cyan,
// // // // // // //         category: 'Calculators',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const BmiCalculatorScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'Unit Converter',
// // // // // // //         subtitle: 'Convert units quickly',
// // // // // // //         icon: Icons.swap_horiz_rounded,
// // // // // // //         color: Colors.indigo,
// // // // // // //         category: 'Calculators',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const UnitConverterScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'PDF Merge',
// // // // // // //         subtitle: 'Join multiple PDFs',
// // // // // // //         icon: Icons.picture_as_pdf_rounded,
// // // // // // //         color: Colors.redAccent,
// // // // // // //         category: 'PDF',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const PdfMergeScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       // _ToolItem(
// // // // // // //       //   title: 'PDF Compress',
// // // // // // //       //   subtitle: 'Compress  heavy  PDFs',
// // // // // // //       //   icon: Icons.compress,
// // // // // // //       //   color: Colors.amber,
// // // // // // //       //   category: 'PDF',
// // // // // // //       //   implemented: true,
// // // // // // //       //   onTap: () => Navigator.push(
// // // // // // //       //     context,
// // // // // // //       //     AppTransitions.elasticIn(const PdfCompressScreen()),
// // // // // // //       //   ),
// // // // // // //       // ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'PDF Split',
// // // // // // //         subtitle: 'Split PDF pages',
// // // // // // //         icon: Icons.call_split_rounded,
// // // // // // //         color: Colors.pink,
// // // // // // //         category: 'PDF',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () =>
// // // // // // //             Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'Image to PDF',
// // // // // // //         subtitle: 'Convert images to PDF',
// // // // // // //         icon: Icons.insert_drive_file_rounded,
// // // // // // //         color: Colors.brown,
// // // // // // //         category: 'Media',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const ImageToPdfScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'Image Converter',
// // // // // // //         subtitle: 'Change image formats',
// // // // // // //         icon: Icons.image_rounded,
// // // // // // //         color: Colors.deepOrange,
// // // // // // //         category: 'Media',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const ImageConverterScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'Image Resizer',
// // // // // // //         subtitle: 'Resize images precisely',
// // // // // // //         icon: Icons.photo_size_select_large_rounded,
// // // // // // //         color: Colors.blue,
// // // // // // //         category: 'Media',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const ImageResizerScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       _ToolItem(
// // // // // // //         title: 'QR / Barcode Scanner',
// // // // // // //         subtitle: 'Scan codes with camera',
// // // // // // //         icon: Icons.document_scanner_rounded,
// // // // // // //         color: Colors.deepPurple,
// // // // // // //         category: 'Scanning',
// // // // // // //         implemented: true,
// // // // // // //         onTap: () => Navigator.push(
// // // // // // //           context,
// // // // // // //           AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     ];
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final themeService = context.watch<ThemeService>();
// // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // //     final allTools = _tools(context);
// // // // // // //     final filteredTools = allTools.where((tool) {
// // // // // // //       final matchesQuery =
// // // // // // //           _query.isEmpty ||
// // // // // // //           tool.title.toLowerCase().contains(_query) ||
// // // // // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // // // // //           tool.category.toLowerCase().contains(_query);

// // // // // // //       final matchesCategory =
// // // // // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;

// // // // // // //       return matchesQuery && matchesCategory;
// // // // // // //     }).toList();

// // // // // // //     return FadeTransition(
// // // // // // //       opacity: _fadeIn,
// // // // // // //       child: Scaffold(
// // // // // // //         appBar: AppBar(
// // // // // // //           title: Row(
// // // // // // //             children: [
// // // // // // //               Icon(Icons.dashboard_rounded, color: colorScheme.primary),
// // // // // // //               const SizedBox(width: 8),
// // // // // // //               const Text('ToolKit Pro'),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           actions: [
// // // // // // //             IconButton(
// // // // // // //               onPressed: themeService.toggleTheme,
// // // // // // //               icon: Icon(
// // // // // // //                 themeService.isDark
// // // // // // //                     ? Icons.light_mode_rounded
// // // // // // //                     : Icons.dark_mode_rounded,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             IconButton(
// // // // // // //               onPressed: () {
// // // // // // //                 // TODO: Navigate to Settings screen
// // // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //                   const SnackBar(
// // // // // // //                     content: Text('Settings coming soon!'),
// // // // // // //                     behavior: SnackBarBehavior.floating,
// // // // // // //                   ),
// // // // // // //                 );
// // // // // // //               },
// // // // // // //               icon: const Icon(Icons.settings_rounded),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           elevation: 0,
// // // // // // //           backgroundColor: colorScheme.surface,
// // // // // // //           foregroundColor: colorScheme.onSurface,
// // // // // // //         ),
// // // // // // //         body: IndexedStack(
// // // // // // //           index: _selectedTabIndex,
// // // // // // //           children: [
// // // // // // //             // Tab 0: Home (existing content)
// // // // // // //             _buildHomeContent(filteredTools, colorScheme),

// // // // // // //             // Tab 1: Tools (placeholder)
// // // // // // //             const Center(
// // // // // // //               child: Text(
// // // // // // //                 'All Tools',
// // // // // // //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             // Tab 2: Favorites (placeholder)
// // // // // // //             const Center(
// // // // // // //               child: Text(
// // // // // // //                 'Favorites',
// // // // // // //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             // Tab 3: Profile (placeholder)
// // // // // // //             const Center(
// // // // // // //               child: Text(
// // // // // // //                 'Profile',
// // // // // // //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         bottomNavigationBar: BottomNavigationBar(
// // // // // // //           currentIndex: _selectedTabIndex,
// // // // // // //           onTap: _onTabTapped,
// // // // // // //           items: const [
// // // // // // //             BottomNavigationBarItem(
// // // // // // //               icon: Icon(Icons.home_rounded),
// // // // // // //               label: 'Home',
// // // // // // //             ),
// // // // // // //             BottomNavigationBarItem(
// // // // // // //               icon: Icon(Icons.grid_view_rounded),
// // // // // // //               label: 'Tools',
// // // // // // //             ),
// // // // // // //             BottomNavigationBarItem(
// // // // // // //               icon: Icon(Icons.favorite_rounded),
// // // // // // //               label: 'Favorites',
// // // // // // //             ),
// // // // // // //             BottomNavigationBarItem(
// // // // // // //               icon: Icon(Icons.person_rounded),
// // // // // // //               label: 'Profile',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           selectedItemColor: colorScheme.primary,
// // // // // // //           unselectedItemColor: colorScheme.onSurfaceVariant,
// // // // // // //           showUnselectedLabels: true,
// // // // // // //           type: BottomNavigationBarType.fixed,
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildHomeContent(
// // // // // // //     List<_ToolItem> filteredTools,
// // // // // // //     ColorScheme colorScheme,
// // // // // // //   ) {
// // // // // // //     return GestureDetector(
// // // // // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // // // // //       behavior: HitTestBehavior.opaque,
// // // // // // //       child: SafeArea(
// // // // // // //         child: CustomScrollView(
// // // // // // //           slivers: [
// // // // // // //             // ── Header with welcome text, banner, and search ──
// // // // // // //             SliverToBoxAdapter(
// // // // // // //               child: Padding(
// // // // // // //                 padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // // //                 child: Column(
// // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                   children: [
// // // // // // //                     Text(
// // // // // // //                       'Welcome back!',
// // // // // // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // // // //                         fontWeight: FontWeight.w800,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     const SizedBox(height: 4),
// // // // // // //                     Text(
// // // // // // //                       'Fast utilities, clean workflow, pro interface.',
// // // // // // //                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
// // // // // // //                         color: colorScheme.onSurfaceVariant,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     const SizedBox(height: 18),
// // // // // // //                     Container(
// // // // // // //                       width: double.infinity,
// // // // // // //                       padding: const EdgeInsets.all(18),
// // // // // // //                       decoration: BoxDecoration(
// // // // // // //                         borderRadius: BorderRadius.circular(26),
// // // // // // //                         gradient: LinearGradient(
// // // // // // //                           begin: Alignment.topLeft,
// // // // // // //                           end: Alignment.bottomRight,
// // // // // // //                           colors: [
// // // // // // //                             colorScheme.primaryContainer,
// // // // // // //                             colorScheme.tertiaryContainer,
// // // // // // //                           ],
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                       child: Row(
// // // // // // //                         children: [
// // // // // // //                           Expanded(
// // // // // // //                             child: Column(
// // // // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                               children: [
// // // // // // //                                 Text(
// // // // // // //                                   'Professional workspace',
// // // // // // //                                   style: Theme.of(context).textTheme.titleLarge
// // // // // // //                                       ?.copyWith(fontWeight: FontWeight.w800),
// // // // // // //                                 ),
// // // // // // //                                 const SizedBox(height: 8),
// // // // // // //                                 Text(
// // // // // // //                                   'Search, launch, and manage your tools from one premium dashboard.',
// // // // // // //                                   style: Theme.of(context).textTheme.bodyMedium,
// // // // // // //                                 ),
// // // // // // //                               ],
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                           const SizedBox(width: 12),
// // // // // // //                           Container(
// // // // // // //                             width: 66,
// // // // // // //                             height: 66,
// // // // // // //                             decoration: BoxDecoration(
// // // // // // //                               color: colorScheme.surface.withOpacity(0.35),
// // // // // // //                               borderRadius: BorderRadius.circular(20),
// // // // // // //                             ),
// // // // // // //                             child: Icon(
// // // // // // //                               Icons.auto_awesome_rounded,
// // // // // // //                               size: 34,
// // // // // // //                               color: colorScheme.onPrimaryContainer,
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                         ],
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     const SizedBox(height: 18),
// // // // // // //                     SearchBar(
// // // // // // //                       controller: _searchController,
// // // // // // //                       hintText: 'Search tools, calculators, PDFs...',
// // // // // // //                       leading: const Icon(Icons.search_rounded),
// // // // // // //                       trailing: const [Icon(Icons.tune_rounded)],
// // // // // // //                       elevation: const WidgetStatePropertyAll(0),
// // // // // // //                       backgroundColor: WidgetStatePropertyAll(
// // // // // // //                         colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // // // //                       ),
// // // // // // //                       padding: const WidgetStatePropertyAll(
// // // // // // //                         EdgeInsets.symmetric(horizontal: 18),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             // ── Category chips ──
// // // // // // //             SliverToBoxAdapter(
// // // // // // //               child: Padding(
// // // // // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // //                 child: SizedBox(
// // // // // // //                   height: 42,
// // // // // // //                   child: ListView.separated(
// // // // // // //                     scrollDirection: Axis.horizontal,
// // // // // // //                     itemCount: _categories.length,
// // // // // // //                     separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // // //                     itemBuilder: (context, index) {
// // // // // // //                       final category = _categories[index];
// // // // // // //                       final selected = category == _selectedCategory;

// // // // // // //                       return AnimatedScale(
// // // // // // //                         scale: selected ? 1.05 : 1.0,
// // // // // // //                         duration: const Duration(milliseconds: 180),
// // // // // // //                         curve: Curves.easeOutCubic,
// // // // // // //                         child: ChoiceChip(
// // // // // // //                           label: Text(category),
// // // // // // //                           selected: selected,
// // // // // // //                           onSelected: (_) {
// // // // // // //                             setState(() {
// // // // // // //                               _selectedCategory = category;
// // // // // // //                             });
// // // // // // //                           },
// // // // // // //                         ),
// // // // // // //                       );
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             // ── Section header ──
// // // // // // //             SliverToBoxAdapter(
// // // // // // //               child: Padding(
// // // // // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // // //                 child: Row(
// // // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //                   children: [
// // // // // // //                     Text(
// // // // // // //                       'Featured tools',
// // // // // // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // // // //                         fontWeight: FontWeight.w800,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     AnimatedSwitcher(
// // // // // // //                       duration: const Duration(milliseconds: 220),
// // // // // // //                       child: Text(
// // // // // // //                         '${filteredTools.length} shown',
// // // // // // //                         key: ValueKey(filteredTools.length),
// // // // // // //                         style: TextStyle(
// // // // // // //                           color: colorScheme.primary,
// // // // // // //                           fontWeight: FontWeight.w700,
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             // ── Tool grid ──
// // // // // // //             if (filteredTools.isEmpty)
// // // // // // //               SliverFillRemaining(
// // // // // // //                 hasScrollBody: false,
// // // // // // //                 child: _EmptyState(query: _query, category: _selectedCategory),
// // // // // // //               )
// // // // // // //             else
// // // // // // //               SliverPadding(
// // // // // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // // //                 sliver: SliverGrid(
// // // // // // //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // //                     crossAxisCount: 2,
// // // // // // //                     mainAxisSpacing: 14,
// // // // // // //                     crossAxisSpacing: 14,
// // // // // // //                     childAspectRatio: 0.82,
// // // // // // //                   ),
// // // // // // //                   delegate: SliverChildBuilderDelegate((context, index) {
// // // // // // //                     final tool = filteredTools[index];
// // // // // // //                     return _StaggeredToolCard(tool: tool, index: index);
// // // // // // //                   }, childCount: filteredTools.length),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // Staggered tool card — fades + slides in based on grid index
// // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // class _StaggeredToolCard extends StatefulWidget {
// // // // // // //   final _ToolItem tool;
// // // // // // //   final int index;
// // // // // // //   const _StaggeredToolCard({required this.tool, required this.index});

// // // // // // //   @override
// // // // // // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // // // // // }

// // // // // // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // //   late final AnimationController _ctrl;
// // // // // // //   late final Animation<double> _fade;
// // // // // // //   late final Animation<Offset> _slide;

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     _ctrl = AnimationController(
// // // // // // //       vsync: this,
// // // // // // //       duration: const Duration(milliseconds: 420),
// // // // // // //     );
// // // // // // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // // // // // //     _slide = Tween<Offset>(
// // // // // // //       begin: const Offset(0, 0.08),
// // // // // // //       end: Offset.zero,
// // // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // // // // // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // // // // // //     Future.delayed(delay, () {
// // // // // // //       if (mounted) _ctrl.forward();
// // // // // // //     });
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void dispose() {
// // // // // // //     _ctrl.dispose();
// // // // // // //     super.dispose();
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return FadeTransition(
// // // // // // //       opacity: _fade,
// // // // // // //       child: SlideTransition(
// // // // // // //         position: _slide,
// // // // // // //         child: _ToolCard(tool: widget.tool),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // Tool card with press feedback
// // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // class _ToolCard extends StatefulWidget {
// // // // // // //   final _ToolItem tool;
// // // // // // //   const _ToolCard({required this.tool});

// // // // // // //   @override
// // // // // // //   State<_ToolCard> createState() => _ToolCardState();
// // // // // // // }

// // // // // // // class _ToolCardState extends State<_ToolCard>
// // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // //   late final AnimationController _pressCtrl;
// // // // // // //   late final Animation<double> _pressScale;

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     _pressCtrl = AnimationController(
// // // // // // //       vsync: this,
// // // // // // //       duration: const Duration(milliseconds: 100),
// // // // // // //       reverseDuration: const Duration(milliseconds: 200),
// // // // // // //       lowerBound: 0.0,
// // // // // // //       upperBound: 1.0,
// // // // // // //     );
// // // // // // //     _pressScale = Tween<double>(
// // // // // // //       begin: 1.0,
// // // // // // //       end: 0.95,
// // // // // // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void dispose() {
// // // // // // //     _pressCtrl.dispose();
// // // // // // //     super.dispose();
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // // // //     final tool = widget.tool;

// // // // // // //     return ScaleTransition(
// // // // // // //       scale: _pressScale,
// // // // // // //       child: GestureDetector(
// // // // // // //         onTapDown: (_) => _pressCtrl.forward(),
// // // // // // //         onTapUp: (_) => _pressCtrl.reverse(),
// // // // // // //         onTapCancel: () => _pressCtrl.reverse(),
// // // // // // //         onTap: tool.implemented
// // // // // // //             ? tool.onTap
// // // // // // //             : () {
// // // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //                   SnackBar(
// // // // // // //                     content: Text('${tool.title} is coming soon.'),
// // // // // // //                     behavior: SnackBarBehavior.floating,
// // // // // // //                   ),
// // // // // // //                 );
// // // // // // //               },
// // // // // // //         child: Container(
// // // // // // //           decoration: BoxDecoration(
// // // // // // //             color: colorScheme.surface,
// // // // // // //             borderRadius: BorderRadius.circular(24),
// // // // // // //             border: Border.all(
// // // // // // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // // // // // //             ),
// // // // // // //             boxShadow: [
// // // // // // //               BoxShadow(
// // // // // // //                 color: Colors.black.withOpacity(0.05),
// // // // // // //                 blurRadius: 20,
// // // // // // //                 offset: const Offset(0, 10),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           child: Stack(
// // // // // // //             children: [
// // // // // // //               Positioned(
// // // // // // //                 top: 14,
// // // // // // //                 right: 14,
// // // // // // //                 child: Container(
// // // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // // //                     horizontal: 9,
// // // // // // //                     vertical: 4,
// // // // // // //                   ),
// // // // // // //                   decoration: BoxDecoration(
// // // // // // //                     color: tool.implemented
// // // // // // //                         ? tool.color.withOpacity(0.12)
// // // // // // //                         : Colors.grey.withOpacity(0.12),
// // // // // // //                     borderRadius: BorderRadius.circular(999),
// // // // // // //                   ),
// // // // // // //                   child: Text(
// // // // // // //                     tool.implemented ? 'Live' : 'Soon',
// // // // // // //                     style: TextStyle(
// // // // // // //                       fontSize: 10,
// // // // // // //                       fontWeight: FontWeight.w800,
// // // // // // //                       color: tool.implemented ? tool.color : Colors.grey,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               Padding(
// // // // // // //                 padding: const EdgeInsets.all(16),
// // // // // // //                 child: Column(
// // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //                   children: [
// // // // // // //                     Hero(
// // // // // // //                       tag: 'tool-icon-${tool.title}',
// // // // // // //                       child: Container(
// // // // // // //                         width: 56,
// // // // // // //                         height: 56,
// // // // // // //                         decoration: BoxDecoration(
// // // // // // //                           gradient: LinearGradient(
// // // // // // //                             colors: [
// // // // // // //                               tool.color.withOpacity(0.95),
// // // // // // //                               tool.color.withOpacity(0.55),
// // // // // // //                             ],
// // // // // // //                           ),
// // // // // // //                           borderRadius: BorderRadius.circular(18),
// // // // // // //                         ),
// // // // // // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     Column(
// // // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                       children: [
// // // // // // //                         Text(
// // // // // // //                           tool.title,
// // // // // // //                           style: const TextStyle(
// // // // // // //                             fontSize: 15,
// // // // // // //                             fontWeight: FontWeight.w800,
// // // // // // //                           ),
// // // // // // //                         ),
// // // // // // //                         const SizedBox(height: 6),
// // // // // // //                         Text(
// // // // // // //                           tool.subtitle,
// // // // // // //                           maxLines: 2,
// // // // // // //                           style: TextStyle(
// // // // // // //                             color: colorScheme.onSurfaceVariant,
// // // // // // //                             fontSize: 12.5,
// // // // // // //                             height: 1.25,
// // // // // // //                           ),
// // // // // // //                         ),
// // // // // // //                       ],
// // // // // // //                     ),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // Empty state
// // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // class _EmptyState extends StatelessWidget {
// // // // // // //   final String query;
// // // // // // //   final String category;

// // // // // // //   const _EmptyState({required this.query, required this.category});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // // //     return Center(
// // // // // // //       child: Padding(
// // // // // // //         padding: const EdgeInsets.all(24),
// // // // // // //         child: Column(
// // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //           children: [
// // // // // // //             Container(
// // // // // // //               width: 94,
// // // // // // //               height: 94,
// // // // // // //               decoration: BoxDecoration(
// // // // // // //                 color: colorScheme.primaryContainer,
// // // // // // //                 borderRadius: BorderRadius.circular(28),
// // // // // // //               ),
// // // // // // //               child: Icon(
// // // // // // //                 Icons.search_off_rounded,
// // // // // // //                 size: 44,
// // // // // // //                 color: colorScheme.onPrimaryContainer,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             Text(
// // // // // // //               'No matching tools',
// // // // // // //               style: Theme.of(
// // // // // // //                 context,
// // // // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 8),
// // // // // // //             Text(
// // // // // // //               query.isEmpty
// // // // // // //                   ? 'No tools found in $category.'
// // // // // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // // // // //               textAlign: TextAlign.center,
// // // // // // //               style: TextStyle(
// // // // // // //                 color: colorScheme.onSurfaceVariant,
// // // // // // //                 height: 1.4,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // // Data model
// // // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // class _ToolItem {
// // // // // // //   final String title;
// // // // // // //   final String subtitle;
// // // // // // //   final IconData icon;
// // // // // // //   final Color color;
// // // // // // //   final String category;
// // // // // // //   final bool implemented;
// // // // // // //   final VoidCallback? onTap;

// // // // // // //   const _ToolItem({
// // // // // // //     required this.title,
// // // // // // //     required this.subtitle,
// // // // // // //     required this.icon,
// // // // // // //     required this.color,
// // // // // // //     required this.category,
// // // // // // //     required this.implemented,
// // // // // // //     this.onTap,
// // // // // // //   });
// // // // // // // }
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:provider/provider.dart';

// // // // // // import '../services/theme_service.dart';
// // // // // // import '../utils/app_transitions.dart';
// // // // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // // // import '../features/pdf_split/pdf_split.dart';
// // // // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // // // import '../features/image_converter/image_converter_screen.dart';
// // // // // // import '../features/pdf_compress/pdf_compress_screen.dart';

// // // // // // class HomeScreen extends StatefulWidget {
// // // // // //   const HomeScreen({super.key});

// // // // // //   @override
// // // // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // // // }

// // // // // // class _HomeScreenState extends State<HomeScreen>
// // // // // //     with SingleTickerProviderStateMixin {
// // // // // //   // ── Search controllers ──
// // // // // //   final TextEditingController _searchController = TextEditingController();
// // // // // //   final TextEditingController _searchToolsController = TextEditingController();
// // // // // //   final TextEditingController _searchFavoritesController =
// // // // // //       TextEditingController();

// // // // // //   String _query = '';
// // // // // //   String _queryTools = '';
// // // // // //   String _queryFavorites = '';
// // // // // //   String _selectedCategory = 'All';

// // // // // //   // ── Bottom navigation state ──
// // // // // //   int _selectedTabIndex = 0;

// // // // // //   // ── Favorites state ──
// // // // // //   final Set<String> _favoriteToolTitles = {};

// // // // // //   late final AnimationController _fadeInController;
// // // // // //   late final Animation<double> _fadeIn;

// // // // // //   final List<String> _categories = [
// // // // // //     'All',
// // // // // //     'Media',
// // // // // //     'PDF',
// // // // // //     'Calculators',
// // // // // //     'Scanning',
// // // // // //   ];

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();

// // // // // //     _fadeInController = AnimationController(
// // // // // //       vsync: this,
// // // // // //       duration: const Duration(milliseconds: 520),
// // // // // //     );
// // // // // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // //       _fadeInController.forward();
// // // // // //     });

// // // // // //     // ── Home search listener ──
// // // // // //     _searchController.addListener(() {
// // // // // //       setState(() {
// // // // // //         _query = _searchController.text.toLowerCase().trim();
// // // // // //       });
// // // // // //     });
// // // // // //     _searchToolsController.addListener(() {
// // // // // //       setState(() {
// // // // // //         _queryTools = _searchToolsController.text.toLowerCase().trim();
// // // // // //       });
// // // // // //     });
// // // // // //     _searchFavoritesController.addListener(() {
// // // // // //       setState(() {
// // // // // //         _queryFavorites = _searchFavoritesController.text.toLowerCase().trim();
// // // // // //       });
// // // // // //     });
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     _fadeInController.dispose();
// // // // // //     _searchController.dispose();
// // // // // //     _searchToolsController.dispose();
// // // // // //     _searchFavoritesController.dispose();
// // // // // //     super.dispose();
// // // // // //   }

// // // // // //   void _onTabTapped(int index) {
// // // // // //     setState(() {
// // // // // //       _selectedTabIndex = index;
// // // // // //     });
// // // // // //   }

// // // // // //   void _toggleFavorite(String title) {
// // // // // //     setState(() {
// // // // // //       if (_favoriteToolTitles.contains(title)) {
// // // // // //         _favoriteToolTitles.remove(title);
// // // // // //       } else {
// // // // // //         _favoriteToolTitles.add(title);
// // // // // //       }
// // // // // //     });
// // // // // //   }

// // // // // //   // ── Tool data ──
// // // // // //   List<_ToolItem> _tools(BuildContext context) {
// // // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // // //     return [
// // // // // //       _ToolItem(
// // // // // //         title: 'QR Code Generator',
// // // // // //         subtitle: 'Create modern QR codes',
// // // // // //         icon: Icons.qr_code_rounded,
// // // // // //         color: colorScheme.primary,
// // // // // //         category: 'Scanning',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'Barcode Generator',
// // // // // //         subtitle: 'Generate barcodes instantly',
// // // // // //         icon: Icons.document_scanner,
// // // // // //         color: Colors.teal,
// // // // // //         category: 'Scanning',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'Image Compressor',
// // // // // //         subtitle: 'Reduce image size fast',
// // // // // //         icon: Icons.compress_rounded,
// // // // // //         color: Colors.green,
// // // // // //         category: 'Media',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const ImageCompressorScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'Age Calculator',
// // // // // //         subtitle: 'Calculate exact age',
// // // // // //         icon: Icons.cake_rounded,
// // // // // //         color: Colors.orange,
// // // // // //         category: 'Calculators',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const AgeCalculatorScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'BMI Calculator',
// // // // // //         subtitle: 'Track your body mass index',
// // // // // //         icon: Icons.monitor_weight_rounded,
// // // // // //         color: Colors.cyan,
// // // // // //         category: 'Calculators',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const BmiCalculatorScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'Unit Converter',
// // // // // //         subtitle: 'Convert units quickly',
// // // // // //         icon: Icons.swap_horiz_rounded,
// // // // // //         color: Colors.indigo,
// // // // // //         category: 'Calculators',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const UnitConverterScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'PDF Merge',
// // // // // //         subtitle: 'Join multiple PDFs',
// // // // // //         icon: Icons.picture_as_pdf_rounded,
// // // // // //         color: Colors.redAccent,
// // // // // //         category: 'PDF',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const PdfMergeScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'PDF Split',
// // // // // //         subtitle: 'Split PDF pages',
// // // // // //         icon: Icons.call_split_rounded,
// // // // // //         color: Colors.pink,
// // // // // //         category: 'PDF',
// // // // // //         implemented: true,
// // // // // //         onTap: () =>
// // // // // //             Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'Image to PDF',
// // // // // //         subtitle: 'Convert images to PDF',
// // // // // //         icon: Icons.insert_drive_file_rounded,
// // // // // //         color: Colors.brown,
// // // // // //         category: 'Media',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const ImageToPdfScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'Image Converter',
// // // // // //         subtitle: 'Change image formats',
// // // // // //         icon: Icons.image_rounded,
// // // // // //         color: Colors.deepOrange,
// // // // // //         category: 'Media',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const ImageConverterScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'Image Resizer',
// // // // // //         subtitle: 'Resize images precisely',
// // // // // //         icon: Icons.photo_size_select_large_rounded,
// // // // // //         color: Colors.blue,
// // // // // //         category: 'Media',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const ImageResizerScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //       _ToolItem(
// // // // // //         title: 'QR / Barcode Scanner',
// // // // // //         subtitle: 'Scan codes with camera',
// // // // // //         icon: Icons.document_scanner_rounded,
// // // // // //         color: Colors.deepPurple,
// // // // // //         category: 'Scanning',
// // // // // //         implemented: true,
// // // // // //         onTap: () => Navigator.push(
// // // // // //           context,
// // // // // //           AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
// // // // // //         ),
// // // // // //       ),
// // // // // //     ];
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final themeService = context.watch<ThemeService>();
// // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // //     final allTools = _tools(context);

// // // // // //     // ── Home filtered tools ──
// // // // // //     final homeFiltered = allTools.where((tool) {
// // // // // //       final matchesQuery =
// // // // // //           _query.isEmpty ||
// // // // // //           tool.title.toLowerCase().contains(_query) ||
// // // // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // // // //           tool.category.toLowerCase().contains(_query);
// // // // // //       final matchesCategory =
// // // // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;
// // // // // //       return matchesQuery && matchesCategory;
// // // // // //     }).toList();

// // // // // //     // ── Tools tab filtered (all, search only) ──
// // // // // //     final toolsFiltered = allTools.where((tool) {
// // // // // //       return _queryTools.isEmpty ||
// // // // // //           tool.title.toLowerCase().contains(_queryTools) ||
// // // // // //           tool.subtitle.toLowerCase().contains(_queryTools);
// // // // // //     }).toList();

// // // // // //     // ── Favorites tab filtered ──
// // // // // //     final favoriteTools = allTools
// // // // // //         .where((tool) => _favoriteToolTitles.contains(tool.title))
// // // // // //         .toList();
// // // // // //     final favoritesFiltered = favoriteTools.where((tool) {
// // // // // //       return _queryFavorites.isEmpty ||
// // // // // //           tool.title.toLowerCase().contains(_queryFavorites) ||
// // // // // //           tool.subtitle.toLowerCase().contains(_queryFavorites);
// // // // // //     }).toList();

// // // // // //     return FadeTransition(
// // // // // //       opacity: _fadeIn,
// // // // // //       child: Scaffold(
// // // // // //         appBar: AppBar(
// // // // // //           title: Row(
// // // // // //             children: [
// // // // // //               Icon(Icons.dashboard_rounded, color: colorScheme.primary),
// // // // // //               const SizedBox(width: 8),
// // // // // //               const Text('ToolKit Pro'),
// // // // // //             ],
// // // // // //           ),
// // // // // //           actions: [
// // // // // //             IconButton(
// // // // // //               onPressed: themeService.toggleTheme,
// // // // // //               icon: Icon(
// // // // // //                 themeService.isDark
// // // // // //                     ? Icons.light_mode_rounded
// // // // // //                     : Icons.dark_mode_rounded,
// // // // // //               ),
// // // // // //             ),
// // // // // //             IconButton(
// // // // // //               onPressed: () {
// // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // //                   const SnackBar(
// // // // // //                     content: Text('Settings coming soon!'),
// // // // // //                     behavior: SnackBarBehavior.floating,
// // // // // //                   ),
// // // // // //                 );
// // // // // //               },
// // // // // //               icon: const Icon(Icons.settings_rounded),
// // // // // //             ),
// // // // // //           ],
// // // // // //           elevation: 0,
// // // // // //           backgroundColor: colorScheme.surface,
// // // // // //           foregroundColor: colorScheme.onSurface,
// // // // // //         ),
// // // // // //         body: IndexedStack(
// // // // // //           index: _selectedTabIndex,
// // // // // //           children: [
// // // // // //             // Tab 0: Home
// // // // // //             _buildHomeContent(homeFiltered, colorScheme),

// // // // // //             // Tab 1: Tools (all tools with search)
// // // // // //             _buildToolsTab(toolsFiltered, allTools, colorScheme),

// // // // // //             // Tab 2: Favorites
// // // // // //             _buildFavoritesTab(favoritesFiltered, colorScheme),

// // // // // //             // Tab 3: Profile placeholder
// // // // // //             const Center(
// // // // // //               child: Text(
// // // // // //                 'Profile',
// // // // // //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         bottomNavigationBar: BottomNavigationBar(
// // // // // //           currentIndex: _selectedTabIndex,
// // // // // //           onTap: _onTabTapped,
// // // // // //           items: const [
// // // // // //             BottomNavigationBarItem(
// // // // // //               icon: Icon(Icons.home_rounded),
// // // // // //               label: 'Home',
// // // // // //             ),
// // // // // //             BottomNavigationBarItem(
// // // // // //               icon: Icon(Icons.grid_view_rounded),
// // // // // //               label: 'Tools',
// // // // // //             ),
// // // // // //             BottomNavigationBarItem(
// // // // // //               icon: Icon(Icons.favorite_rounded),
// // // // // //               label: 'Favorites',
// // // // // //             ),
// // // // // //             BottomNavigationBarItem(
// // // // // //               icon: Icon(Icons.person_rounded),
// // // // // //               label: 'Profile',
// // // // // //             ),
// // // // // //           ],
// // // // // //           selectedItemColor: colorScheme.primary,
// // // // // //           unselectedItemColor: colorScheme.onSurfaceVariant,
// // // // // //           showUnselectedLabels: true,
// // // // // //           type: BottomNavigationBarType.fixed,
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // ──────────────── Home Tab ─────────────────────────────────────
// // // // // //   Widget _buildHomeContent(
// // // // // //     List<_ToolItem> filteredTools,
// // // // // //     ColorScheme colorScheme,
// // // // // //   ) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // // // //       behavior: HitTestBehavior.opaque,
// // // // // //       child: SafeArea(
// // // // // //         child: CustomScrollView(
// // // // // //           slivers: [
// // // // // //             SliverToBoxAdapter(
// // // // // //               child: Padding(
// // // // // //                 padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   children: [
// // // // // //                     Text(
// // // // // //                       'Welcome back!',
// // // // // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // // //                         fontWeight: FontWeight.w800,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 4),
// // // // // //                     Text(
// // // // // //                       'Fast utilities, clean workflow, pro interface.',
// // // // // //                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
// // // // // //                         color: colorScheme.onSurfaceVariant,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 18),
// // // // // //                     Container(
// // // // // //                       width: double.infinity,
// // // // // //                       padding: const EdgeInsets.all(18),
// // // // // //                       decoration: BoxDecoration(
// // // // // //                         borderRadius: BorderRadius.circular(26),
// // // // // //                         gradient: LinearGradient(
// // // // // //                           begin: Alignment.topLeft,
// // // // // //                           end: Alignment.bottomRight,
// // // // // //                           colors: [
// // // // // //                             colorScheme.primaryContainer,
// // // // // //                             colorScheme.tertiaryContainer,
// // // // // //                           ],
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                       child: Row(
// // // // // //                         children: [
// // // // // //                           Expanded(
// // // // // //                             child: Column(
// // // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                               children: [
// // // // // //                                 Text(
// // // // // //                                   'Professional workspace',
// // // // // //                                   style: Theme.of(context).textTheme.titleLarge
// // // // // //                                       ?.copyWith(fontWeight: FontWeight.w800),
// // // // // //                                 ),
// // // // // //                                 const SizedBox(height: 8),
// // // // // //                                 Text(
// // // // // //                                   'Search, launch, and manage your tools from one premium dashboard.',
// // // // // //                                   style: Theme.of(context).textTheme.bodyMedium,
// // // // // //                                 ),
// // // // // //                               ],
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                           const SizedBox(width: 12),
// // // // // //                           Container(
// // // // // //                             width: 66,
// // // // // //                             height: 66,
// // // // // //                             decoration: BoxDecoration(
// // // // // //                               color: colorScheme.surface.withOpacity(0.35),
// // // // // //                               borderRadius: BorderRadius.circular(20),
// // // // // //                             ),
// // // // // //                             child: Icon(
// // // // // //                               Icons.auto_awesome_rounded,
// // // // // //                               size: 34,
// // // // // //                               color: colorScheme.onPrimaryContainer,
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                         ],
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 18),
// // // // // //                     SearchBar(
// // // // // //                       controller: _searchController,
// // // // // //                       hintText: 'Search tools, calculators, PDFs...',
// // // // // //                       leading: const Icon(Icons.search_rounded),
// // // // // //                       trailing: const [Icon(Icons.tune_rounded)],
// // // // // //                       elevation: const WidgetStatePropertyAll(0),
// // // // // //                       backgroundColor: WidgetStatePropertyAll(
// // // // // //                         colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // // //                       ),
// // // // // //                       padding: const WidgetStatePropertyAll(
// // // // // //                         EdgeInsets.symmetric(horizontal: 18),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             SliverToBoxAdapter(
// // // // // //               child: Padding(
// // // // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // //                 child: SizedBox(
// // // // // //                   height: 42,
// // // // // //                   child: ListView.separated(
// // // // // //                     scrollDirection: Axis.horizontal,
// // // // // //                     itemCount: _categories.length,
// // // // // //                     separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // // //                     itemBuilder: (context, index) {
// // // // // //                       final category = _categories[index];
// // // // // //                       final selected = category == _selectedCategory;
// // // // // //                       return AnimatedScale(
// // // // // //                         scale: selected ? 1.05 : 1.0,
// // // // // //                         duration: const Duration(milliseconds: 180),
// // // // // //                         curve: Curves.easeOutCubic,
// // // // // //                         child: ChoiceChip(
// // // // // //                           label: Text(category),
// // // // // //                           selected: selected,
// // // // // //                           onSelected: (_) {
// // // // // //                             setState(() {
// // // // // //                               _selectedCategory = category;
// // // // // //                             });
// // // // // //                           },
// // // // // //                         ),
// // // // // //                       );
// // // // // //                     },
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             SliverToBoxAdapter(
// // // // // //               child: Padding(
// // // // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // // //                 child: Row(
// // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //                   children: [
// // // // // //                     Text(
// // // // // //                       'Featured tools',
// // // // // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // // //                         fontWeight: FontWeight.w800,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     AnimatedSwitcher(
// // // // // //                       duration: const Duration(milliseconds: 220),
// // // // // //                       child: Text(
// // // // // //                         '${filteredTools.length} shown',
// // // // // //                         key: ValueKey(filteredTools.length),
// // // // // //                         style: TextStyle(
// // // // // //                           color: colorScheme.primary,
// // // // // //                           fontWeight: FontWeight.w700,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             if (filteredTools.isEmpty)
// // // // // //               SliverFillRemaining(
// // // // // //                 hasScrollBody: false,
// // // // // //                 child: _EmptyState(query: _query, category: _selectedCategory),
// // // // // //               )
// // // // // //             else
// // // // // //               SliverPadding(
// // // // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // //                 sliver: SliverGrid(
// // // // // //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // //                     crossAxisCount: 2,
// // // // // //                     mainAxisSpacing: 14,
// // // // // //                     crossAxisSpacing: 14,
// // // // // //                     childAspectRatio: 0.82,
// // // // // //                   ),
// // // // // //                   delegate: SliverChildBuilderDelegate((context, index) {
// // // // // //                     final tool = filteredTools[index];
// // // // // //                     return _StaggeredToolCard(
// // // // // //                       tool: tool,
// // // // // //                       index: index,
// // // // // //                       isFavorite: _favoriteToolTitles.contains(tool.title),
// // // // // //                       onToggleFavorite: () => _toggleFavorite(tool.title),
// // // // // //                     );
// // // // // //                   }, childCount: filteredTools.length),
// // // // // //                 ),
// // // // // //               ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // ──────────────── Tools Tab ─────────────────────────────────────
// // // // // //   Widget _buildToolsTab(
// // // // // //     List<_ToolItem> filteredTools,
// // // // // //     List<_ToolItem> allTools,
// // // // // //     ColorScheme colorScheme,
// // // // // //   ) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // // // //       behavior: HitTestBehavior.opaque,
// // // // // //       child: SafeArea(
// // // // // //         child: Column(
// // // // // //           children: [
// // // // // //             Padding(
// // // // // //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // //               child: SearchBar(
// // // // // //                 controller: _searchToolsController,
// // // // // //                 hintText: 'Search all tools...',
// // // // // //                 leading: const Icon(Icons.search_rounded),
// // // // // //                 elevation: const WidgetStatePropertyAll(0),
// // // // // //                 backgroundColor: WidgetStatePropertyAll(
// // // // // //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // // //                 ),
// // // // // //                 padding: const WidgetStatePropertyAll(
// // // // // //                   EdgeInsets.symmetric(horizontal: 18),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             Expanded(
// // // // // //               child: Padding(
// // // // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // //                 child: filteredTools.isEmpty
// // // // // //                     ? _EmptyState(query: _queryTools, category: 'All Tools')
// // // // // //                     : GridView.builder(
// // // // // //                         gridDelegate:
// // // // // //                             const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // //                               crossAxisCount: 2,
// // // // // //                               mainAxisSpacing: 14,
// // // // // //                               crossAxisSpacing: 14,
// // // // // //                               childAspectRatio: 0.82,
// // // // // //                             ),
// // // // // //                         itemCount: filteredTools.length,
// // // // // //                         itemBuilder: (context, index) {
// // // // // //                           final tool = filteredTools[index];
// // // // // //                           return _StaggeredToolCard(
// // // // // //                             tool: tool,
// // // // // //                             index: index,
// // // // // //                             isFavorite: _favoriteToolTitles.contains(
// // // // // //                               tool.title,
// // // // // //                             ),
// // // // // //                             onToggleFavorite: () => _toggleFavorite(tool.title),
// // // // // //                           );
// // // // // //                         },
// // // // // //                       ),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // ──────────────── Favorites Tab ─────────────────────────────────
// // // // // //   Widget _buildFavoritesTab(
// // // // // //     List<_ToolItem> filteredFavorites,
// // // // // //     ColorScheme colorScheme,
// // // // // //   ) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // // // //       behavior: HitTestBehavior.opaque,
// // // // // //       child: SafeArea(
// // // // // //         child: Column(
// // // // // //           children: [
// // // // // //             Padding(
// // // // // //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // // //               child: SearchBar(
// // // // // //                 controller: _searchFavoritesController,
// // // // // //                 hintText: 'Search favorites...',
// // // // // //                 leading: const Icon(Icons.search_rounded),
// // // // // //                 elevation: const WidgetStatePropertyAll(0),
// // // // // //                 backgroundColor: WidgetStatePropertyAll(
// // // // // //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // // //                 ),
// // // // // //                 padding: const WidgetStatePropertyAll(
// // // // // //                   EdgeInsets.symmetric(horizontal: 18),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             Expanded(
// // // // // //               child: Padding(
// // // // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // // //                 child: filteredFavorites.isEmpty
// // // // // //                     ? _EmptyFavoritesState()
// // // // // //                     : GridView.builder(
// // // // // //                         gridDelegate:
// // // // // //                             const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // //                               crossAxisCount: 2,
// // // // // //                               mainAxisSpacing: 14,
// // // // // //                               crossAxisSpacing: 14,
// // // // // //                               childAspectRatio: 0.82,
// // // // // //                             ),
// // // // // //                         itemCount: filteredFavorites.length,
// // // // // //                         itemBuilder: (context, index) {
// // // // // //                           final tool = filteredFavorites[index];
// // // // // //                           return _StaggeredToolCard(
// // // // // //                             tool: tool,
// // // // // //                             index: index,
// // // // // //                             isFavorite: true, // always true in favorites tab
// // // // // //                             onToggleFavorite: () => _toggleFavorite(tool.title),
// // // // // //                           );
// // // // // //                         },
// // // // // //                       ),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // Staggered tool card — fades + slides in based on grid index
// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // class _StaggeredToolCard extends StatefulWidget {
// // // // // //   final _ToolItem tool;
// // // // // //   final int index;
// // // // // //   final bool isFavorite;
// // // // // //   final VoidCallback onToggleFavorite;

// // // // // //   const _StaggeredToolCard({
// // // // // //     required this.tool,
// // // // // //     required this.index,
// // // // // //     required this.isFavorite,
// // // // // //     required this.onToggleFavorite,
// // // // // //   });

// // // // // //   @override
// // // // // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // // // // }

// // // // // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // // // // //     with SingleTickerProviderStateMixin {
// // // // // //   late final AnimationController _ctrl;
// // // // // //   late final Animation<double> _fade;
// // // // // //   late final Animation<Offset> _slide;

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     _ctrl = AnimationController(
// // // // // //       vsync: this,
// // // // // //       duration: const Duration(milliseconds: 420),
// // // // // //     );
// // // // // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // // // // //     _slide = Tween<Offset>(
// // // // // //       begin: const Offset(0, 0.08),
// // // // // //       end: Offset.zero,
// // // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // // // // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // // // // //     Future.delayed(delay, () {
// // // // // //       if (mounted) _ctrl.forward();
// // // // // //     });
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     _ctrl.dispose();
// // // // // //     super.dispose();
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return FadeTransition(
// // // // // //       opacity: _fade,
// // // // // //       child: SlideTransition(
// // // // // //         position: _slide,
// // // // // //         child: _ToolCard(
// // // // // //           tool: widget.tool,
// // // // // //           isFavorite: widget.isFavorite,
// // // // // //           onToggleFavorite: widget.onToggleFavorite,
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // Tool card with press feedback and favorite star
// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // class _ToolCard extends StatefulWidget {
// // // // // //   final _ToolItem tool;
// // // // // //   final bool isFavorite;
// // // // // //   final VoidCallback onToggleFavorite;

// // // // // //   const _ToolCard({
// // // // // //     required this.tool,
// // // // // //     required this.isFavorite,
// // // // // //     required this.onToggleFavorite,
// // // // // //   });

// // // // // //   @override
// // // // // //   State<_ToolCard> createState() => _ToolCardState();
// // // // // // }

// // // // // // class _ToolCardState extends State<_ToolCard>
// // // // // //     with SingleTickerProviderStateMixin {
// // // // // //   late final AnimationController _pressCtrl;
// // // // // //   late final Animation<double> _pressScale;

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     _pressCtrl = AnimationController(
// // // // // //       vsync: this,
// // // // // //       duration: const Duration(milliseconds: 100),
// // // // // //       reverseDuration: const Duration(milliseconds: 200),
// // // // // //       lowerBound: 0.0,
// // // // // //       upperBound: 1.0,
// // // // // //     );
// // // // // //     _pressScale = Tween<double>(
// // // // // //       begin: 1.0,
// // // // // //       end: 0.95,
// // // // // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     _pressCtrl.dispose();
// // // // // //     super.dispose();
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // // //     final tool = widget.tool;

// // // // // //     return ScaleTransition(
// // // // // //       scale: _pressScale,
// // // // // //       child: GestureDetector(
// // // // // //         onTapDown: (_) => _pressCtrl.forward(),
// // // // // //         onTapUp: (_) => _pressCtrl.reverse(),
// // // // // //         onTapCancel: () => _pressCtrl.reverse(),
// // // // // //         onTap: tool.implemented
// // // // // //             ? tool.onTap
// // // // // //             : () {
// // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // //                   SnackBar(
// // // // // //                     content: Text('${tool.title} is coming soon.'),
// // // // // //                     behavior: SnackBarBehavior.floating,
// // // // // //                   ),
// // // // // //                 );
// // // // // //               },
// // // // // //         child: Container(
// // // // // //           decoration: BoxDecoration(
// // // // // //             color: colorScheme.surface,
// // // // // //             borderRadius: BorderRadius.circular(24),
// // // // // //             border: Border.all(
// // // // // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // // // // //             ),
// // // // // //             boxShadow: [
// // // // // //               BoxShadow(
// // // // // //                 color: Colors.black.withOpacity(0.05),
// // // // // //                 blurRadius: 20,
// // // // // //                 offset: const Offset(0, 10),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //           child: Stack(
// // // // // //             children: [
// // // // // //               // ── "Live / Soon" tag ──
// // // // // //               Positioned(
// // // // // //                 top: 14,
// // // // // //                 right: 14,
// // // // // //                 child: Container(
// // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // //                     horizontal: 9,
// // // // // //                     vertical: 4,
// // // // // //                   ),
// // // // // //                   decoration: BoxDecoration(
// // // // // //                     color: tool.implemented
// // // // // //                         ? tool.color.withOpacity(0.12)
// // // // // //                         : Colors.grey.withOpacity(0.12),
// // // // // //                     borderRadius: BorderRadius.circular(999),
// // // // // //                   ),
// // // // // //                   child: Text(
// // // // // //                     tool.implemented ? 'Live' : 'Soon',
// // // // // //                     style: TextStyle(
// // // // // //                       fontSize: 10,
// // // // // //                       fontWeight: FontWeight.w800,
// // // // // //                       color: tool.implemented ? tool.color : Colors.grey,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),

// // // // // //               // ── Star (favorite) button ──
// // // // // //               Positioned(
// // // // // //                 top: 12,
// // // // // //                 left: 12,
// // // // // //                 child: GestureDetector(
// // // // // //                   onTap: widget.onToggleFavorite,
// // // // // //                   child: Container(
// // // // // //                     padding: const EdgeInsets.all(4),
// // // // // //                     decoration: BoxDecoration(
// // // // // //                       color: Colors.black.withOpacity(0.06),
// // // // // //                       shape: BoxShape.circle,
// // // // // //                     ),
// // // // // //                     child: Icon(
// // // // // //                       widget.isFavorite
// // // // // //                           ? Icons.star_rounded
// // // // // //                           : Icons.star_border_rounded,
// // // // // //                       color: widget.isFavorite ? Colors.amber : Colors.grey,
// // // // // //                       size: 22,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),

// // // // // //               // ── Card content ──
// // // // // //               Padding(
// // // // // //                 padding: const EdgeInsets.all(16),
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //                   children: [
// // // // // //                     Hero(
// // // // // //                       tag: 'tool-icon-${tool.title}',
// // // // // //                       child: Container(
// // // // // //                         width: 56,
// // // // // //                         height: 56,
// // // // // //                         decoration: BoxDecoration(
// // // // // //                           gradient: LinearGradient(
// // // // // //                             colors: [
// // // // // //                               tool.color.withOpacity(0.95),
// // // // // //                               tool.color.withOpacity(0.55),
// // // // // //                             ],
// // // // // //                           ),
// // // // // //                           borderRadius: BorderRadius.circular(18),
// // // // // //                         ),
// // // // // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     Column(
// // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                       children: [
// // // // // //                         Text(
// // // // // //                           tool.title,
// // // // // //                           style: const TextStyle(
// // // // // //                             fontSize: 15,
// // // // // //                             fontWeight: FontWeight.w800,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                         const SizedBox(height: 6),
// // // // // //                         Text(
// // // // // //                           tool.subtitle,
// // // // // //                           maxLines: 2,
// // // // // //                           style: TextStyle(
// // // // // //                             color: colorScheme.onSurfaceVariant,
// // // // // //                             fontSize: 12.5,
// // // // // //                             height: 1.25,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // Empty state for Home / Tools
// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // class _EmptyState extends StatelessWidget {
// // // // // //   final String query;
// // // // // //   final String category;

// // // // // //   const _EmptyState({required this.query, required this.category});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // //     return Center(
// // // // // //       child: Padding(
// // // // // //         padding: const EdgeInsets.all(24),
// // // // // //         child: Column(
// // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // //           children: [
// // // // // //             Container(
// // // // // //               width: 94,
// // // // // //               height: 94,
// // // // // //               decoration: BoxDecoration(
// // // // // //                 color: colorScheme.primaryContainer,
// // // // // //                 borderRadius: BorderRadius.circular(28),
// // // // // //               ),
// // // // // //               child: Icon(
// // // // // //                 Icons.search_off_rounded,
// // // // // //                 size: 44,
// // // // // //                 color: colorScheme.onPrimaryContainer,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 18),
// // // // // //             Text(
// // // // // //               'No matching tools',
// // // // // //               style: Theme.of(
// // // // // //                 context,
// // // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // // //             ),
// // // // // //             const SizedBox(height: 8),
// // // // // //             Text(
// // // // // //               query.isEmpty
// // // // // //                   ? 'No tools found in $category.'
// // // // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // // // //               textAlign: TextAlign.center,
// // // // // //               style: TextStyle(
// // // // // //                 color: colorScheme.onSurfaceVariant,
// // // // // //                 height: 1.4,
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // Empty state for Favorites
// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // class _EmptyFavoritesState extends StatelessWidget {
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // // //     return Center(
// // // // // //       child: Padding(
// // // // // //         padding: const EdgeInsets.all(24),
// // // // // //         child: Column(
// // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // //           children: [
// // // // // //             Container(
// // // // // //               width: 94,
// // // // // //               height: 94,
// // // // // //               decoration: BoxDecoration(
// // // // // //                 color: colorScheme.primaryContainer,
// // // // // //                 borderRadius: BorderRadius.circular(28),
// // // // // //               ),
// // // // // //               child: Icon(
// // // // // //                 Icons.favorite_border_rounded,
// // // // // //                 size: 44,
// // // // // //                 color: colorScheme.onPrimaryContainer,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 18),
// // // // // //             Text(
// // // // // //               'No favorites yet',
// // // // // //               style: Theme.of(
// // // // // //                 context,
// // // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // // //             ),
// // // // // //             const SizedBox(height: 8),
// // // // // //             Text(
// // // // // //               'Tap the star on any tool card to add it to your favorites.',
// // // // // //               textAlign: TextAlign.center,
// // // // // //               style: TextStyle(
// // // // // //                 color: colorScheme.onSurfaceVariant,
// // // // // //                 height: 1.4,
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // // Data model
// // // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // class _ToolItem {
// // // // // //   final String title;
// // // // // //   final String subtitle;
// // // // // //   final IconData icon;
// // // // // //   final Color color;
// // // // // //   final String category;
// // // // // //   final bool implemented;
// // // // // //   final VoidCallback? onTap;

// // // // // //   const _ToolItem({
// // // // // //     required this.title,
// // // // // //     required this.subtitle,
// // // // // //     required this.icon,
// // // // // //     required this.color,
// // // // // //     required this.category,
// // // // // //     required this.implemented,
// // // // // //     this.onTap,
// // // // // //   });
// // // // // // }
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:provider/provider.dart';

// // // // // import '../services/theme_service.dart';
// // // // // import '../utils/app_transitions.dart';
// // // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // // import '../features/pdf_split/pdf_split.dart';
// // // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // // import '../features/image_converter/image_converter_screen.dart';
// // // // // import '../features/pdf_compress/pdf_compress_screen.dart';

// // // // // class HomeScreen extends StatefulWidget {
// // // // //   const HomeScreen({super.key});

// // // // //   @override
// // // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // // }

// // // // // class _HomeScreenState extends State<HomeScreen>
// // // // //     with SingleTickerProviderStateMixin {
// // // // //   // ── Search controllers ──
// // // // //   final TextEditingController _searchController = TextEditingController();
// // // // //   final TextEditingController _searchToolsController = TextEditingController();
// // // // //   final TextEditingController _searchFavoritesController =
// // // // //       TextEditingController();

// // // // //   String _query = '';
// // // // //   String _queryTools = '';
// // // // //   String _queryFavorites = '';
// // // // //   String _selectedCategory = 'All';

// // // // //   // ── Bottom navigation state ──
// // // // //   int _selectedTabIndex = 0;

// // // // //   // ── Favorites state ──
// // // // //   final Set<String> _favoriteToolTitles = {};

// // // // //   late final AnimationController _fadeInController;
// // // // //   late final Animation<double> _fadeIn;

// // // // //   final List<String> _categories = [
// // // // //     'All',
// // // // //     'Media',
// // // // //     'PDF',
// // // // //     'Calculators',
// // // // //     'Scanning',
// // // // //   ];

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();

// // // // //     _fadeInController = AnimationController(
// // // // //       vsync: this,
// // // // //       duration: const Duration(milliseconds: 520),
// // // // //     );
// // // // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // //       _fadeInController.forward();
// // // // //     });

// // // // //     // ── Home search listener ──
// // // // //     _searchController.addListener(() {
// // // // //       setState(() {
// // // // //         _query = _searchController.text.toLowerCase().trim();
// // // // //       });
// // // // //     });
// // // // //     _searchToolsController.addListener(() {
// // // // //       setState(() {
// // // // //         _queryTools = _searchToolsController.text.toLowerCase().trim();
// // // // //       });
// // // // //     });
// // // // //     _searchFavoritesController.addListener(() {
// // // // //       setState(() {
// // // // //         _queryFavorites = _searchFavoritesController.text.toLowerCase().trim();
// // // // //       });
// // // // //     });
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _fadeInController.dispose();
// // // // //     _searchController.dispose();
// // // // //     _searchToolsController.dispose();
// // // // //     _searchFavoritesController.dispose();
// // // // //     super.dispose();
// // // // //   }

// // // // //   void _onTabTapped(int index) {
// // // // //     setState(() {
// // // // //       _selectedTabIndex = index;
// // // // //     });
// // // // //   }

// // // // //   void _toggleFavorite(String title) {
// // // // //     setState(() {
// // // // //       if (_favoriteToolTitles.contains(title)) {
// // // // //         _favoriteToolTitles.remove(title);
// // // // //       } else {
// // // // //         _favoriteToolTitles.add(title);
// // // // //       }
// // // // //     });
// // // // //   }

// // // // //   // ── Tool data ──
// // // // //   List<_ToolItem> _tools(BuildContext context) {
// // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // //     return [
// // // // //       _ToolItem(
// // // // //         title: 'QR Code Generator',
// // // // //         subtitle: 'Create modern QR codes',
// // // // //         icon: Icons.qr_code_rounded,
// // // // //         color: colorScheme.primary,
// // // // //         category: 'Scanning',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'Barcode Generator',
// // // // //         subtitle: 'Generate barcodes instantly',
// // // // //         icon: Icons.document_scanner,
// // // // //         color: Colors.teal,
// // // // //         category: 'Scanning',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'Image Compressor',
// // // // //         subtitle: 'Reduce image size fast',
// // // // //         icon: Icons.compress_rounded,
// // // // //         color: Colors.green,
// // // // //         category: 'Media',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const ImageCompressorScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'Age Calculator',
// // // // //         subtitle: 'Calculate exact age',
// // // // //         icon: Icons.cake_rounded,
// // // // //         color: Colors.orange,
// // // // //         category: 'Calculators',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const AgeCalculatorScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'BMI Calculator',
// // // // //         subtitle: 'Track your body mass index',
// // // // //         icon: Icons.monitor_weight_rounded,
// // // // //         color: Colors.cyan,
// // // // //         category: 'Calculators',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const BmiCalculatorScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'Unit Converter',
// // // // //         subtitle: 'Convert units quickly',
// // // // //         icon: Icons.swap_horiz_rounded,
// // // // //         color: Colors.indigo,
// // // // //         category: 'Calculators',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const UnitConverterScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'PDF Merge',
// // // // //         subtitle: 'Join multiple PDFs',
// // // // //         icon: Icons.picture_as_pdf_rounded,
// // // // //         color: Colors.redAccent,
// // // // //         category: 'PDF',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const PdfMergeScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'PDF Split',
// // // // //         subtitle: 'Split PDF pages',
// // // // //         icon: Icons.call_split_rounded,
// // // // //         color: Colors.pink,
// // // // //         category: 'PDF',
// // // // //         implemented: true,
// // // // //         onTap: () =>
// // // // //             Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'Image to PDF',
// // // // //         subtitle: 'Convert images to PDF',
// // // // //         icon: Icons.insert_drive_file_rounded,
// // // // //         color: Colors.brown,
// // // // //         category: 'Media',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const ImageToPdfScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'Image Converter',
// // // // //         subtitle: 'Change image formats',
// // // // //         icon: Icons.image_rounded,
// // // // //         color: Colors.deepOrange,
// // // // //         category: 'Media',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const ImageConverterScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'Image Resizer',
// // // // //         subtitle: 'Resize images precisely',
// // // // //         icon: Icons.photo_size_select_large_rounded,
// // // // //         color: Colors.blue,
// // // // //         category: 'Media',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const ImageResizerScreen()),
// // // // //         ),
// // // // //       ),
// // // // //       _ToolItem(
// // // // //         title: 'QR / Barcode Scanner',
// // // // //         subtitle: 'Scan codes with camera',
// // // // //         icon: Icons.document_scanner_rounded,
// // // // //         color: Colors.deepPurple,
// // // // //         category: 'Scanning',
// // // // //         implemented: true,
// // // // //         onTap: () => Navigator.push(
// // // // //           context,
// // // // //           AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
// // // // //         ),
// // // // //       ),
// // // // //     ];
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final themeService = context.watch<ThemeService>();
// // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // //     final allTools = _tools(context);

// // // // //     // ── Home filtered tools ──
// // // // //     final homeFiltered = allTools.where((tool) {
// // // // //       final matchesQuery =
// // // // //           _query.isEmpty ||
// // // // //           tool.title.toLowerCase().contains(_query) ||
// // // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // // //           tool.category.toLowerCase().contains(_query);
// // // // //       final matchesCategory =
// // // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;
// // // // //       return matchesQuery && matchesCategory;
// // // // //     }).toList();

// // // // //     // ── Tools tab filtered (all, search only) ──
// // // // //     final toolsFiltered = allTools.where((tool) {
// // // // //       return _queryTools.isEmpty ||
// // // // //           tool.title.toLowerCase().contains(_queryTools) ||
// // // // //           tool.subtitle.toLowerCase().contains(_queryTools);
// // // // //     }).toList();

// // // // //     // ── Favorites tab filtered ──
// // // // //     final favoriteTools = allTools
// // // // //         .where((tool) => _favoriteToolTitles.contains(tool.title))
// // // // //         .toList();
// // // // //     final favoritesFiltered = favoriteTools.where((tool) {
// // // // //       return _queryFavorites.isEmpty ||
// // // // //           tool.title.toLowerCase().contains(_queryFavorites) ||
// // // // //           tool.subtitle.toLowerCase().contains(_queryFavorites);
// // // // //     }).toList();

// // // // //     return FadeTransition(
// // // // //       opacity: _fadeIn,
// // // // //       child: Scaffold(
// // // // //         appBar: AppBar(
// // // // //           title: Row(
// // // // //             children: [
// // // // //               Icon(Icons.dashboard_rounded, color: colorScheme.primary),
// // // // //               const SizedBox(width: 8),
// // // // //               const Text('ToolKit Pro'),
// // // // //             ],
// // // // //           ),
// // // // //           actions: [
// // // // //             IconButton(
// // // // //               onPressed: themeService.toggleTheme,
// // // // //               icon: Icon(
// // // // //                 themeService.isDark
// // // // //                     ? Icons.light_mode_rounded
// // // // //                     : Icons.dark_mode_rounded,
// // // // //               ),
// // // // //             ),
// // // // //             IconButton(
// // // // //               onPressed: () {
// // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // //                   const SnackBar(
// // // // //                     content: Text('Settings coming soon!'),
// // // // //                     behavior: SnackBarBehavior.floating,
// // // // //                   ),
// // // // //                 );
// // // // //               },
// // // // //               icon: const Icon(Icons.settings_rounded),
// // // // //             ),
// // // // //           ],
// // // // //           elevation: 0,
// // // // //           backgroundColor: colorScheme.surface,
// // // // //           foregroundColor: colorScheme.onSurface,
// // // // //         ),
// // // // //         body: IndexedStack(
// // // // //           index: _selectedTabIndex,
// // // // //           children: [
// // // // //             // Tab 0: Home
// // // // //             _buildHomeContent(homeFiltered, colorScheme),

// // // // //             // Tab 1: Tools (all tools with search)
// // // // //             _buildToolsTab(toolsFiltered, colorScheme),

// // // // //             // Tab 2: Favorites
// // // // //             _buildFavoritesTab(favoritesFiltered, colorScheme),

// // // // //             // Tab 3: Profile placeholder
// // // // //             const Center(
// // // // //               child: Text(
// // // // //                 'Profile',
// // // // //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         bottomNavigationBar: BottomNavigationBar(
// // // // //           currentIndex: _selectedTabIndex,
// // // // //           onTap: _onTabTapped,
// // // // //           items: const [
// // // // //             BottomNavigationBarItem(
// // // // //               icon: Icon(Icons.home_rounded),
// // // // //               label: 'Home',
// // // // //             ),
// // // // //             BottomNavigationBarItem(
// // // // //               icon: Icon(Icons.grid_view_rounded),
// // // // //               label: 'Tools',
// // // // //             ),
// // // // //             BottomNavigationBarItem(
// // // // //               icon: Icon(Icons.favorite_rounded),
// // // // //               label: 'Favorites',
// // // // //             ),
// // // // //             BottomNavigationBarItem(
// // // // //               icon: Icon(Icons.person_rounded),
// // // // //               label: 'Profile',
// // // // //             ),
// // // // //           ],
// // // // //           selectedItemColor: colorScheme.primary,
// // // // //           unselectedItemColor: colorScheme.onSurfaceVariant,
// // // // //           showUnselectedLabels: true,
// // // // //           type: BottomNavigationBarType.fixed,
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // ──────────────── Home Tab ─────────────────────────────────────
// // // // //   Widget _buildHomeContent(
// // // // //     List<_ToolItem> filteredTools,
// // // // //     ColorScheme colorScheme,
// // // // //   ) {
// // // // //     return GestureDetector(
// // // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // // //       behavior: HitTestBehavior.opaque,
// // // // //       child: SafeArea(
// // // // //         child: CustomScrollView(
// // // // //           slivers: [
// // // // //             SliverToBoxAdapter(
// // // // //               child: Padding(
// // // // //                 padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       'Welcome back!',
// // // // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // //                         fontWeight: FontWeight.w800,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 4),
// // // // //                     Text(
// // // // //                       'Fast utilities, clean workflow, pro interface.',
// // // // //                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
// // // // //                         color: colorScheme.onSurfaceVariant,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 18),
// // // // //                     Container(
// // // // //                       width: double.infinity,
// // // // //                       padding: const EdgeInsets.all(18),
// // // // //                       decoration: BoxDecoration(
// // // // //                         borderRadius: BorderRadius.circular(26),
// // // // //                         gradient: LinearGradient(
// // // // //                           begin: Alignment.topLeft,
// // // // //                           end: Alignment.bottomRight,
// // // // //                           colors: [
// // // // //                             colorScheme.primaryContainer,
// // // // //                             colorScheme.tertiaryContainer,
// // // // //                           ],
// // // // //                         ),
// // // // //                       ),
// // // // //                       child: Row(
// // // // //                         children: [
// // // // //                           Expanded(
// // // // //                             child: Column(
// // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                               children: [
// // // // //                                 Text(
// // // // //                                   'Professional workspace',
// // // // //                                   style: Theme.of(context).textTheme.titleLarge
// // // // //                                       ?.copyWith(fontWeight: FontWeight.w800),
// // // // //                                 ),
// // // // //                                 const SizedBox(height: 8),
// // // // //                                 Text(
// // // // //                                   'Search, launch, and manage your tools from one premium dashboard.',
// // // // //                                   style: Theme.of(context).textTheme.bodyMedium,
// // // // //                                 ),
// // // // //                               ],
// // // // //                             ),
// // // // //                           ),
// // // // //                           const SizedBox(width: 12),
// // // // //                           Container(
// // // // //                             width: 66,
// // // // //                             height: 66,
// // // // //                             decoration: BoxDecoration(
// // // // //                               color: colorScheme.surface.withOpacity(0.35),
// // // // //                               borderRadius: BorderRadius.circular(20),
// // // // //                             ),
// // // // //                             child: Icon(
// // // // //                               Icons.auto_awesome_rounded,
// // // // //                               size: 34,
// // // // //                               color: colorScheme.onPrimaryContainer,
// // // // //                             ),
// // // // //                           ),
// // // // //                         ],
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 18),
// // // // //                     SearchBar(
// // // // //                       controller: _searchController,
// // // // //                       hintText: 'Search tools, calculators, PDFs...',
// // // // //                       leading: const Icon(Icons.search_rounded),
// // // // //                       trailing: const [Icon(Icons.tune_rounded)],
// // // // //                       elevation: const WidgetStatePropertyAll(0),
// // // // //                       backgroundColor: WidgetStatePropertyAll(
// // // // //                         colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // //                       ),
// // // // //                       padding: const WidgetStatePropertyAll(
// // // // //                         EdgeInsets.symmetric(horizontal: 18),
// // // // //                       ),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             SliverToBoxAdapter(
// // // // //               child: Padding(
// // // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // //                 child: SizedBox(
// // // // //                   height: 42,
// // // // //                   child: ListView.separated(
// // // // //                     scrollDirection: Axis.horizontal,
// // // // //                     itemCount: _categories.length,
// // // // //                     separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // //                     itemBuilder: (context, index) {
// // // // //                       final category = _categories[index];
// // // // //                       final selected = category == _selectedCategory;
// // // // //                       return AnimatedScale(
// // // // //                         scale: selected ? 1.05 : 1.0,
// // // // //                         duration: const Duration(milliseconds: 180),
// // // // //                         curve: Curves.easeOutCubic,
// // // // //                         child: ChoiceChip(
// // // // //                           label: Text(category),
// // // // //                           selected: selected,
// // // // //                           onSelected: (_) {
// // // // //                             setState(() {
// // // // //                               _selectedCategory = category;
// // // // //                             });
// // // // //                           },
// // // // //                         ),
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             SliverToBoxAdapter(
// // // // //               child: Padding(
// // // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // // //                 child: Row(
// // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       'Featured tools',
// // // // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // // //                         fontWeight: FontWeight.w800,
// // // // //                       ),
// // // // //                     ),
// // // // //                     AnimatedSwitcher(
// // // // //                       duration: const Duration(milliseconds: 220),
// // // // //                       child: Text(
// // // // //                         '${filteredTools.length} shown',
// // // // //                         key: ValueKey(filteredTools.length),
// // // // //                         style: TextStyle(
// // // // //                           color: colorScheme.primary,
// // // // //                           fontWeight: FontWeight.w700,
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             if (filteredTools.isEmpty)
// // // // //               SliverFillRemaining(
// // // // //                 hasScrollBody: false,
// // // // //                 child: _EmptyState(query: _query, category: _selectedCategory),
// // // // //               )
// // // // //             else
// // // // //               SliverPadding(
// // // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // //                 sliver: SliverGrid(
// // // // //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // // // //                     crossAxisCount: 2,
// // // // //                     mainAxisSpacing: 14,
// // // // //                     crossAxisSpacing: 14,
// // // // //                     childAspectRatio: 0.82,
// // // // //                   ),
// // // // //                   delegate: SliverChildBuilderDelegate((context, index) {
// // // // //                     final tool = filteredTools[index];
// // // // //                     return _StaggeredToolCard(
// // // // //                       tool: tool,
// // // // //                       index: index,
// // // // //                       isFavorite: _favoriteToolTitles.contains(tool.title),
// // // // //                       onToggleFavorite: () => _toggleFavorite(tool.title),
// // // // //                     );
// // // // //                   }, childCount: filteredTools.length),
// // // // //                 ),
// // // // //               ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // ──────────────── Tools Tab ─────────────────────────────────────
// // // // //   Widget _buildToolsTab(
// // // // //     List<_ToolItem> filteredTools,
// // // // //     ColorScheme colorScheme,
// // // // //   ) {
// // // // //     return GestureDetector(
// // // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // // //       behavior: HitTestBehavior.opaque,
// // // // //       child: SafeArea(
// // // // //         child: Column(
// // // // //           children: [
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // //               child: SearchBar(
// // // // //                 controller: _searchToolsController,
// // // // //                 hintText: 'Search all tools...',
// // // // //                 leading: const Icon(Icons.search_rounded),
// // // // //                 elevation: const WidgetStatePropertyAll(0),
// // // // //                 backgroundColor: WidgetStatePropertyAll(
// // // // //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // //                 ),
// // // // //                 padding: const WidgetStatePropertyAll(
// // // // //                   EdgeInsets.symmetric(horizontal: 18),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             Expanded(
// // // // //               child: Padding(
// // // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // //                 child: filteredTools.isEmpty
// // // // //                     ? _EmptyState(query: _queryTools, category: 'All Tools')
// // // // //                     : GridView.builder(
// // // // //                         gridDelegate:
// // // // //                             const SliverGridDelegateWithFixedCrossAxisCount(
// // // // //                               crossAxisCount: 2,
// // // // //                               mainAxisSpacing: 14,
// // // // //                               crossAxisSpacing: 14,
// // // // //                               childAspectRatio: 0.82,
// // // // //                             ),
// // // // //                         itemCount: filteredTools.length,
// // // // //                         itemBuilder: (context, index) {
// // // // //                           final tool = filteredTools[index];
// // // // //                           return _StaggeredToolCard(
// // // // //                             tool: tool,
// // // // //                             index: index,
// // // // //                             isFavorite: _favoriteToolTitles.contains(
// // // // //                               tool.title,
// // // // //                             ),
// // // // //                             onToggleFavorite: () => _toggleFavorite(tool.title),
// // // // //                           );
// // // // //                         },
// // // // //                       ),
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // ──────────────── Favorites Tab ─────────────────────────────────
// // // // //   Widget _buildFavoritesTab(
// // // // //     List<_ToolItem> filteredFavorites,
// // // // //     ColorScheme colorScheme,
// // // // //   ) {
// // // // //     return GestureDetector(
// // // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // // //       behavior: HitTestBehavior.opaque,
// // // // //       child: SafeArea(
// // // // //         child: Column(
// // // // //           children: [
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // // //               child: SearchBar(
// // // // //                 controller: _searchFavoritesController,
// // // // //                 hintText: 'Search favorites...',
// // // // //                 leading: const Icon(Icons.search_rounded),
// // // // //                 elevation: const WidgetStatePropertyAll(0),
// // // // //                 backgroundColor: WidgetStatePropertyAll(
// // // // //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // // //                 ),
// // // // //                 padding: const WidgetStatePropertyAll(
// // // // //                   EdgeInsets.symmetric(horizontal: 18),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             Expanded(
// // // // //               child: Padding(
// // // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // // //                 child: filteredFavorites.isEmpty
// // // // //                     ? _EmptyFavoritesState()
// // // // //                     : GridView.builder(
// // // // //                         gridDelegate:
// // // // //                             const SliverGridDelegateWithFixedCrossAxisCount(
// // // // //                               crossAxisCount: 2,
// // // // //                               mainAxisSpacing: 14,
// // // // //                               crossAxisSpacing: 14,
// // // // //                               childAspectRatio: 0.82,
// // // // //                             ),
// // // // //                         itemCount: filteredFavorites.length,
// // // // //                         itemBuilder: (context, index) {
// // // // //                           final tool = filteredFavorites[index];
// // // // //                           return _StaggeredToolCard(
// // // // //                             tool: tool,
// // // // //                             index: index,
// // // // //                             isFavorite: true,
// // // // //                             onToggleFavorite: () => _toggleFavorite(tool.title),
// // // // //                           );
// // // // //                         },
// // // // //                       ),
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // Staggered tool card — fades + slides in based on grid index
// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // class _StaggeredToolCard extends StatefulWidget {
// // // // //   final _ToolItem tool;
// // // // //   final int index;
// // // // //   final bool isFavorite;
// // // // //   final VoidCallback onToggleFavorite;

// // // // //   const _StaggeredToolCard({
// // // // //     required this.tool,
// // // // //     required this.index,
// // // // //     required this.isFavorite,
// // // // //     required this.onToggleFavorite,
// // // // //   });

// // // // //   @override
// // // // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // // // }

// // // // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // // // //     with SingleTickerProviderStateMixin {
// // // // //   late final AnimationController _ctrl;
// // // // //   late final Animation<double> _fade;
// // // // //   late final Animation<Offset> _slide;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     _ctrl = AnimationController(
// // // // //       vsync: this,
// // // // //       duration: const Duration(milliseconds: 420),
// // // // //     );
// // // // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // // // //     _slide = Tween<Offset>(
// // // // //       begin: const Offset(0, 0.08),
// // // // //       end: Offset.zero,
// // // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // // // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // // // //     Future.delayed(delay, () {
// // // // //       if (mounted) _ctrl.forward();
// // // // //     });
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _ctrl.dispose();
// // // // //     super.dispose();
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return FadeTransition(
// // // // //       opacity: _fade,
// // // // //       child: SlideTransition(
// // // // //         position: _slide,
// // // // //         child: _ToolCard(
// // // // //           tool: widget.tool,
// // // // //           isFavorite: widget.isFavorite,
// // // // //           onToggleFavorite: widget.onToggleFavorite,
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // Tool card with press feedback and favorite star (placed below "Live" tag)
// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // class _ToolCard extends StatefulWidget {
// // // // //   final _ToolItem tool;
// // // // //   final bool isFavorite;
// // // // //   final VoidCallback onToggleFavorite;

// // // // //   const _ToolCard({
// // // // //     required this.tool,
// // // // //     required this.isFavorite,
// // // // //     required this.onToggleFavorite,
// // // // //   });

// // // // //   @override
// // // // //   State<_ToolCard> createState() => _ToolCardState();
// // // // // }

// // // // // class _ToolCardState extends State<_ToolCard>
// // // // //     with SingleTickerProviderStateMixin {
// // // // //   late final AnimationController _pressCtrl;
// // // // //   late final Animation<double> _pressScale;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     _pressCtrl = AnimationController(
// // // // //       vsync: this,
// // // // //       duration: const Duration(milliseconds: 100),
// // // // //       reverseDuration: const Duration(milliseconds: 200),
// // // // //       lowerBound: 0.0,
// // // // //       upperBound: 1.0,
// // // // //     );
// // // // //     _pressScale = Tween<double>(
// // // // //       begin: 1.0,
// // // // //       end: 0.95,
// // // // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _pressCtrl.dispose();
// // // // //     super.dispose();
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final colorScheme = Theme.of(context).colorScheme;
// // // // //     final tool = widget.tool;

// // // // //     return ScaleTransition(
// // // // //       scale: _pressScale,
// // // // //       child: GestureDetector(
// // // // //         onTapDown: (_) => _pressCtrl.forward(),
// // // // //         onTapUp: (_) => _pressCtrl.reverse(),
// // // // //         onTapCancel: () => _pressCtrl.reverse(),
// // // // //         onTap: tool.implemented
// // // // //             ? tool.onTap
// // // // //             : () {
// // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // //                   SnackBar(
// // // // //                     content: Text('${tool.title} is coming soon.'),
// // // // //                     behavior: SnackBarBehavior.floating,
// // // // //                   ),
// // // // //                 );
// // // // //               },
// // // // //         child: Container(
// // // // //           decoration: BoxDecoration(
// // // // //             color: colorScheme.surface,
// // // // //             borderRadius: BorderRadius.circular(24),
// // // // //             border: Border.all(
// // // // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // // // //             ),
// // // // //             boxShadow: [
// // // // //               BoxShadow(
// // // // //                 color: Colors.black.withOpacity(0.05),
// // // // //                 blurRadius: 20,
// // // // //                 offset: const Offset(0, 10),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //           child: Stack(
// // // // //             children: [
// // // // //               // ── "Live / Soon" tag (top‑right) ──
// // // // //               Positioned(
// // // // //                 top: 14,
// // // // //                 right: 14,
// // // // //                 child: Container(
// // // // //                   padding: const EdgeInsets.symmetric(
// // // // //                     horizontal: 9,
// // // // //                     vertical: 4,
// // // // //                   ),
// // // // //                   decoration: BoxDecoration(
// // // // //                     color: tool.implemented
// // // // //                         ? tool.color.withOpacity(0.12)
// // // // //                         : Colors.grey.withOpacity(0.12),
// // // // //                     borderRadius: BorderRadius.circular(999),
// // // // //                   ),
// // // // //                   child: Text(
// // // // //                     tool.implemented ? 'Live' : 'Soon',
// // // // //                     style: TextStyle(
// // // // //                       fontSize: 10,
// // // // //                       fontWeight: FontWeight.w800,
// // // // //                       color: tool.implemented ? tool.color : Colors.grey,
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //               ),

// // // // //               // ── Star (favorite) button – placed just below the "Live" tag ──
// // // // //               Positioned(
// // // // //                 top: 48, // below the "Live" tag
// // // // //                 right: 14,
// // // // //                 child: GestureDetector(
// // // // //                   onTap: widget.onToggleFavorite,
// // // // //                   child: Container(
// // // // //                     padding: const EdgeInsets.all(4),
// // // // //                     decoration: BoxDecoration(
// // // // //                       color: Colors.black.withOpacity(0.06),
// // // // //                       shape: BoxShape.circle,
// // // // //                     ),
// // // // //                     child: Icon(
// // // // //                       widget.isFavorite
// // // // //                           ? Icons.star_rounded
// // // // //                           : Icons.star_border_rounded,
// // // // //                       color: widget.isFavorite ? Colors.amber : Colors.grey,
// // // // //                       size: 26,
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //               ),

// // // // //               // ── Card content ──
// // // // //               Padding(
// // // // //                 padding: const EdgeInsets.all(16),
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                   children: [
// // // // //                     Hero(
// // // // //                       tag: 'tool-icon-${tool.title}',
// // // // //                       child: Container(
// // // // //                         width: 56,
// // // // //                         height: 56,
// // // // //                         decoration: BoxDecoration(
// // // // //                           gradient: LinearGradient(
// // // // //                             colors: [
// // // // //                               tool.color.withOpacity(0.95),
// // // // //                               tool.color.withOpacity(0.55),
// // // // //                             ],
// // // // //                           ),
// // // // //                           borderRadius: BorderRadius.circular(18),
// // // // //                         ),
// // // // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // // // //                       ),
// // // // //                     ),
// // // // //                     Column(
// // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                       children: [
// // // // //                         Text(
// // // // //                           tool.title,
// // // // //                           style: const TextStyle(
// // // // //                             fontSize: 15,
// // // // //                             fontWeight: FontWeight.w800,
// // // // //                           ),
// // // // //                         ),
// // // // //                         const SizedBox(height: 6),
// // // // //                         Text(
// // // // //                           tool.subtitle,
// // // // //                           maxLines: 2,
// // // // //                           style: TextStyle(
// // // // //                             color: colorScheme.onSurfaceVariant,
// // // // //                             fontSize: 12.5,
// // // // //                             height: 1.25,
// // // // //                           ),
// // // // //                         ),
// // // // //                       ],
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // Empty state for Home / Tools
// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // class _EmptyState extends StatelessWidget {
// // // // //   final String query;
// // // // //   final String category;

// // // // //   const _EmptyState({required this.query, required this.category});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // //     return Center(
// // // // //       child: Padding(
// // // // //         padding: const EdgeInsets.all(24),
// // // // //         child: Column(
// // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // //           children: [
// // // // //             Container(
// // // // //               width: 94,
// // // // //               height: 94,
// // // // //               decoration: BoxDecoration(
// // // // //                 color: colorScheme.primaryContainer,
// // // // //                 borderRadius: BorderRadius.circular(28),
// // // // //               ),
// // // // //               child: Icon(
// // // // //                 Icons.search_off_rounded,
// // // // //                 size: 44,
// // // // //                 color: colorScheme.onPrimaryContainer,
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 18),
// // // // //             Text(
// // // // //               'No matching tools',
// // // // //               style: Theme.of(
// // // // //                 context,
// // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // //             ),
// // // // //             const SizedBox(height: 8),
// // // // //             Text(
// // // // //               query.isEmpty
// // // // //                   ? 'No tools found in $category.'
// // // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // // //               textAlign: TextAlign.center,
// // // // //               style: TextStyle(
// // // // //                 color: colorScheme.onSurfaceVariant,
// // // // //                 height: 1.4,
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // Empty state for Favorites
// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // class _EmptyFavoritesState extends StatelessWidget {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final colorScheme = Theme.of(context).colorScheme;

// // // // //     return Center(
// // // // //       child: Padding(
// // // // //         padding: const EdgeInsets.all(24),
// // // // //         child: Column(
// // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // //           children: [
// // // // //             Container(
// // // // //               width: 94,
// // // // //               height: 94,
// // // // //               decoration: BoxDecoration(
// // // // //                 color: colorScheme.primaryContainer,
// // // // //                 borderRadius: BorderRadius.circular(28),
// // // // //               ),
// // // // //               child: Icon(
// // // // //                 Icons.favorite_border_rounded,
// // // // //                 size: 44,
// // // // //                 color: colorScheme.onPrimaryContainer,
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 18),
// // // // //             Text(
// // // // //               'No favorites yet',
// // // // //               style: Theme.of(
// // // // //                 context,
// // // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // // //             ),
// // // // //             const SizedBox(height: 8),
// // // // //             Text(
// // // // //               'Tap the star on any tool card to add it to your favorites.',
// // // // //               textAlign: TextAlign.center,
// // // // //               style: TextStyle(
// // // // //                 color: colorScheme.onSurfaceVariant,
// // // // //                 height: 1.4,
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // // Data model
// // // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // class _ToolItem {
// // // // //   final String title;
// // // // //   final String subtitle;
// // // // //   final IconData icon;
// // // // //   final Color color;
// // // // //   final String category;
// // // // //   final bool implemented;
// // // // //   final VoidCallback? onTap;

// // // // //   const _ToolItem({
// // // // //     required this.title,
// // // // //     required this.subtitle,
// // // // //     required this.icon,
// // // // //     required this.color,
// // // // //     required this.category,
// // // // //     required this.implemented,
// // // // //     this.onTap,
// // // // //   });
// // // // // }
// // // // import 'package:flutter/material.dart';
// // // // import 'package:provider/provider.dart';

// // // // import '../services/theme_service.dart';
// // // // import '../utils/app_transitions.dart';
// // // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // // import '../features/age_calculator/age_calculator_screen.dart';
// // // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // // import '../features/unit_converter/unit_converter_screen.dart';
// // // // import '../features/image_resizer/image_resizer_screen.dart';
// // // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // // import '../features/pdf_split/pdf_split.dart';
// // // // import '../features/image_compressor/image_compressor_screen.dart';
// // // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // // import '../features/image_converter/image_converter_screen.dart';
// // // // import '../features/pdf_compress/pdf_compress_screen.dart';

// // // // // ─── History entry model ──────────────────────────────────────────
// // // // class HistoryEntry {
// // // //   final String toolTitle;
// // // //   final DateTime timestamp;

// // // //   HistoryEntry(this.toolTitle, this.timestamp);

// // // //   String get formattedDateTime =>
// // // //       '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
// // // // }

// // // // class HomeScreen extends StatefulWidget {
// // // //   const HomeScreen({super.key});

// // // //   @override
// // // //   State<HomeScreen> createState() => _HomeScreenState();
// // // // }

// // // // class _HomeScreenState extends State<HomeScreen>
// // // //     with SingleTickerProviderStateMixin {
// // // //   // ── Search controllers ──
// // // //   final TextEditingController _searchController = TextEditingController();
// // // //   final TextEditingController _searchToolsController = TextEditingController();
// // // //   final TextEditingController _searchFavoritesController =
// // // //       TextEditingController();

// // // //   String _query = '';
// // // //   String _queryTools = '';
// // // //   String _queryFavorites = '';
// // // //   String _selectedCategory = 'All';

// // // //   // ── Bottom navigation state ──
// // // //   int _selectedTabIndex = 0;

// // // //   // ── Favorites state ──
// // // //   final Set<String> _favoriteToolTitles = {};

// // // //   // ── History state ──
// // // //   final List<HistoryEntry> _history = [];

// // // //   late final AnimationController _fadeInController;
// // // //   late final Animation<double> _fadeIn;

// // // //   final List<String> _categories = [
// // // //     'All',
// // // //     'Media',
// // // //     'PDF',
// // // //     'Calculators',
// // // //     'Scanning',
// // // //   ];

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();

// // // //     _fadeInController = AnimationController(
// // // //       vsync: this,
// // // //       duration: const Duration(milliseconds: 520),
// // // //     );
// // // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // //       _fadeInController.forward();
// // // //     });

// // // //     _searchController.addListener(() {
// // // //       setState(() {
// // // //         _query = _searchController.text.toLowerCase().trim();
// // // //       });
// // // //     });
// // // //     _searchToolsController.addListener(() {
// // // //       setState(() {
// // // //         _queryTools = _searchToolsController.text.toLowerCase().trim();
// // // //       });
// // // //     });
// // // //     _searchFavoritesController.addListener(() {
// // // //       setState(() {
// // // //         _queryFavorites = _searchFavoritesController.text.toLowerCase().trim();
// // // //       });
// // // //     });
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _fadeInController.dispose();
// // // //     _searchController.dispose();
// // // //     _searchToolsController.dispose();
// // // //     _searchFavoritesController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   void _onTabTapped(int index) {
// // // //     setState(() {
// // // //       _selectedTabIndex = index;
// // // //     });
// // // //   }

// // // //   void _toggleFavorite(String title) {
// // // //     setState(() {
// // // //       if (_favoriteToolTitles.contains(title)) {
// // // //         _favoriteToolTitles.remove(title);
// // // //       } else {
// // // //         _favoriteToolTitles.add(title);
// // // //       }
// // // //     });
// // // //   }

// // // //   void _logHistory(String toolTitle) {
// // // //     setState(() {
// // // //       _history.insert(0, HistoryEntry(toolTitle, DateTime.now()));
// // // //     });
// // // //   }

// // // //   void _clearHistory() {
// // // //     setState(() {
// // // //       _history.clear();
// // // //     });
// // // //   }

// // // //   // ── Tool data ──
// // // //   List<_ToolItem> _tools(BuildContext context) {
// // // //     final colorScheme = Theme.of(context).colorScheme;
// // // //     return [
// // // //       _ToolItem(
// // // //         title: 'QR Code Generator',
// // // //         subtitle: 'Create modern QR codes',
// // // //         icon: Icons.qr_code_rounded,
// // // //         color: colorScheme.primary,
// // // //         category: 'Scanning',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'Barcode Generator',
// // // //         subtitle: 'Generate barcodes instantly',
// // // //         icon: Icons.document_scanner,
// // // //         color: Colors.teal,
// // // //         category: 'Scanning',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'Image Compressor',
// // // //         subtitle: 'Reduce image size fast',
// // // //         icon: Icons.compress_rounded,
// // // //         color: Colors.green,
// // // //         category: 'Media',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const ImageCompressorScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'Age Calculator',
// // // //         subtitle: 'Calculate exact age',
// // // //         icon: Icons.cake_rounded,
// // // //         color: Colors.orange,
// // // //         category: 'Calculators',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const AgeCalculatorScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'BMI Calculator',
// // // //         subtitle: 'Track your body mass index',
// // // //         icon: Icons.monitor_weight_rounded,
// // // //         color: Colors.cyan,
// // // //         category: 'Calculators',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const BmiCalculatorScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'Unit Converter',
// // // //         subtitle: 'Convert units quickly',
// // // //         icon: Icons.swap_horiz_rounded,
// // // //         color: Colors.indigo,
// // // //         category: 'Calculators',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const UnitConverterScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'PDF Merge',
// // // //         subtitle: 'Join multiple PDFs',
// // // //         icon: Icons.picture_as_pdf_rounded,
// // // //         color: Colors.redAccent,
// // // //         category: 'PDF',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const PdfMergeScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'PDF Split',
// // // //         subtitle: 'Split PDF pages',
// // // //         icon: Icons.call_split_rounded,
// // // //         color: Colors.pink,
// // // //         category: 'PDF',
// // // //         implemented: true,
// // // //         onTap: () =>
// // // //             Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'Image to PDF',
// // // //         subtitle: 'Convert images to PDF',
// // // //         icon: Icons.insert_drive_file_rounded,
// // // //         color: Colors.brown,
// // // //         category: 'Media',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const ImageToPdfScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'Image Converter',
// // // //         subtitle: 'Change image formats',
// // // //         icon: Icons.image_rounded,
// // // //         color: Colors.deepOrange,
// // // //         category: 'Media',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const ImageConverterScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'Image Resizer',
// // // //         subtitle: 'Resize images precisely',
// // // //         icon: Icons.photo_size_select_large_rounded,
// // // //         color: Colors.blue,
// // // //         category: 'Media',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const ImageResizerScreen()),
// // // //         ),
// // // //       ),
// // // //       _ToolItem(
// // // //         title: 'QR / Barcode Scanner',
// // // //         subtitle: 'Scan codes with camera',
// // // //         icon: Icons.document_scanner_rounded,
// // // //         color: Colors.deepPurple,
// // // //         category: 'Scanning',
// // // //         implemented: true,
// // // //         onTap: () => Navigator.push(
// // // //           context,
// // // //           AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
// // // //         ),
// // // //       ),
// // // //     ];
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final themeService = context.watch<ThemeService>();
// // // //     final colorScheme = Theme.of(context).colorScheme;

// // // //     final allTools = _tools(context);

// // // //     // ── Home filtered tools ──
// // // //     final homeFiltered = allTools.where((tool) {
// // // //       final matchesQuery =
// // // //           _query.isEmpty ||
// // // //           tool.title.toLowerCase().contains(_query) ||
// // // //           tool.subtitle.toLowerCase().contains(_query) ||
// // // //           tool.category.toLowerCase().contains(_query);
// // // //       final matchesCategory =
// // // //           _selectedCategory == 'All' || tool.category == _selectedCategory;
// // // //       return matchesQuery && matchesCategory;
// // // //     }).toList();

// // // //     // ── Tools tab filtered ──
// // // //     final toolsFiltered = allTools.where((tool) {
// // // //       return _queryTools.isEmpty ||
// // // //           tool.title.toLowerCase().contains(_queryTools) ||
// // // //           tool.subtitle.toLowerCase().contains(_queryTools);
// // // //     }).toList();

// // // //     // ── Favorites tab filtered ──
// // // //     final favoriteTools = allTools
// // // //         .where((tool) => _favoriteToolTitles.contains(tool.title))
// // // //         .toList();
// // // //     final favoritesFiltered = favoriteTools.where((tool) {
// // // //       return _queryFavorites.isEmpty ||
// // // //           tool.title.toLowerCase().contains(_queryFavorites) ||
// // // //           tool.subtitle.toLowerCase().contains(_queryFavorites);
// // // //     }).toList();

// // // //     return FadeTransition(
// // // //       opacity: _fadeIn,
// // // //       child: Scaffold(
// // // //         appBar: AppBar(
// // // //           title: Row(
// // // //             children: [
// // // //               Icon(Icons.dashboard_rounded, color: colorScheme.primary),
// // // //               const SizedBox(width: 8),
// // // //               const Text('ToolKit Pro'),
// // // //             ],
// // // //           ),
// // // //           actions: [
// // // //             IconButton(
// // // //               onPressed: themeService.toggleTheme,
// // // //               icon: Icon(
// // // //                 themeService.isDark
// // // //                     ? Icons.light_mode_rounded
// // // //                     : Icons.dark_mode_rounded,
// // // //               ),
// // // //             ),
// // // //             // ── Clear history button (only show on History tab) ──
// // // //             if (_selectedTabIndex == 3)
// // // //               IconButton(
// // // //                 onPressed: _history.isEmpty ? null : _clearHistory,
// // // //                 icon: Icon(
// // // //                   Icons.delete_sweep_rounded,
// // // //                   color: _history.isEmpty ? Colors.grey : colorScheme.error,
// // // //                 ),
// // // //                 tooltip: 'Clear history',
// // // //               ),
// // // //             IconButton(
// // // //               onPressed: () {
// // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // //                   const SnackBar(
// // // //                     content: Text('Settings coming soon!'),
// // // //                     behavior: SnackBarBehavior.floating,
// // // //                   ),
// // // //                 );
// // // //               },
// // // //               icon: const Icon(Icons.settings_rounded),
// // // //             ),
// // // //           ],
// // // //           elevation: 0,
// // // //           backgroundColor: colorScheme.surface,
// // // //           foregroundColor: colorScheme.onSurface,
// // // //         ),
// // // //         body: IndexedStack(
// // // //           index: _selectedTabIndex,
// // // //           children: [
// // // //             // Tab 0: Home
// // // //             _buildHomeContent(homeFiltered, colorScheme),

// // // //             // Tab 1: Tools
// // // //             _buildToolsTab(toolsFiltered, colorScheme),

// // // //             // Tab 2: Favorites
// // // //             _buildFavoritesTab(favoritesFiltered, colorScheme),

// // // //             // Tab 3: History
// // // //             _buildHistoryTab(colorScheme),
// // // //           ],
// // // //         ),
// // // //         bottomNavigationBar: BottomNavigationBar(
// // // //           currentIndex: _selectedTabIndex,
// // // //           onTap: _onTabTapped,
// // // //           items: const [
// // // //             BottomNavigationBarItem(
// // // //               icon: Icon(Icons.home_rounded),
// // // //               label: 'Home',
// // // //             ),
// // // //             BottomNavigationBarItem(
// // // //               icon: Icon(Icons.grid_view_rounded),
// // // //               label: 'Tools',
// // // //             ),
// // // //             BottomNavigationBarItem(
// // // //               icon: Icon(Icons.favorite_rounded),
// // // //               label: 'Favorites',
// // // //             ),
// // // //             BottomNavigationBarItem(
// // // //               icon: Icon(Icons.history_rounded),
// // // //               label: 'History',
// // // //             ),
// // // //           ],
// // // //           selectedItemColor: colorScheme.primary,
// // // //           unselectedItemColor: colorScheme.onSurfaceVariant,
// // // //           showUnselectedLabels: true,
// // // //           type: BottomNavigationBarType.fixed,
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ──────────────── Home Tab ─────────────────────────────────────
// // // //   Widget _buildHomeContent(
// // // //     List<_ToolItem> filteredTools,
// // // //     ColorScheme colorScheme,
// // // //   ) {
// // // //     return GestureDetector(
// // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // //       behavior: HitTestBehavior.opaque,
// // // //       child: SafeArea(
// // // //         child: CustomScrollView(
// // // //           slivers: [
// // // //             SliverToBoxAdapter(
// // // //               child: Padding(
// // // //                 padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: [
// // // //                     Text(
// // // //                       'Welcome back!',
// // // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // //                         fontWeight: FontWeight.w800,
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(height: 4),
// // // //                     Text(
// // // //                       'Fast utilities, clean workflow, pro interface.',
// // // //                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
// // // //                         color: colorScheme.onSurfaceVariant,
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(height: 18),
// // // //                     Container(
// // // //                       width: double.infinity,
// // // //                       padding: const EdgeInsets.all(18),
// // // //                       decoration: BoxDecoration(
// // // //                         borderRadius: BorderRadius.circular(26),
// // // //                         gradient: LinearGradient(
// // // //                           begin: Alignment.topLeft,
// // // //                           end: Alignment.bottomRight,
// // // //                           colors: [
// // // //                             colorScheme.primaryContainer,
// // // //                             colorScheme.tertiaryContainer,
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                       child: Row(
// // // //                         children: [
// // // //                           Expanded(
// // // //                             child: Column(
// // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // //                               children: [
// // // //                                 Text(
// // // //                                   'Professional workspace',
// // // //                                   style: Theme.of(context).textTheme.titleLarge
// // // //                                       ?.copyWith(fontWeight: FontWeight.w800),
// // // //                                 ),
// // // //                                 const SizedBox(height: 8),
// // // //                                 Text(
// // // //                                   'Search, launch, and manage your tools from one premium dashboard.',
// // // //                                   style: Theme.of(context).textTheme.bodyMedium,
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //                           const SizedBox(width: 12),
// // // //                           Container(
// // // //                             width: 66,
// // // //                             height: 66,
// // // //                             decoration: BoxDecoration(
// // // //                               color: colorScheme.surface.withOpacity(0.35),
// // // //                               borderRadius: BorderRadius.circular(20),
// // // //                             ),
// // // //                             child: Icon(
// // // //                               Icons.auto_awesome_rounded,
// // // //                               size: 34,
// // // //                               color: colorScheme.onPrimaryContainer,
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(height: 18),
// // // //                     SearchBar(
// // // //                       controller: _searchController,
// // // //                       hintText: 'Search tools, calculators, PDFs...',
// // // //                       leading: const Icon(Icons.search_rounded),
// // // //                       trailing: const [Icon(Icons.tune_rounded)],
// // // //                       elevation: const WidgetStatePropertyAll(0),
// // // //                       backgroundColor: WidgetStatePropertyAll(
// // // //                         colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // //                       ),
// // // //                       padding: const WidgetStatePropertyAll(
// // // //                         EdgeInsets.symmetric(horizontal: 18),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             SliverToBoxAdapter(
// // // //               child: Padding(
// // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // //                 child: SizedBox(
// // // //                   height: 42,
// // // //                   child: ListView.separated(
// // // //                     scrollDirection: Axis.horizontal,
// // // //                     itemCount: _categories.length,
// // // //                     separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // //                     itemBuilder: (context, index) {
// // // //                       final category = _categories[index];
// // // //                       final selected = category == _selectedCategory;
// // // //                       return AnimatedScale(
// // // //                         scale: selected ? 1.05 : 1.0,
// // // //                         duration: const Duration(milliseconds: 180),
// // // //                         curve: Curves.easeOutCubic,
// // // //                         child: ChoiceChip(
// // // //                           label: Text(category),
// // // //                           selected: selected,
// // // //                           onSelected: (_) {
// // // //                             setState(() {
// // // //                               _selectedCategory = category;
// // // //                             });
// // // //                           },
// // // //                         ),
// // // //                       );
// // // //                     },
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             SliverToBoxAdapter(
// // // //               child: Padding(
// // // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // // //                 child: Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       'Featured tools',
// // // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // // //                         fontWeight: FontWeight.w800,
// // // //                       ),
// // // //                     ),
// // // //                     AnimatedSwitcher(
// // // //                       duration: const Duration(milliseconds: 220),
// // // //                       child: Text(
// // // //                         '${filteredTools.length} shown',
// // // //                         key: ValueKey(filteredTools.length),
// // // //                         style: TextStyle(
// // // //                           color: colorScheme.primary,
// // // //                           fontWeight: FontWeight.w700,
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             if (filteredTools.isEmpty)
// // // //               SliverFillRemaining(
// // // //                 hasScrollBody: false,
// // // //                 child: _EmptyState(query: _query, category: _selectedCategory),
// // // //               )
// // // //             else
// // // //               SliverPadding(
// // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // //                 sliver: SliverGrid(
// // // //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // // //                     crossAxisCount: 2,
// // // //                     mainAxisSpacing: 14,
// // // //                     crossAxisSpacing: 14,
// // // //                     childAspectRatio: 0.82,
// // // //                   ),
// // // //                   delegate: SliverChildBuilderDelegate((context, index) {
// // // //                     final tool = filteredTools[index];
// // // //                     return _StaggeredToolCard(
// // // //                       tool: tool,
// // // //                       index: index,
// // // //                       isFavorite: _favoriteToolTitles.contains(tool.title),
// // // //                       onToggleFavorite: () => _toggleFavorite(tool.title),
// // // //                       onToolTap: () {
// // // //                         _logHistory(tool.title);
// // // //                         tool.onTap?.call();
// // // //                       },
// // // //                     );
// // // //                   }, childCount: filteredTools.length),
// // // //                 ),
// // // //               ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ──────────────── Tools Tab ─────────────────────────────────────
// // // //   Widget _buildToolsTab(
// // // //     List<_ToolItem> filteredTools,
// // // //     ColorScheme colorScheme,
// // // //   ) {
// // // //     return GestureDetector(
// // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // //       behavior: HitTestBehavior.opaque,
// // // //       child: SafeArea(
// // // //         child: Column(
// // // //           children: [
// // // //             Padding(
// // // //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // //               child: SearchBar(
// // // //                 controller: _searchToolsController,
// // // //                 hintText: 'Search all tools...',
// // // //                 leading: const Icon(Icons.search_rounded),
// // // //                 elevation: const WidgetStatePropertyAll(0),
// // // //                 backgroundColor: WidgetStatePropertyAll(
// // // //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // //                 ),
// // // //                 padding: const WidgetStatePropertyAll(
// // // //                   EdgeInsets.symmetric(horizontal: 18),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             Expanded(
// // // //               child: Padding(
// // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // //                 child: filteredTools.isEmpty
// // // //                     ? _EmptyState(query: _queryTools, category: 'All Tools')
// // // //                     : GridView.builder(
// // // //                         gridDelegate:
// // // //                             const SliverGridDelegateWithFixedCrossAxisCount(
// // // //                               crossAxisCount: 2,
// // // //                               mainAxisSpacing: 14,
// // // //                               crossAxisSpacing: 14,
// // // //                               childAspectRatio: 0.82,
// // // //                             ),
// // // //                         itemCount: filteredTools.length,
// // // //                         itemBuilder: (context, index) {
// // // //                           final tool = filteredTools[index];
// // // //                           return _StaggeredToolCard(
// // // //                             tool: tool,
// // // //                             index: index,
// // // //                             isFavorite: _favoriteToolTitles.contains(
// // // //                               tool.title,
// // // //                             ),
// // // //                             onToggleFavorite: () => _toggleFavorite(tool.title),
// // // //                             onToolTap: () {
// // // //                               _logHistory(tool.title);
// // // //                               tool.onTap?.call();
// // // //                             },
// // // //                           );
// // // //                         },
// // // //                       ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ──────────────── Favorites Tab ─────────────────────────────────
// // // //   Widget _buildFavoritesTab(
// // // //     List<_ToolItem> filteredFavorites,
// // // //     ColorScheme colorScheme,
// // // //   ) {
// // // //     return GestureDetector(
// // // //       onTap: () => FocusScope.of(context).unfocus(),
// // // //       behavior: HitTestBehavior.opaque,
// // // //       child: SafeArea(
// // // //         child: Column(
// // // //           children: [
// // // //             Padding(
// // // //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // // //               child: SearchBar(
// // // //                 controller: _searchFavoritesController,
// // // //                 hintText: 'Search favorites...',
// // // //                 leading: const Icon(Icons.search_rounded),
// // // //                 elevation: const WidgetStatePropertyAll(0),
// // // //                 backgroundColor: WidgetStatePropertyAll(
// // // //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // // //                 ),
// // // //                 padding: const WidgetStatePropertyAll(
// // // //                   EdgeInsets.symmetric(horizontal: 18),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             Expanded(
// // // //               child: Padding(
// // // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // // //                 child: filteredFavorites.isEmpty
// // // //                     ? _EmptyFavoritesState()
// // // //                     : GridView.builder(
// // // //                         gridDelegate:
// // // //                             const SliverGridDelegateWithFixedCrossAxisCount(
// // // //                               crossAxisCount: 2,
// // // //                               mainAxisSpacing: 14,
// // // //                               crossAxisSpacing: 14,
// // // //                               childAspectRatio: 0.82,
// // // //                             ),
// // // //                         itemCount: filteredFavorites.length,
// // // //                         itemBuilder: (context, index) {
// // // //                           final tool = filteredFavorites[index];
// // // //                           return _StaggeredToolCard(
// // // //                             tool: tool,
// // // //                             index: index,
// // // //                             isFavorite: true,
// // // //                             onToggleFavorite: () => _toggleFavorite(tool.title),
// // // //                             onToolTap: () {
// // // //                               _logHistory(tool.title);
// // // //                               tool.onTap?.call();
// // // //                             },
// // // //                           );
// // // //                         },
// // // //                       ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ──────────────── History Tab ──────────────────────────────────
// // // //   Widget _buildHistoryTab(ColorScheme colorScheme) {
// // // //     return SafeArea(
// // // //       child: _history.isEmpty
// // // //           ? _EmptyHistoryState()
// // // //           : ListView.builder(
// // // //               padding: const EdgeInsets.all(16),
// // // //               itemCount: _history.length,
// // // //               itemBuilder: (context, index) {
// // // //                 final entry = _history[index];
// // // //                 return Card(
// // // //                   margin: const EdgeInsets.only(bottom: 10),
// // // //                   elevation: 1,
// // // //                   shape: RoundedRectangleBorder(
// // // //                     borderRadius: BorderRadius.circular(14),
// // // //                   ),
// // // //                   child: ListTile(
// // // //                     leading: CircleAvatar(
// // // //                       backgroundColor: colorScheme.primaryContainer,
// // // //                       child: Icon(
// // // //                         Icons.history_rounded,
// // // //                         color: colorScheme.primary,
// // // //                       ),
// // // //                     ),
// // // //                     title: Text(
// // // //                       entry.toolTitle,
// // // //                       style: const TextStyle(
// // // //                         fontWeight: FontWeight.w700,
// // // //                         fontSize: 16,
// // // //                       ),
// // // //                     ),
// // // //                     subtitle: Text(entry.formattedDateTime),
// // // //                     trailing: IconButton(
// // // //                       icon: Icon(
// // // //                         Icons.delete_outline_rounded,
// // // //                         color: colorScheme.error.withOpacity(0.6),
// // // //                       ),
// // // //                       onPressed: () {
// // // //                         setState(() {
// // // //                           _history.removeAt(index);
// // // //                         });
// // // //                       },
// // // //                       tooltip: 'Remove from history',
// // // //                     ),
// // // //                   ),
// // // //                 );
// // // //               },
// // // //             ),
// // // //     );
// // // //   }
// // // // }

// // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // Staggered tool card
// // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // class _StaggeredToolCard extends StatefulWidget {
// // // //   final _ToolItem tool;
// // // //   final int index;
// // // //   final bool isFavorite;
// // // //   final VoidCallback onToggleFavorite;
// // // //   final VoidCallback onToolTap;

// // // //   const _StaggeredToolCard({
// // // //     required this.tool,
// // // //     required this.index,
// // // //     required this.isFavorite,
// // // //     required this.onToggleFavorite,
// // // //     required this.onToolTap,
// // // //   });

// // // //   @override
// // // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // // }

// // // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // // //     with SingleTickerProviderStateMixin {
// // // //   late final AnimationController _ctrl;
// // // //   late final Animation<double> _fade;
// // // //   late final Animation<Offset> _slide;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _ctrl = AnimationController(
// // // //       vsync: this,
// // // //       duration: const Duration(milliseconds: 420),
// // // //     );
// // // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // // //     _slide = Tween<Offset>(
// // // //       begin: const Offset(0, 0.08),
// // // //       end: Offset.zero,
// // // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // // //     Future.delayed(delay, () {
// // // //       if (mounted) _ctrl.forward();
// // // //     });
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _ctrl.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return FadeTransition(
// // // //       opacity: _fade,
// // // //       child: SlideTransition(
// // // //         position: _slide,
// // // //         child: _ToolCard(
// // // //           tool: widget.tool,
// // // //           isFavorite: widget.isFavorite,
// // // //           onToggleFavorite: widget.onToggleFavorite,
// // // //           onToolTap: widget.onToolTap,
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // Tool card
// // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // class _ToolCard extends StatefulWidget {
// // // //   final _ToolItem tool;
// // // //   final bool isFavorite;
// // // //   final VoidCallback onToggleFavorite;
// // // //   final VoidCallback onToolTap;

// // // //   const _ToolCard({
// // // //     required this.tool,
// // // //     required this.isFavorite,
// // // //     required this.onToggleFavorite,
// // // //     required this.onToolTap,
// // // //   });

// // // //   @override
// // // //   State<_ToolCard> createState() => _ToolCardState();
// // // // }

// // // // class _ToolCardState extends State<_ToolCard>
// // // //     with SingleTickerProviderStateMixin {
// // // //   late final AnimationController _pressCtrl;
// // // //   late final Animation<double> _pressScale;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _pressCtrl = AnimationController(
// // // //       vsync: this,
// // // //       duration: const Duration(milliseconds: 100),
// // // //       reverseDuration: const Duration(milliseconds: 200),
// // // //       lowerBound: 0.0,
// // // //       upperBound: 1.0,
// // // //     );
// // // //     _pressScale = Tween<double>(
// // // //       begin: 1.0,
// // // //       end: 0.95,
// // // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _pressCtrl.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final colorScheme = Theme.of(context).colorScheme;
// // // //     final tool = widget.tool;

// // // //     return ScaleTransition(
// // // //       scale: _pressScale,
// // // //       child: GestureDetector(
// // // //         onTapDown: (_) => _pressCtrl.forward(),
// // // //         onTapUp: (_) => _pressCtrl.reverse(),
// // // //         onTapCancel: () => _pressCtrl.reverse(),
// // // //         onTap: tool.implemented
// // // //             ? () {
// // // //                 widget.onToolTap(); // logs history and navigates
// // // //               }
// // // //             : () {
// // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // //                   SnackBar(
// // // //                     content: Text('${tool.title} is coming soon.'),
// // // //                     behavior: SnackBarBehavior.floating,
// // // //                   ),
// // // //                 );
// // // //               },
// // // //         child: Container(
// // // //           decoration: BoxDecoration(
// // // //             color: colorScheme.surface,
// // // //             borderRadius: BorderRadius.circular(24),
// // // //             border: Border.all(
// // // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // // //             ),
// // // //             boxShadow: [
// // // //               BoxShadow(
// // // //                 color: Colors.black.withOpacity(0.05),
// // // //                 blurRadius: 20,
// // // //                 offset: const Offset(0, 10),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           child: Stack(
// // // //             children: [
// // // //               // ── "Live / Soon" tag ──
// // // //               Positioned(
// // // //                 top: 14,
// // // //                 right: 14,
// // // //                 child: Container(
// // // //                   padding: const EdgeInsets.symmetric(
// // // //                     horizontal: 9,
// // // //                     vertical: 4,
// // // //                   ),
// // // //                   decoration: BoxDecoration(
// // // //                     color: tool.implemented
// // // //                         ? tool.color.withOpacity(0.12)
// // // //                         : Colors.grey.withOpacity(0.12),
// // // //                     borderRadius: BorderRadius.circular(999),
// // // //                   ),
// // // //                   child: Text(
// // // //                     tool.implemented ? 'Live' : 'Soon',
// // // //                     style: TextStyle(
// // // //                       fontSize: 10,
// // // //                       fontWeight: FontWeight.w800,
// // // //                       color: tool.implemented ? tool.color : Colors.grey,
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),

// // // //               // ── Star button (below the tag) ──
// // // //               Positioned(
// // // //                 top: 48,
// // // //                 right: 14,
// // // //                 child: GestureDetector(
// // // //                   onTap: widget.onToggleFavorite,
// // // //                   child: Container(
// // // //                     padding: const EdgeInsets.all(4),
// // // //                     decoration: BoxDecoration(
// // // //                       color: Colors.black.withOpacity(0.06),
// // // //                       shape: BoxShape.circle,
// // // //                     ),
// // // //                     child: Icon(
// // // //                       widget.isFavorite
// // // //                           ? Icons.star_rounded
// // // //                           : Icons.star_border_rounded,
// // // //                       color: widget.isFavorite ? Colors.amber : Colors.grey,
// // // //                       size: 26,
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),

// // // //               // ── Card content ──
// // // //               Padding(
// // // //                 padding: const EdgeInsets.all(16),
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Hero(
// // // //                       tag: 'tool-icon-${tool.title}',
// // // //                       child: Container(
// // // //                         width: 56,
// // // //                         height: 56,
// // // //                         decoration: BoxDecoration(
// // // //                           gradient: LinearGradient(
// // // //                             colors: [
// // // //                               tool.color.withOpacity(0.95),
// // // //                               tool.color.withOpacity(0.55),
// // // //                             ],
// // // //                           ),
// // // //                           borderRadius: BorderRadius.circular(18),
// // // //                         ),
// // // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // // //                       ),
// // // //                     ),
// // // //                     Column(
// // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // //                       children: [
// // // //                         Text(
// // // //                           tool.title,
// // // //                           style: const TextStyle(
// // // //                             fontSize: 15,
// // // //                             fontWeight: FontWeight.w800,
// // // //                           ),
// // // //                         ),
// // // //                         const SizedBox(height: 6),
// // // //                         Text(
// // // //                           tool.subtitle,
// // // //                           maxLines: 2,
// // // //                           style: TextStyle(
// // // //                             color: colorScheme.onSurfaceVariant,
// // // //                             fontSize: 12.5,
// // // //                             height: 1.25,
// // // //                           ),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // ──────────────── Empty States ────────────────────────────────────
// // // // class _EmptyState extends StatelessWidget {
// // // //   final String query;
// // // //   final String category;

// // // //   const _EmptyState({required this.query, required this.category});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final colorScheme = Theme.of(context).colorScheme;

// // // //     return Center(
// // // //       child: Padding(
// // // //         padding: const EdgeInsets.all(24),
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Container(
// // // //               width: 94,
// // // //               height: 94,
// // // //               decoration: BoxDecoration(
// // // //                 color: colorScheme.primaryContainer,
// // // //                 borderRadius: BorderRadius.circular(28),
// // // //               ),
// // // //               child: Icon(
// // // //                 Icons.search_off_rounded,
// // // //                 size: 44,
// // // //                 color: colorScheme.onPrimaryContainer,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 18),
// // // //             Text(
// // // //               'No matching tools',
// // // //               style: Theme.of(
// // // //                 context,
// // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // //             ),
// // // //             const SizedBox(height: 8),
// // // //             Text(
// // // //               query.isEmpty
// // // //                   ? 'No tools found in $category.'
// // // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // // //               textAlign: TextAlign.center,
// // // //               style: TextStyle(
// // // //                 color: colorScheme.onSurfaceVariant,
// // // //                 height: 1.4,
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class _EmptyFavoritesState extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final colorScheme = Theme.of(context).colorScheme;

// // // //     return Center(
// // // //       child: Padding(
// // // //         padding: const EdgeInsets.all(24),
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Container(
// // // //               width: 94,
// // // //               height: 94,
// // // //               decoration: BoxDecoration(
// // // //                 color: colorScheme.primaryContainer,
// // // //                 borderRadius: BorderRadius.circular(28),
// // // //               ),
// // // //               child: Icon(
// // // //                 Icons.favorite_border_rounded,
// // // //                 size: 44,
// // // //                 color: colorScheme.onPrimaryContainer,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 18),
// // // //             Text(
// // // //               'No favorites yet',
// // // //               style: Theme.of(
// // // //                 context,
// // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // //             ),
// // // //             const SizedBox(height: 8),
// // // //             Text(
// // // //               'Tap the star on any tool card to add it to your favorites.',
// // // //               textAlign: TextAlign.center,
// // // //               style: TextStyle(
// // // //                 color: colorScheme.onSurfaceVariant,
// // // //                 height: 1.4,
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class _EmptyHistoryState extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final colorScheme = Theme.of(context).colorScheme;

// // // //     return Center(
// // // //       child: Padding(
// // // //         padding: const EdgeInsets.all(24),
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Container(
// // // //               width: 94,
// // // //               height: 94,
// // // //               decoration: BoxDecoration(
// // // //                 color: colorScheme.primaryContainer,
// // // //                 borderRadius: BorderRadius.circular(28),
// // // //               ),
// // // //               child: Icon(
// // // //                 Icons.history,
// // // //                 size: 44,
// // // //                 color: colorScheme.onPrimaryContainer,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 18),
// // // //             Text(
// // // //               'No history yet',
// // // //               style: Theme.of(
// // // //                 context,
// // // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // // //             ),
// // // //             const SizedBox(height: 8),
// // // //             Text(
// // // //               'Your recently used tools will appear here.',
// // // //               textAlign: TextAlign.center,
// // // //               style: TextStyle(
// // // //                 color: colorScheme.onSurfaceVariant,
// // // //                 height: 1.4,
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // // Tool data model
// // // // // ─────────────────────────────────────────────────────────────────────────────
// // // // class _ToolItem {
// // // //   final String title;
// // // //   final String subtitle;
// // // //   final IconData icon;
// // // //   final Color color;
// // // //   final String category;
// // // //   final bool implemented;
// // // //   final VoidCallback? onTap;

// // // //   const _ToolItem({
// // // //     required this.title,
// // // //     required this.subtitle,
// // // //     required this.icon,
// // // //     required this.color,
// // // //     required this.category,
// // // //     required this.implemented,
// // // //     this.onTap,
// // // //   });
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:provider/provider.dart';
// // // import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
// // // import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

// // // import '../services/theme_service.dart';
// // // import '../utils/app_transitions.dart';
// // // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // // import '../features/barcode_generator/barcode_generator_screen.dart';
// // // import '../features/age_calculator/age_calculator_screen.dart';
// // // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // // import '../features/unit_converter/unit_converter_screen.dart';
// // // import '../features/image_resizer/image_resizer_screen.dart';
// // // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // // import '../features/pdf_split/pdf_split.dart';
// // // import '../features/image_compressor/image_compressor_screen.dart';
// // // import '../features/pdf_merge/pdf_merge_screen.dart';
// // // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // // import '../features/image_converter/image_converter_screen.dart';
// // // import '../features/pdf_compress/pdf_compress_screen.dart';

// // // // ─── History entry model ──────────────────────────────────────────
// // // class HistoryEntry {
// // //   final String toolTitle;
// // //   final DateTime timestamp;

// // //   HistoryEntry(this.toolTitle, this.timestamp);

// // //   String get formattedDateTime =>
// // //       '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
// // // }

// // // class HomeScreen extends StatefulWidget {
// // //   const HomeScreen({super.key});

// // //   @override
// // //   State<HomeScreen> createState() => _HomeScreenState();
// // // }

// // // class _HomeScreenState extends State<HomeScreen>
// // //     with SingleTickerProviderStateMixin {
// // //   // ── Page controller for RollingBottomBar ──
// // //   final PageController _pageController = PageController();
// // //   int _currentPage = 0;

// // //   // ── Search controllers ──
// // //   final TextEditingController _searchController = TextEditingController();
// // //   final TextEditingController _searchToolsController = TextEditingController();
// // //   final TextEditingController _searchFavoritesController =
// // //       TextEditingController();

// // //   String _query = '';
// // //   String _queryTools = '';
// // //   String _queryFavorites = '';
// // //   String _selectedCategory = 'All';

// // //   // ── Favorites state ──
// // //   final Set<String> _favoriteToolTitles = {};

// // //   // ── History state ──
// // //   final List<HistoryEntry> _history = [];

// // //   late final AnimationController _fadeInController;
// // //   late final Animation<double> _fadeIn;

// // //   final List<String> _categories = [
// // //     'All',
// // //     'Media',
// // //     'PDF',
// // //     'Calculators',
// // //     'Scanning',
// // //   ];

// // //   @override
// // //   void initState() {
// // //     super.initState();

// // //     _fadeInController = AnimationController(
// // //       vsync: this,
// // //       duration: const Duration(milliseconds: 520),
// // //     );
// // //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // //       _fadeInController.forward();
// // //     });

// // //     _searchController.addListener(() {
// // //       setState(() {
// // //         _query = _searchController.text.toLowerCase().trim();
// // //       });
// // //     });
// // //     _searchToolsController.addListener(() {
// // //       setState(() {
// // //         _queryTools = _searchToolsController.text.toLowerCase().trim();
// // //       });
// // //     });
// // //     _searchFavoritesController.addListener(() {
// // //       setState(() {
// // //         _queryFavorites = _searchFavoritesController.text.toLowerCase().trim();
// // //       });
// // //     });

// // //     // Listen to page changes to update AppBar actions
// // //     _pageController.addListener(() {
// // //       if (_pageController.page != null) {
// // //         final page = _pageController.page!.round();
// // //         if (page != _currentPage) {
// // //           setState(() {
// // //             _currentPage = page;
// // //           });
// // //         }
// // //       }
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _fadeInController.dispose();
// // //     _searchController.dispose();
// // //     _searchToolsController.dispose();
// // //     _searchFavoritesController.dispose();
// // //     _pageController.dispose();
// // //     super.dispose();
// // //   }

// // //   void _toggleFavorite(String title) {
// // //     setState(() {
// // //       if (_favoriteToolTitles.contains(title)) {
// // //         _favoriteToolTitles.remove(title);
// // //       } else {
// // //         _favoriteToolTitles.add(title);
// // //       }
// // //     });
// // //   }

// // //   void _logHistory(String toolTitle) {
// // //     setState(() {
// // //       _history.insert(0, HistoryEntry(toolTitle, DateTime.now()));
// // //     });
// // //   }

// // //   void _clearHistory() {
// // //     setState(() {
// // //       _history.clear();
// // //     });
// // //   }

// // //   // ── Tool data ──
// // //   List<_ToolItem> _tools(BuildContext context) {
// // //     final colorScheme = Theme.of(context).colorScheme;
// // //     return [
// // //       _ToolItem(
// // //         title: 'QR Code Generator',
// // //         subtitle: 'Create modern QR codes',
// // //         icon: Icons.qr_code_rounded,
// // //         color: colorScheme.primary,
// // //         category: 'Scanning',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'Barcode Generator',
// // //         subtitle: 'Generate barcodes instantly',
// // //         icon: Icons.document_scanner,
// // //         color: Colors.teal,
// // //         category: 'Scanning',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'Image Compressor',
// // //         subtitle: 'Reduce image size fast',
// // //         icon: Icons.compress_rounded,
// // //         color: Colors.green,
// // //         category: 'Media',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const ImageCompressorScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'Age Calculator',
// // //         subtitle: 'Calculate exact age',
// // //         icon: Icons.cake_rounded,
// // //         color: Colors.orange,
// // //         category: 'Calculators',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const AgeCalculatorScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'BMI Calculator',
// // //         subtitle: 'Track your body mass index',
// // //         icon: Icons.monitor_weight_rounded,
// // //         color: Colors.cyan,
// // //         category: 'Calculators',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const BmiCalculatorScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'Unit Converter',
// // //         subtitle: 'Convert units quickly',
// // //         icon: Icons.swap_horiz_rounded,
// // //         color: Colors.indigo,
// // //         category: 'Calculators',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const UnitConverterScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'PDF Merge',
// // //         subtitle: 'Join multiple PDFs',
// // //         icon: Icons.picture_as_pdf_rounded,
// // //         color: Colors.redAccent,
// // //         category: 'PDF',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const PdfMergeScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'PDF Split',
// // //         subtitle: 'Split PDF pages',
// // //         icon: Icons.call_split_rounded,
// // //         color: Colors.pink,
// // //         category: 'PDF',
// // //         implemented: true,
// // //         onTap: () =>
// // //             Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
// // //       ),
// // //       _ToolItem(
// // //         title: 'Image to PDF',
// // //         subtitle: 'Convert images to PDF',
// // //         icon: Icons.insert_drive_file_rounded,
// // //         color: Colors.brown,
// // //         category: 'Media',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const ImageToPdfScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'Image Converter',
// // //         subtitle: 'Change image formats',
// // //         icon: Icons.image_rounded,
// // //         color: Colors.deepOrange,
// // //         category: 'Media',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const ImageConverterScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'Image Resizer',
// // //         subtitle: 'Resize images precisely',
// // //         icon: Icons.photo_size_select_large_rounded,
// // //         color: Colors.blue,
// // //         category: 'Media',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const ImageResizerScreen()),
// // //         ),
// // //       ),
// // //       _ToolItem(
// // //         title: 'QR / Barcode Scanner',
// // //         subtitle: 'Scan codes with camera',
// // //         icon: Icons.document_scanner_rounded,
// // //         color: Colors.deepPurple,
// // //         category: 'Scanning',
// // //         implemented: true,
// // //         onTap: () => Navigator.push(
// // //           context,
// // //           AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
// // //         ),
// // //       ),
// // //     ];
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final themeService = context.watch<ThemeService>();
// // //     final colorScheme = Theme.of(context).colorScheme;

// // //     final allTools = _tools(context);

// // //     // ── Home filtered tools ──
// // //     final homeFiltered = allTools.where((tool) {
// // //       final matchesQuery =
// // //           _query.isEmpty ||
// // //           tool.title.toLowerCase().contains(_query) ||
// // //           tool.subtitle.toLowerCase().contains(_query) ||
// // //           tool.category.toLowerCase().contains(_query);
// // //       final matchesCategory =
// // //           _selectedCategory == 'All' || tool.category == _selectedCategory;
// // //       return matchesQuery && matchesCategory;
// // //     }).toList();

// // //     // ── Tools tab filtered ──
// // //     final toolsFiltered = allTools.where((tool) {
// // //       return _queryTools.isEmpty ||
// // //           tool.title.toLowerCase().contains(_queryTools) ||
// // //           tool.subtitle.toLowerCase().contains(_queryTools);
// // //     }).toList();

// // //     // ── Favorites tab filtered ──
// // //     final favoriteTools = allTools
// // //         .where((tool) => _favoriteToolTitles.contains(tool.title))
// // //         .toList();
// // //     final favoritesFiltered = favoriteTools.where((tool) {
// // //       return _queryFavorites.isEmpty ||
// // //           tool.title.toLowerCase().contains(_queryFavorites) ||
// // //           tool.subtitle.toLowerCase().contains(_queryFavorites);
// // //     }).toList();

// // //     return FadeTransition(
// // //       opacity: _fadeIn,
// // //       child: Scaffold(
// // //         appBar: AppBar(
// // //           title: Row(
// // //             children: [
// // //               Icon(Icons.dashboard_rounded, color: colorScheme.primary),
// // //               const SizedBox(width: 8),
// // //               const Text('ToolKit Pro'),
// // //             ],
// // //           ),
// // //           actions: [
// // //             // ── Clear history button (only on History tab) ──
// // //             if (_currentPage == 3)
// // //               IconButton(
// // //                 onPressed: _history.isEmpty ? null : _clearHistory,
// // //                 icon: Icon(
// // //                   Icons.delete_sweep_rounded,
// // //                   color: _history.isEmpty ? Colors.grey : colorScheme.error,
// // //                 ),
// // //                 tooltip: 'Clear history',
// // //               ),
// // //             IconButton(
// // //               onPressed: themeService.toggleTheme,
// // //               icon: Icon(
// // //                 themeService.isDark
// // //                     ? Icons.light_mode_rounded
// // //                     : Icons.dark_mode_rounded,
// // //               ),
// // //             ),
// // //             IconButton(
// // //               onPressed: () {
// // //                 ScaffoldMessenger.of(context).showSnackBar(
// // //                   const SnackBar(
// // //                     content: Text('Settings coming soon!'),
// // //                     behavior: SnackBarBehavior.floating,
// // //                   ),
// // //                 );
// // //               },
// // //               icon: const Icon(Icons.settings_rounded),
// // //             ),
// // //           ],
// // //           elevation: 0,
// // //           backgroundColor: colorScheme.surface,
// // //           foregroundColor: colorScheme.onSurface,
// // //         ),
// // //         body: PageView(
// // //           controller: _pageController,
// // //           children: [
// // //             HomeTab(
// // //               filteredTools: homeFiltered,
// // //               categories: _categories,
// // //               selectedCategory: _selectedCategory,
// // //               onCategorySelected: (category) {
// // //                 setState(() {
// // //                   _selectedCategory = category;
// // //                 });
// // //               },
// // //               searchController: _searchController,
// // //               query: _query,
// // //               favoriteTitles: _favoriteToolTitles,
// // //               onToggleFavorite: _toggleFavorite,
// // //               onToolTap: (tool) {
// // //                 _logHistory(tool.title);
// // //                 tool.onTap?.call();
// // //               },
// // //             ),
// // //             ToolsTab(
// // //               filteredTools: toolsFiltered,
// // //               searchController: _searchToolsController,
// // //               query: _queryTools,
// // //               favoriteTitles: _favoriteToolTitles,
// // //               onToggleFavorite: _toggleFavorite,
// // //               onToolTap: (tool) {
// // //                 _logHistory(tool.title);
// // //                 tool.onTap?.call();
// // //               },
// // //             ),
// // //             FavoritesTab(
// // //               filteredFavorites: favoritesFiltered,
// // //               searchController: _searchFavoritesController,
// // //               query: _queryFavorites,
// // //               favoriteTitles: _favoriteToolTitles,
// // //               onToggleFavorite: _toggleFavorite,
// // //               onToolTap: (tool) {
// // //                 _logHistory(tool.title);
// // //                 tool.onTap?.call();
// // //               },
// // //             ),
// // //             HistoryTab(
// // //               history: _history,
// // //               onDeleteEntry: (index) {
// // //                 setState(() {
// // //                   _history.removeAt(index);
// // //                 });
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //         extendBody: true,
// // //         bottomNavigationBar: RollingBottomBar(
// // //           controller: _pageController,
// // //           items: const [
// // //             RollingBottomBarItem(Icons.home_rounded, label: 'Home'),
// // //             RollingBottomBarItem(Icons.grid_view_rounded, label: 'Tools'),
// // //             RollingBottomBarItem(Icons.favorite_rounded, label: 'Favorites'),
// // //             RollingBottomBarItem(Icons.history_rounded, label: 'History'),
// // //           ],
// // //           activeItemColor: colorScheme.primary,
// // //           enableIconRotation: true,
// // //           flat: false,
// // //           onTap: (index) {
// // //             _pageController.animateToPage(
// // //               index,
// // //               duration: const Duration(milliseconds: 400),
// // //               curve: Curves.easeOut,
// // //             );
// // //           },
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // ─────────────────────────────────────────────────────────────────────────────
// // // // Tab Widgets (each with AutomaticKeepAliveClientMixin)
// // // // ─────────────────────────────────────────────────────────────────────────────

// // // // ─── Home Tab ──────────────────────────────────────────────────────
// // // class HomeTab extends StatefulWidget {
// // //   final List<_ToolItem> filteredTools;
// // //   final List<String> categories;
// // //   final String selectedCategory;
// // //   final ValueChanged<String> onCategorySelected;
// // //   final TextEditingController searchController;
// // //   final String query;
// // //   final Set<String> favoriteTitles;
// // //   final ValueChanged<String> onToggleFavorite;
// // //   final ValueChanged<_ToolItem> onToolTap;

// // //   const HomeTab({
// // //     super.key,
// // //     required this.filteredTools,
// // //     required this.categories,
// // //     required this.selectedCategory,
// // //     required this.onCategorySelected,
// // //     required this.searchController,
// // //     required this.query,
// // //     required this.favoriteTitles,
// // //     required this.onToggleFavorite,
// // //     required this.onToolTap,
// // //   });

// // //   @override
// // //   State<HomeTab> createState() => _HomeTabState();
// // // }

// // // class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
// // //   @override
// // //   bool get wantKeepAlive => true;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     super.build(context);
// // //     final colorScheme = Theme.of(context).colorScheme;

// // //     return GestureDetector(
// // //       onTap: () => FocusScope.of(context).unfocus(),
// // //       behavior: HitTestBehavior.opaque,
// // //       child: SafeArea(
// // //         child: CustomScrollView(
// // //           slivers: [
// // //             SliverToBoxAdapter(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Text(
// // //                       'Welcome back!',
// // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // //                         fontWeight: FontWeight.w800,
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 4),
// // //                     Text(
// // //                       'Fast utilities, clean workflow, pro interface.',
// // //                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
// // //                         color: colorScheme.onSurfaceVariant,
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 18),
// // //                     Container(
// // //                       width: double.infinity,
// // //                       padding: const EdgeInsets.all(18),
// // //                       decoration: BoxDecoration(
// // //                         borderRadius: BorderRadius.circular(26),
// // //                         gradient: LinearGradient(
// // //                           begin: Alignment.topLeft,
// // //                           end: Alignment.bottomRight,
// // //                           colors: [
// // //                             colorScheme.primaryContainer,
// // //                             colorScheme.tertiaryContainer,
// // //                           ],
// // //                         ),
// // //                       ),
// // //                       child: Row(
// // //                         children: [
// // //                           Expanded(
// // //                             child: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 Text(
// // //                                   'Professional workspace',
// // //                                   style: Theme.of(context).textTheme.titleLarge
// // //                                       ?.copyWith(fontWeight: FontWeight.w800),
// // //                                 ),
// // //                                 const SizedBox(height: 8),
// // //                                 Text(
// // //                                   'Search, launch, and manage your tools from one premium dashboard.',
// // //                                   style: Theme.of(context).textTheme.bodyMedium,
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                           const SizedBox(width: 12),
// // //                           Container(
// // //                             width: 66,
// // //                             height: 66,
// // //                             decoration: BoxDecoration(
// // //                               color: colorScheme.surface.withOpacity(0.35),
// // //                               borderRadius: BorderRadius.circular(20),
// // //                             ),
// // //                             child: Icon(
// // //                               Icons.auto_awesome_rounded,
// // //                               size: 34,
// // //                               color: colorScheme.onPrimaryContainer,
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 18),
// // //                     SearchBar(
// // //                       controller: widget.searchController,
// // //                       hintText: 'Search tools, calculators, PDFs...',
// // //                       leading: const Icon(Icons.search_rounded),
// // //                       trailing: const [Icon(Icons.tune_rounded)],
// // //                       elevation: const WidgetStatePropertyAll(0),
// // //                       backgroundColor: WidgetStatePropertyAll(
// // //                         colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // //                       ),
// // //                       padding: const WidgetStatePropertyAll(
// // //                         EdgeInsets.symmetric(horizontal: 18),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //             SliverToBoxAdapter(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // //                 child: SizedBox(
// // //                   height: 42,
// // //                   child: ListView.separated(
// // //                     scrollDirection: Axis.horizontal,
// // //                     itemCount: widget.categories.length,
// // //                     separatorBuilder: (_, __) => const SizedBox(width: 10),
// // //                     itemBuilder: (context, index) {
// // //                       final category = widget.categories[index];
// // //                       final selected = category == widget.selectedCategory;
// // //                       return AnimatedScale(
// // //                         scale: selected ? 1.05 : 1.0,
// // //                         duration: const Duration(milliseconds: 180),
// // //                         curve: Curves.easeOutCubic,
// // //                         child: ChoiceChip(
// // //                           label: Text(category),
// // //                           selected: selected,
// // //                           onSelected: (_) {
// // //                             widget.onCategorySelected(category);
// // //                           },
// // //                         ),
// // //                       );
// // //                     },
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             SliverToBoxAdapter(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// // //                 child: Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Text(
// // //                       'Featured tools',
// // //                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
// // //                         fontWeight: FontWeight.w800,
// // //                       ),
// // //                     ),
// // //                     AnimatedSwitcher(
// // //                       duration: const Duration(milliseconds: 220),
// // //                       child: Text(
// // //                         '${widget.filteredTools.length} shown',
// // //                         key: ValueKey(widget.filteredTools.length),
// // //                         style: TextStyle(
// // //                           color: colorScheme.primary,
// // //                           fontWeight: FontWeight.w700,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //             if (widget.filteredTools.isEmpty)
// // //               SliverFillRemaining(
// // //                 hasScrollBody: false,
// // //                 child: _EmptyState(
// // //                   query: widget.query,
// // //                   category: widget.selectedCategory,
// // //                 ),
// // //               )
// // //             else
// // //               SliverPadding(
// // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // //                 sliver: SliverGrid(
// // //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //                     crossAxisCount: 2,
// // //                     mainAxisSpacing: 14,
// // //                     crossAxisSpacing: 14,
// // //                     childAspectRatio: 0.82,
// // //                   ),
// // //                   delegate: SliverChildBuilderDelegate((context, index) {
// // //                     final tool = widget.filteredTools[index];
// // //                     return _StaggeredToolCard(
// // //                       tool: tool,
// // //                       index: index,
// // //                       isFavorite: widget.favoriteTitles.contains(tool.title),
// // //                       onToggleFavorite: () =>
// // //                           widget.onToggleFavorite(tool.title),
// // //                       onToolTap: () => widget.onToolTap(tool),
// // //                     );
// // //                   }, childCount: widget.filteredTools.length),
// // //                 ),
// // //               ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // ─── Tools Tab ─────────────────────────────────────────────────────
// // // class ToolsTab extends StatefulWidget {
// // //   final List<_ToolItem> filteredTools;
// // //   final TextEditingController searchController;
// // //   final String query;
// // //   final Set<String> favoriteTitles;
// // //   final ValueChanged<String> onToggleFavorite;
// // //   final ValueChanged<_ToolItem> onToolTap;

// // //   const ToolsTab({
// // //     super.key,
// // //     required this.filteredTools,
// // //     required this.searchController,
// // //     required this.query,
// // //     required this.favoriteTitles,
// // //     required this.onToggleFavorite,
// // //     required this.onToolTap,
// // //   });

// // //   @override
// // //   State<ToolsTab> createState() => _ToolsTabState();
// // // }

// // // class _ToolsTabState extends State<ToolsTab>
// // //     with AutomaticKeepAliveClientMixin {
// // //   @override
// // //   bool get wantKeepAlive => true;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     super.build(context);
// // //     final colorScheme = Theme.of(context).colorScheme;

// // //     return GestureDetector(
// // //       onTap: () => FocusScope.of(context).unfocus(),
// // //       behavior: HitTestBehavior.opaque,
// // //       child: SafeArea(
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // //               child: SearchBar(
// // //                 controller: widget.searchController,
// // //                 hintText: 'Search all tools...',
// // //                 leading: const Icon(Icons.search_rounded),
// // //                 elevation: const WidgetStatePropertyAll(0),
// // //                 backgroundColor: WidgetStatePropertyAll(
// // //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // //                 ),
// // //                 padding: const WidgetStatePropertyAll(
// // //                   EdgeInsets.symmetric(horizontal: 18),
// // //                 ),
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // //                 child: widget.filteredTools.isEmpty
// // //                     ? _EmptyState(query: widget.query, category: 'All Tools')
// // //                     : GridView.builder(
// // //                         gridDelegate:
// // //                             const SliverGridDelegateWithFixedCrossAxisCount(
// // //                               crossAxisCount: 2,
// // //                               mainAxisSpacing: 14,
// // //                               crossAxisSpacing: 14,
// // //                               childAspectRatio: 0.82,
// // //                             ),
// // //                         itemCount: widget.filteredTools.length,
// // //                         itemBuilder: (context, index) {
// // //                           final tool = widget.filteredTools[index];
// // //                           return _StaggeredToolCard(
// // //                             tool: tool,
// // //                             index: index,
// // //                             isFavorite: widget.favoriteTitles.contains(
// // //                               tool.title,
// // //                             ),
// // //                             onToggleFavorite: () =>
// // //                                 widget.onToggleFavorite(tool.title),
// // //                             onToolTap: () => widget.onToolTap(tool),
// // //                           );
// // //                         },
// // //                       ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // ─── Favorites Tab ─────────────────────────────────────────────────
// // // class FavoritesTab extends StatefulWidget {
// // //   final List<_ToolItem> filteredFavorites;
// // //   final TextEditingController searchController;
// // //   final String query;
// // //   final Set<String> favoriteTitles;
// // //   final ValueChanged<String> onToggleFavorite;
// // //   final ValueChanged<_ToolItem> onToolTap;

// // //   const FavoritesTab({
// // //     super.key,
// // //     required this.filteredFavorites,
// // //     required this.searchController,
// // //     required this.query,
// // //     required this.favoriteTitles,
// // //     required this.onToggleFavorite,
// // //     required this.onToolTap,
// // //   });

// // //   @override
// // //   State<FavoritesTab> createState() => _FavoritesTabState();
// // // }

// // // class _FavoritesTabState extends State<FavoritesTab>
// // //     with AutomaticKeepAliveClientMixin {
// // //   @override
// // //   bool get wantKeepAlive => true;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     super.build(context);
// // //     final colorScheme = Theme.of(context).colorScheme;

// // //     return GestureDetector(
// // //       onTap: () => FocusScope.of(context).unfocus(),
// // //       behavior: HitTestBehavior.opaque,
// // //       child: SafeArea(
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// // //               child: SearchBar(
// // //                 controller: widget.searchController,
// // //                 hintText: 'Search favorites...',
// // //                 leading: const Icon(Icons.search_rounded),
// // //                 elevation: const WidgetStatePropertyAll(0),
// // //                 backgroundColor: WidgetStatePropertyAll(
// // //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// // //                 ),
// // //                 padding: const WidgetStatePropertyAll(
// // //                   EdgeInsets.symmetric(horizontal: 18),
// // //                 ),
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// // //                 child: widget.filteredFavorites.isEmpty
// // //                     ? const _EmptyFavoritesState()
// // //                     : GridView.builder(
// // //                         gridDelegate:
// // //                             const SliverGridDelegateWithFixedCrossAxisCount(
// // //                               crossAxisCount: 2,
// // //                               mainAxisSpacing: 14,
// // //                               crossAxisSpacing: 14,
// // //                               childAspectRatio: 0.82,
// // //                             ),
// // //                         itemCount: widget.filteredFavorites.length,
// // //                         itemBuilder: (context, index) {
// // //                           final tool = widget.filteredFavorites[index];
// // //                           return _StaggeredToolCard(
// // //                             tool: tool,
// // //                             index: index,
// // //                             isFavorite: true,
// // //                             onToggleFavorite: () =>
// // //                                 widget.onToggleFavorite(tool.title),
// // //                             onToolTap: () => widget.onToolTap(tool),
// // //                           );
// // //                         },
// // //                       ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // ─── History Tab ──────────────────────────────────────────────────
// // // class HistoryTab extends StatefulWidget {
// // //   final List<HistoryEntry> history;
// // //   final ValueChanged<int> onDeleteEntry;

// // //   const HistoryTab({
// // //     super.key,
// // //     required this.history,
// // //     required this.onDeleteEntry,
// // //   });

// // //   @override
// // //   State<HistoryTab> createState() => _HistoryTabState();
// // // }

// // // class _HistoryTabState extends State<HistoryTab>
// // //     with AutomaticKeepAliveClientMixin {
// // //   @override
// // //   bool get wantKeepAlive => true;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     super.build(context);
// // //     final colorScheme = Theme.of(context).colorScheme;

// // //     return SafeArea(
// // //       child: widget.history.isEmpty
// // //           ? const _EmptyHistoryState()
// // //           : ListView.builder(
// // //               padding: const EdgeInsets.all(16),
// // //               itemCount: widget.history.length,
// // //               itemBuilder: (context, index) {
// // //                 final entry = widget.history[index];
// // //                 return Card(
// // //                   margin: const EdgeInsets.only(bottom: 10),
// // //                   elevation: 1,
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(14),
// // //                   ),
// // //                   child: ListTile(
// // //                     leading: CircleAvatar(
// // //                       backgroundColor: colorScheme.primaryContainer,
// // //                       child: Icon(
// // //                         Icons.history_rounded,
// // //                         color: colorScheme.primary,
// // //                       ),
// // //                     ),
// // //                     title: Text(
// // //                       entry.toolTitle,
// // //                       style: const TextStyle(
// // //                         fontWeight: FontWeight.w700,
// // //                         fontSize: 16,
// // //                       ),
// // //                     ),
// // //                     subtitle: Text(entry.formattedDateTime),
// // //                     trailing: IconButton(
// // //                       icon: Icon(
// // //                         Icons.delete_outline_rounded,
// // //                         color: colorScheme.error.withOpacity(0.6),
// // //                       ),
// // //                       onPressed: () => widget.onDeleteEntry(index),
// // //                       tooltip: 'Remove from history',
// // //                     ),
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //     );
// // //   }
// // // }

// // // // ─────────────────────────────────────────────────────────────────────────────
// // // // Reusable UI Components
// // // // ─────────────────────────────────────────────────────────────────────────────

// // // // ─── Staggered Tool Card ──────────────────────────────────────────
// // // class _StaggeredToolCard extends StatefulWidget {
// // //   final _ToolItem tool;
// // //   final int index;
// // //   final bool isFavorite;
// // //   final VoidCallback onToggleFavorite;
// // //   final VoidCallback onToolTap;

// // //   const _StaggeredToolCard({
// // //     required this.tool,
// // //     required this.index,
// // //     required this.isFavorite,
// // //     required this.onToggleFavorite,
// // //     required this.onToolTap,
// // //   });

// // //   @override
// // //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // // }

// // // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// // //     with SingleTickerProviderStateMixin {
// // //   late final AnimationController _ctrl;
// // //   late final Animation<double> _fade;
// // //   late final Animation<Offset> _slide;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _ctrl = AnimationController(
// // //       vsync: this,
// // //       duration: const Duration(milliseconds: 420),
// // //     );
// // //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// // //     _slide = Tween<Offset>(
// // //       begin: const Offset(0, 0.08),
// // //       end: Offset.zero,
// // //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// // //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// // //     Future.delayed(delay, () {
// // //       if (mounted) _ctrl.forward();
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _ctrl.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return FadeTransition(
// // //       opacity: _fade,
// // //       child: SlideTransition(
// // //         position: _slide,
// // //         child: _ToolCard(
// // //           tool: widget.tool,
// // //           isFavorite: widget.isFavorite,
// // //           onToggleFavorite: widget.onToggleFavorite,
// // //           onToolTap: widget.onToolTap,
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // ─── Tool Card ────────────────────────────────────────────────────
// // // class _ToolCard extends StatefulWidget {
// // //   final _ToolItem tool;
// // //   final bool isFavorite;
// // //   final VoidCallback onToggleFavorite;
// // //   final VoidCallback onToolTap;

// // //   const _ToolCard({
// // //     required this.tool,
// // //     required this.isFavorite,
// // //     required this.onToggleFavorite,
// // //     required this.onToolTap,
// // //   });

// // //   @override
// // //   State<_ToolCard> createState() => _ToolCardState();
// // // }

// // // class _ToolCardState extends State<_ToolCard>
// // //     with SingleTickerProviderStateMixin {
// // //   late final AnimationController _pressCtrl;
// // //   late final Animation<double> _pressScale;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _pressCtrl = AnimationController(
// // //       vsync: this,
// // //       duration: const Duration(milliseconds: 100),
// // //       reverseDuration: const Duration(milliseconds: 200),
// // //       lowerBound: 0.0,
// // //       upperBound: 1.0,
// // //     );
// // //     _pressScale = Tween<double>(
// // //       begin: 1.0,
// // //       end: 0.95,
// // //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _pressCtrl.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final colorScheme = Theme.of(context).colorScheme;
// // //     final tool = widget.tool;

// // //     return ScaleTransition(
// // //       scale: _pressScale,
// // //       child: GestureDetector(
// // //         onTapDown: (_) => _pressCtrl.forward(),
// // //         onTapUp: (_) => _pressCtrl.reverse(),
// // //         onTapCancel: () => _pressCtrl.reverse(),
// // //         onTap: tool.implemented
// // //             ? widget.onToolTap
// // //             : () {
// // //                 ScaffoldMessenger.of(context).showSnackBar(
// // //                   SnackBar(
// // //                     content: Text('${tool.title} is coming soon.'),
// // //                     behavior: SnackBarBehavior.floating,
// // //                   ),
// // //                 );
// // //               },
// // //         child: Container(
// // //           decoration: BoxDecoration(
// // //             color: colorScheme.surface,
// // //             borderRadius: BorderRadius.circular(24),
// // //             border: Border.all(
// // //               color: colorScheme.outlineVariant.withOpacity(0.25),
// // //             ),
// // //             boxShadow: [
// // //               BoxShadow(
// // //                 color: Colors.black.withOpacity(0.05),
// // //                 blurRadius: 20,
// // //                 offset: const Offset(0, 10),
// // //               ),
// // //             ],
// // //           ),
// // //           child: Stack(
// // //             children: [
// // //               // "Live / Soon" tag
// // //               Positioned(
// // //                 top: 14,
// // //                 right: 14,
// // //                 child: Container(
// // //                   padding: const EdgeInsets.symmetric(
// // //                     horizontal: 9,
// // //                     vertical: 4,
// // //                   ),
// // //                   decoration: BoxDecoration(
// // //                     color: tool.implemented
// // //                         ? tool.color.withOpacity(0.12)
// // //                         : Colors.grey.withOpacity(0.12),
// // //                     borderRadius: BorderRadius.circular(999),
// // //                   ),
// // //                   child: Text(
// // //                     tool.implemented ? 'Live' : 'Soon',
// // //                     style: TextStyle(
// // //                       fontSize: 10,
// // //                       fontWeight: FontWeight.w800,
// // //                       color: tool.implemented ? tool.color : Colors.grey,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //               // Star button (below the tag)
// // //               Positioned(
// // //                 top: 48,
// // //                 right: 14,
// // //                 child: GestureDetector(
// // //                   onTap: widget.onToggleFavorite,
// // //                   child: Container(
// // //                     padding: const EdgeInsets.all(4),
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.black.withOpacity(0.06),
// // //                       shape: BoxShape.circle,
// // //                     ),
// // //                     child: Icon(
// // //                       widget.isFavorite
// // //                           ? Icons.star_rounded
// // //                           : Icons.star_border_rounded,
// // //                       color: widget.isFavorite ? Colors.amber : Colors.grey,
// // //                       size: 26,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //               // Card content
// // //               Padding(
// // //                 padding: const EdgeInsets.all(16),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Hero(
// // //                       tag: 'tool-icon-${tool.title}',
// // //                       child: Container(
// // //                         width: 56,
// // //                         height: 56,
// // //                         decoration: BoxDecoration(
// // //                           gradient: LinearGradient(
// // //                             colors: [
// // //                               tool.color.withOpacity(0.95),
// // //                               tool.color.withOpacity(0.55),
// // //                             ],
// // //                           ),
// // //                           borderRadius: BorderRadius.circular(18),
// // //                         ),
// // //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// // //                       ),
// // //                     ),
// // //                     Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         Text(
// // //                           tool.title,
// // //                           style: const TextStyle(
// // //                             fontSize: 15,
// // //                             fontWeight: FontWeight.w800,
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 6),
// // //                         Text(
// // //                           tool.subtitle,
// // //                           maxLines: 2,
// // //                           style: TextStyle(
// // //                             color: colorScheme.onSurfaceVariant,
// // //                             fontSize: 12.5,
// // //                             height: 1.25,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // ─── Empty States ─────────────────────────────────────────────────
// // // class _EmptyState extends StatelessWidget {
// // //   final String query;
// // //   final String category;

// // //   const _EmptyState({required this.query, required this.category});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final colorScheme = Theme.of(context).colorScheme;

// // //     return Center(
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(24),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Container(
// // //               width: 94,
// // //               height: 94,
// // //               decoration: BoxDecoration(
// // //                 color: colorScheme.primaryContainer,
// // //                 borderRadius: BorderRadius.circular(28),
// // //               ),
// // //               child: Icon(
// // //                 Icons.search_off_rounded,
// // //                 size: 44,
// // //                 color: colorScheme.onPrimaryContainer,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 18),
// // //             Text(
// // //               'No matching tools',
// // //               style: Theme.of(
// // //                 context,
// // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // //             ),
// // //             const SizedBox(height: 8),
// // //             Text(
// // //               query.isEmpty
// // //                   ? 'No tools found in $category.'
// // //                   : 'Nothing matches "$query". Try another keyword or category.',
// // //               textAlign: TextAlign.center,
// // //               style: TextStyle(
// // //                 color: colorScheme.onSurfaceVariant,
// // //                 height: 1.4,
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _EmptyFavoritesState extends StatelessWidget {
// // //   const _EmptyFavoritesState();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final colorScheme = Theme.of(context).colorScheme;

// // //     return Center(
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(24),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Container(
// // //               width: 94,
// // //               height: 94,
// // //               decoration: BoxDecoration(
// // //                 color: colorScheme.primaryContainer,
// // //                 borderRadius: BorderRadius.circular(28),
// // //               ),
// // //               child: Icon(
// // //                 Icons.favorite_border_rounded,
// // //                 size: 44,
// // //                 color: colorScheme.onPrimaryContainer,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 18),
// // //             Text(
// // //               'No favorites yet',
// // //               style: Theme.of(
// // //                 context,
// // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // //             ),
// // //             const SizedBox(height: 8),
// // //             Text(
// // //               'Tap the star on any tool card to add it to your favorites.',
// // //               textAlign: TextAlign.center,
// // //               style: TextStyle(
// // //                 color: colorScheme.onSurfaceVariant,
// // //                 height: 1.4,
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _EmptyHistoryState extends StatelessWidget {
// // //   const _EmptyHistoryState();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final colorScheme = Theme.of(context).colorScheme;

// // //     return Center(
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(24),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Container(
// // //               width: 94,
// // //               height: 94,
// // //               decoration: BoxDecoration(
// // //                 color: colorScheme.primaryContainer,
// // //                 borderRadius: BorderRadius.circular(28),
// // //               ),
// // //               child: Icon(
// // //                 Icons.history,
// // //                 size: 44,
// // //                 color: colorScheme.onPrimaryContainer,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 18),
// // //             Text(
// // //               'No history yet',
// // //               style: Theme.of(
// // //                 context,
// // //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// // //             ),
// // //             const SizedBox(height: 8),
// // //             Text(
// // //               'Your recently used tools will appear here.',
// // //               textAlign: TextAlign.center,
// // //               style: TextStyle(
// // //                 color: colorScheme.onSurfaceVariant,
// // //                 height: 1.4,
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // ─── Data model ───────────────────────────────────────────────────
// // // class _ToolItem {
// // //   final String title;
// // //   final String subtitle;
// // //   final IconData icon;
// // //   final Color color;
// // //   final String category;
// // //   final bool implemented;
// // //   final VoidCallback? onTap;

// // //   const _ToolItem({
// // //     required this.title,
// // //     required this.subtitle,
// // //     required this.icon,
// // //     required this.color,
// // //     required this.category,
// // //     required this.implemented,
// // //     this.onTap,
// // //   });
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
// // import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

// // import '../services/theme_service.dart';
// // import '../utils/app_transitions.dart';
// // import '../features/qr_code_generator/qr_code_generator_screen.dart';
// // import '../features/barcode_generator/barcode_generator_screen.dart';
// // import '../features/age_calculator/age_calculator_screen.dart';
// // import '../features/bmi_calculator/bmi_calculator_screen.dart';
// // import '../features/unit_converter/unit_converter_screen.dart';
// // import '../features/image_resizer/image_resizer_screen.dart';
// // import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// // import '../features/pdf_split/pdf_split.dart';
// // import '../features/image_compressor/image_compressor_screen.dart';
// // import '../features/pdf_merge/pdf_merge_screen.dart';
// // import '../features/image_to_pdf/image_to_pdf_screen.dart';
// // import '../features/image_converter/image_converter_screen.dart';
// // import '../features/pdf_compress/pdf_compress_screen.dart';

// // // ─── History entry model ──────────────────────────────────────────
// // class HistoryEntry {
// //   final String toolTitle;
// //   final DateTime timestamp;

// //   HistoryEntry(this.toolTitle, this.timestamp);

// //   String get formattedDateTime =>
// //       '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
// // }

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen>
// //     with SingleTickerProviderStateMixin {
// //   // ── Page controller for RollingBottomBar ──
// //   final PageController _pageController = PageController();
// //   int _currentPage = 0;

// //   // ── Search controllers ──
// //   final TextEditingController _searchController = TextEditingController();
// //   final TextEditingController _searchToolsController = TextEditingController();
// //   final TextEditingController _searchFavoritesController =
// //       TextEditingController();

// //   String _query = '';
// //   String _queryTools = '';
// //   String _queryFavorites = '';
// //   String _selectedCategory = 'All';

// //   // ── Favorites state ──
// //   final Set<String> _favoriteToolTitles = {};

// //   // ── History state ──
// //   final List<HistoryEntry> _history = [];

// //   // ── Animation for page appearance (unchanged) ──
// //   late final AnimationController _fadeInController;
// //   late final Animation<double> _fadeIn;

// //   final List<String> _categories = [
// //     'All',
// //     'Media',
// //     'PDF',
// //     'Calculators',
// //     'Scanning',
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();

// //     _fadeInController = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 520),
// //     );
// //     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       _fadeInController.forward();
// //     });

// //     _searchController.addListener(() {
// //       setState(() {
// //         _query = _searchController.text.toLowerCase().trim();
// //       });
// //     });
// //     _searchToolsController.addListener(() {
// //       setState(() {
// //         _queryTools = _searchToolsController.text.toLowerCase().trim();
// //       });
// //     });
// //     _searchFavoritesController.addListener(() {
// //       setState(() {
// //         _queryFavorites = _searchFavoritesController.text.toLowerCase().trim();
// //       });
// //     });

// //     _pageController.addListener(() {
// //       if (_pageController.page != null) {
// //         final page = _pageController.page!.round();
// //         if (page != _currentPage) {
// //           setState(() {
// //             _currentPage = page;
// //           });
// //         }
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _fadeInController.dispose();
// //     _searchController.dispose();
// //     _searchToolsController.dispose();
// //     _searchFavoritesController.dispose();
// //     _pageController.dispose();
// //     super.dispose();
// //   }

// //   void _toggleFavorite(String title) {
// //     setState(() {
// //       if (_favoriteToolTitles.contains(title)) {
// //         _favoriteToolTitles.remove(title);
// //       } else {
// //         _favoriteToolTitles.add(title);
// //       }
// //     });
// //   }

// //   void _logHistory(String toolTitle) {
// //     setState(() {
// //       _history.insert(0, HistoryEntry(toolTitle, DateTime.now()));
// //     });
// //   }

// //   void _clearHistory() {
// //     setState(() {
// //       _history.clear();
// //     });
// //   }

// //   // ── Tool data (unchanged) ──
// //   List<_ToolItem> _tools(BuildContext context) {
// //     final colorScheme = Theme.of(context).colorScheme;
// //     return [
// //       _ToolItem(
// //         title: 'QR Code Generator',
// //         subtitle: 'Create modern QR codes',
// //         icon: Icons.qr_code_rounded,
// //         color: colorScheme.primary,
// //         category: 'Scanning',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'Barcode Generator',
// //         subtitle: 'Generate barcodes instantly',
// //         icon: Icons.document_scanner,
// //         color: Colors.teal,
// //         category: 'Scanning',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'Image Compressor',
// //         subtitle: 'Reduce image size fast',
// //         icon: Icons.compress_rounded,
// //         color: Colors.green,
// //         category: 'Media',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const ImageCompressorScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'Age Calculator',
// //         subtitle: 'Calculate exact age',
// //         icon: Icons.cake_rounded,
// //         color: Colors.orange,
// //         category: 'Calculators',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const AgeCalculatorScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'BMI Calculator',
// //         subtitle: 'Track your body mass index',
// //         icon: Icons.monitor_weight_rounded,
// //         color: Colors.cyan,
// //         category: 'Calculators',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const BmiCalculatorScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'Unit Converter',
// //         subtitle: 'Convert units quickly',
// //         icon: Icons.swap_horiz_rounded,
// //         color: Colors.indigo,
// //         category: 'Calculators',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const UnitConverterScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'PDF Merge',
// //         subtitle: 'Join multiple PDFs',
// //         icon: Icons.picture_as_pdf_rounded,
// //         color: Colors.redAccent,
// //         category: 'PDF',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const PdfMergeScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'PDF Split',
// //         subtitle: 'Split PDF pages',
// //         icon: Icons.call_split_rounded,
// //         color: Colors.pink,
// //         category: 'PDF',
// //         implemented: true,
// //         onTap: () =>
// //             Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
// //       ),
// //       _ToolItem(
// //         title: 'Image to PDF',
// //         subtitle: 'Convert images to PDF',
// //         icon: Icons.insert_drive_file_rounded,
// //         color: Colors.brown,
// //         category: 'Media',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const ImageToPdfScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'Image Converter',
// //         subtitle: 'Change image formats',
// //         icon: Icons.image_rounded,
// //         color: Colors.deepOrange,
// //         category: 'Media',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const ImageConverterScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'Image Resizer',
// //         subtitle: 'Resize images precisely',
// //         icon: Icons.photo_size_select_large_rounded,
// //         color: Colors.blue,
// //         category: 'Media',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const ImageResizerScreen()),
// //         ),
// //       ),
// //       _ToolItem(
// //         title: 'QR / Barcode Scanner',
// //         subtitle: 'Scan codes with camera',
// //         icon: Icons.document_scanner_rounded,
// //         color: Colors.deepPurple,
// //         category: 'Scanning',
// //         implemented: true,
// //         onTap: () => Navigator.push(
// //           context,
// //           AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
// //         ),
// //       ),
// //     ];
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final themeService = context.watch<ThemeService>();
// //     final colorScheme = Theme.of(context).colorScheme;

// //     final allTools = _tools(context);

// //     // ── Filters (unchanged) ──
// //     final homeFiltered = allTools.where((tool) {
// //       final matchesQuery =
// //           _query.isEmpty ||
// //           tool.title.toLowerCase().contains(_query) ||
// //           tool.subtitle.toLowerCase().contains(_query) ||
// //           tool.category.toLowerCase().contains(_query);
// //       final matchesCategory =
// //           _selectedCategory == 'All' || tool.category == _selectedCategory;
// //       return matchesQuery && matchesCategory;
// //     }).toList();

// //     final toolsFiltered = allTools.where((tool) {
// //       return _queryTools.isEmpty ||
// //           tool.title.toLowerCase().contains(_queryTools) ||
// //           tool.subtitle.toLowerCase().contains(_queryTools);
// //     }).toList();

// //     final favoriteTools = allTools
// //         .where((tool) => _favoriteToolTitles.contains(tool.title))
// //         .toList();
// //     final favoritesFiltered = favoriteTools.where((tool) {
// //       return _queryFavorites.isEmpty ||
// //           tool.title.toLowerCase().contains(_queryFavorites) ||
// //           tool.subtitle.toLowerCase().contains(_queryFavorites);
// //     }).toList();

// //     return FadeTransition(
// //       opacity: _fadeIn,
// //       child: Scaffold(
// //         // ─── NestedScrollView with animated AppBar ──────────────────────
// //         body: NestedScrollView(
// //           headerSliverBuilder: (context, innerBoxIsScrolled) {
// //             return [
// //               SliverAppBar(
// //                 expandedHeight: 120.0,
// //                 floating: false,
// //                 pinned: true,
// //                 backgroundColor: colorScheme.surface,
// //                 foregroundColor: colorScheme.onSurface,
// //                 elevation: 0,
// //                 flexibleSpace: FlexibleSpaceBar(
// //                   title: Row(
// //                     children: [
// //                       Icon(Icons.dashboard_rounded, color: colorScheme.primary),
// //                       const SizedBox(width: 8),
// //                       const Text('ToolKit Pro'),
// //                     ],
// //                   ),
// //                   titlePadding: const EdgeInsets.only(left: 16, bottom: 8),
// //                   background: Container(
// //                     decoration: BoxDecoration(
// //                       gradient: LinearGradient(
// //                         begin: Alignment.topLeft,
// //                         end: Alignment.bottomRight,
// //                         colors: [
// //                           colorScheme.primaryContainer,
// //                           colorScheme.tertiaryContainer,
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 actions: [
// //                   // ── Clear history button (only on History tab) ──
// //                   if (_currentPage == 3)
// //                     IconButton(
// //                       onPressed: _history.isEmpty ? null : _clearHistory,
// //                       icon: Icon(
// //                         Icons.delete_sweep_rounded,
// //                         color: _history.isEmpty
// //                             ? Colors.grey
// //                             : colorScheme.error,
// //                       ),
// //                       tooltip: 'Clear history',
// //                     ),
// //                   IconButton(
// //                     onPressed: themeService.toggleTheme,
// //                     icon: Icon(
// //                       themeService.isDark
// //                           ? Icons.light_mode_rounded
// //                           : Icons.dark_mode_rounded,
// //                     ),
// //                   ),
// //                   IconButton(
// //                     onPressed: () {
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         const SnackBar(
// //                           content: Text('Settings coming soon!'),
// //                           behavior: SnackBarBehavior.floating,
// //                         ),
// //                       );
// //                     },
// //                     icon: const Icon(Icons.settings_rounded),
// //                   ),
// //                 ],
// //               ),
// //             ];
// //           },
// //           body: PageView(
// //             controller: _pageController,
// //             children: [
// //               HomeTab(
// //                 filteredTools: homeFiltered,
// //                 categories: _categories,
// //                 selectedCategory: _selectedCategory,
// //                 onCategorySelected: (category) {
// //                   setState(() {
// //                     _selectedCategory = category;
// //                   });
// //                 },
// //                 searchController: _searchController,
// //                 query: _query,
// //                 favoriteTitles: _favoriteToolTitles,
// //                 onToggleFavorite: _toggleFavorite,
// //                 onToolTap: (tool) {
// //                   _logHistory(tool.title);
// //                   tool.onTap?.call();
// //                 },
// //               ),
// //               ToolsTab(
// //                 filteredTools: toolsFiltered,
// //                 searchController: _searchToolsController,
// //                 query: _queryTools,
// //                 favoriteTitles: _favoriteToolTitles,
// //                 onToggleFavorite: _toggleFavorite,
// //                 onToolTap: (tool) {
// //                   _logHistory(tool.title);
// //                   tool.onTap?.call();
// //                 },
// //               ),
// //               FavoritesTab(
// //                 filteredFavorites: favoritesFiltered,
// //                 searchController: _searchFavoritesController,
// //                 query: _queryFavorites,
// //                 favoriteTitles: _favoriteToolTitles,
// //                 onToggleFavorite: _toggleFavorite,
// //                 onToolTap: (tool) {
// //                   _logHistory(tool.title);
// //                   tool.onTap?.call();
// //                 },
// //               ),
// //               HistoryTab(
// //                 history: _history,
// //                 onDeleteEntry: (index) {
// //                   setState(() {
// //                     _history.removeAt(index);
// //                   });
// //                 },
// //               ),
// //             ],
// //           ),
// //         ),
// //         extendBody: true,
// //         bottomNavigationBar: RollingBottomBar(
// //           controller: _pageController,
// //           items: const [
// //             RollingBottomBarItem(Icons.home_rounded, label: 'Home'),
// //             RollingBottomBarItem(Icons.grid_view_rounded, label: 'Tools'),
// //             RollingBottomBarItem(Icons.favorite_rounded, label: 'Favorites'),
// //             RollingBottomBarItem(Icons.history_rounded, label: 'History'),
// //           ],
// //           activeItemColor: colorScheme.primary,
// //           enableIconRotation: true,
// //           flat: false,
// //           onTap: (index) {
// //             _pageController.animateToPage(
// //               index,
// //               duration: const Duration(milliseconds: 400),
// //               curve: Curves.easeOut,
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─────────────────────────────────────────────────────────────────────────────
// // // Tab Widgets (unchanged, but each now uses NestedScrollView's inner scroll)
// // // ─────────────────────────────────────────────────────────────────────────────

// // // ─── Home Tab ──────────────────────────────────────────────────────
// // class HomeTab extends StatefulWidget {
// //   final List<_ToolItem> filteredTools;
// //   final List<String> categories;
// //   final String selectedCategory;
// //   final ValueChanged<String> onCategorySelected;
// //   final TextEditingController searchController;
// //   final String query;
// //   final Set<String> favoriteTitles;
// //   final ValueChanged<String> onToggleFavorite;
// //   final ValueChanged<_ToolItem> onToolTap;

// //   const HomeTab({
// //     super.key,
// //     required this.filteredTools,
// //     required this.categories,
// //     required this.selectedCategory,
// //     required this.onCategorySelected,
// //     required this.searchController,
// //     required this.query,
// //     required this.favoriteTitles,
// //     required this.onToggleFavorite,
// //     required this.onToolTap,
// //   });

// //   @override
// //   State<HomeTab> createState() => _HomeTabState();
// // }

// // class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
// //   @override
// //   bool get wantKeepAlive => true;

// //   @override
// //   Widget build(BuildContext context) {
// //     super.build(context);
// //     final colorScheme = Theme.of(context).colorScheme;

// //     // Use NestedScrollView's inner scroll view via SliverOverlapAbsorber
// //     return CustomScrollView(
// //       slivers: [
// //         SliverOverlapAbsorber(
// //           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
// //           sliver: SliverToBoxAdapter(
// //             child: Padding(
// //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     'Welcome back!',
// //                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
// //                       fontWeight: FontWeight.w800,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 4),
// //                   Text(
// //                     'Fast utilities, clean workflow, pro interface.',
// //                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
// //                       color: colorScheme.onSurfaceVariant,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 18),
// //                   Container(
// //                     width: double.infinity,
// //                     padding: const EdgeInsets.all(18),
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(26),
// //                       gradient: LinearGradient(
// //                         begin: Alignment.topLeft,
// //                         end: Alignment.bottomRight,
// //                         colors: [
// //                           colorScheme.primaryContainer,
// //                           colorScheme.tertiaryContainer,
// //                         ],
// //                       ),
// //                     ),
// //                     child: Row(
// //                       children: [
// //                         Expanded(
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text(
// //                                 'Professional workspace',
// //                                 style: Theme.of(context).textTheme.titleLarge
// //                                     ?.copyWith(fontWeight: FontWeight.w800),
// //                               ),
// //                               const SizedBox(height: 8),
// //                               Text(
// //                                 'Search, launch, and manage your tools from one premium dashboard.',
// //                                 style: Theme.of(context).textTheme.bodyMedium,
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         const SizedBox(width: 12),
// //                         Container(
// //                           width: 66,
// //                           height: 66,
// //                           decoration: BoxDecoration(
// //                             color: colorScheme.surface.withOpacity(0.35),
// //                             borderRadius: BorderRadius.circular(20),
// //                           ),
// //                           child: Icon(
// //                             Icons.auto_awesome_rounded,
// //                             size: 34,
// //                             color: colorScheme.onPrimaryContainer,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(height: 18),
// //                   SearchBar(
// //                     controller: widget.searchController,
// //                     hintText: 'Search tools, calculators, PDFs...',
// //                     leading: const Icon(Icons.search_rounded),
// //                     trailing: const [Icon(Icons.tune_rounded)],
// //                     elevation: const WidgetStatePropertyAll(0),
// //                     backgroundColor: WidgetStatePropertyAll(
// //                       colorScheme.surfaceContainerHighest.withOpacity(0.75),
// //                     ),
// //                     padding: const WidgetStatePropertyAll(
// //                       EdgeInsets.symmetric(horizontal: 18),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //         SliverToBoxAdapter(
// //           child: Padding(
// //             padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// //             child: SizedBox(
// //               height: 42,
// //               child: ListView.separated(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: widget.categories.length,
// //                 separatorBuilder: (_, __) => const SizedBox(width: 10),
// //                 itemBuilder: (context, index) {
// //                   final category = widget.categories[index];
// //                   final selected = category == widget.selectedCategory;
// //                   return AnimatedScale(
// //                     scale: selected ? 1.05 : 1.0,
// //                     duration: const Duration(milliseconds: 180),
// //                     curve: Curves.easeOutCubic,
// //                     child: ChoiceChip(
// //                       label: Text(category),
// //                       selected: selected,
// //                       onSelected: (_) {
// //                         widget.onCategorySelected(category);
// //                       },
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
// //         ),
// //         SliverToBoxAdapter(
// //           child: Padding(
// //             padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   'Featured tools',
// //                   style: Theme.of(
// //                     context,
// //                   ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// //                 ),
// //                 AnimatedSwitcher(
// //                   duration: const Duration(milliseconds: 220),
// //                   child: Text(
// //                     '${widget.filteredTools.length} shown',
// //                     key: ValueKey(widget.filteredTools.length),
// //                     style: TextStyle(
// //                       color: colorScheme.primary,
// //                       fontWeight: FontWeight.w700,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //         if (widget.filteredTools.isEmpty)
// //           SliverFillRemaining(
// //             hasScrollBody: false,
// //             child: _EmptyState(
// //               query: widget.query,
// //               category: widget.selectedCategory,
// //             ),
// //           )
// //         else
// //           SliverPadding(
// //             padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// //             sliver: SliverGrid(
// //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 2,
// //                 mainAxisSpacing: 14,
// //                 crossAxisSpacing: 14,
// //                 childAspectRatio: 0.82,
// //               ),
// //               delegate: SliverChildBuilderDelegate((context, index) {
// //                 final tool = widget.filteredTools[index];
// //                 return _StaggeredToolCard(
// //                   tool: tool,
// //                   index: index,
// //                   isFavorite: widget.favoriteTitles.contains(tool.title),
// //                   onToggleFavorite: () => widget.onToggleFavorite(tool.title),
// //                   onToolTap: () => widget.onToolTap(tool),
// //                 );
// //               }, childCount: widget.filteredTools.length),
// //             ),
// //           ),
// //       ],
// //     );
// //   }
// // }

// // // ─── Tools Tab ─────────────────────────────────────────────────────
// // class ToolsTab extends StatefulWidget {
// //   final List<_ToolItem> filteredTools;
// //   final TextEditingController searchController;
// //   final String query;
// //   final Set<String> favoriteTitles;
// //   final ValueChanged<String> onToggleFavorite;
// //   final ValueChanged<_ToolItem> onToolTap;

// //   const ToolsTab({
// //     super.key,
// //     required this.filteredTools,
// //     required this.searchController,
// //     required this.query,
// //     required this.favoriteTitles,
// //     required this.onToggleFavorite,
// //     required this.onToolTap,
// //   });

// //   @override
// //   State<ToolsTab> createState() => _ToolsTabState();
// // }

// // class _ToolsTabState extends State<ToolsTab>
// //     with AutomaticKeepAliveClientMixin {
// //   @override
// //   bool get wantKeepAlive => true;

// //   @override
// //   Widget build(BuildContext context) {
// //     super.build(context);
// //     final colorScheme = Theme.of(context).colorScheme;

// //     return CustomScrollView(
// //       slivers: [
// //         SliverOverlapAbsorber(
// //           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
// //           sliver: SliverToBoxAdapter(
// //             child: Padding(
// //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// //               child: SearchBar(
// //                 controller: widget.searchController,
// //                 hintText: 'Search all tools...',
// //                 leading: const Icon(Icons.search_rounded),
// //                 elevation: const WidgetStatePropertyAll(0),
// //                 backgroundColor: WidgetStatePropertyAll(
// //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// //                 ),
// //                 padding: const WidgetStatePropertyAll(
// //                   EdgeInsets.symmetric(horizontal: 18),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //         if (widget.filteredTools.isEmpty)
// //           SliverFillRemaining(
// //             child: _EmptyState(query: widget.query, category: 'All Tools'),
// //           )
// //         else
// //           SliverPadding(
// //             padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// //             sliver: SliverGrid(
// //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 2,
// //                 mainAxisSpacing: 14,
// //                 crossAxisSpacing: 14,
// //                 childAspectRatio: 0.82,
// //               ),
// //               delegate: SliverChildBuilderDelegate((context, index) {
// //                 final tool = widget.filteredTools[index];
// //                 return _StaggeredToolCard(
// //                   tool: tool,
// //                   index: index,
// //                   isFavorite: widget.favoriteTitles.contains(tool.title),
// //                   onToggleFavorite: () => widget.onToggleFavorite(tool.title),
// //                   onToolTap: () => widget.onToolTap(tool),
// //                 );
// //               }, childCount: widget.filteredTools.length),
// //             ),
// //           ),
// //       ],
// //     );
// //   }
// // }

// // // ─── Favorites Tab ─────────────────────────────────────────────────
// // class FavoritesTab extends StatefulWidget {
// //   final List<_ToolItem> filteredFavorites;
// //   final TextEditingController searchController;
// //   final String query;
// //   final Set<String> favoriteTitles;
// //   final ValueChanged<String> onToggleFavorite;
// //   final ValueChanged<_ToolItem> onToolTap;

// //   const FavoritesTab({
// //     super.key,
// //     required this.filteredFavorites,
// //     required this.searchController,
// //     required this.query,
// //     required this.favoriteTitles,
// //     required this.onToggleFavorite,
// //     required this.onToolTap,
// //   });

// //   @override
// //   State<FavoritesTab> createState() => _FavoritesTabState();
// // }

// // class _FavoritesTabState extends State<FavoritesTab>
// //     with AutomaticKeepAliveClientMixin {
// //   @override
// //   bool get wantKeepAlive => true;

// //   @override
// //   Widget build(BuildContext context) {
// //     super.build(context);
// //     final colorScheme = Theme.of(context).colorScheme;

// //     return CustomScrollView(
// //       slivers: [
// //         SliverOverlapAbsorber(
// //           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
// //           sliver: SliverToBoxAdapter(
// //             child: Padding(
// //               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
// //               child: SearchBar(
// //                 controller: widget.searchController,
// //                 hintText: 'Search favorites...',
// //                 leading: const Icon(Icons.search_rounded),
// //                 elevation: const WidgetStatePropertyAll(0),
// //                 backgroundColor: WidgetStatePropertyAll(
// //                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
// //                 ),
// //                 padding: const WidgetStatePropertyAll(
// //                   EdgeInsets.symmetric(horizontal: 18),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //         if (widget.filteredFavorites.isEmpty)
// //           SliverFillRemaining(child: const _EmptyFavoritesState())
// //         else
// //           SliverPadding(
// //             padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
// //             sliver: SliverGrid(
// //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 2,
// //                 mainAxisSpacing: 14,
// //                 crossAxisSpacing: 14,
// //                 childAspectRatio: 0.82,
// //               ),
// //               delegate: SliverChildBuilderDelegate((context, index) {
// //                 final tool = widget.filteredFavorites[index];
// //                 return _StaggeredToolCard(
// //                   tool: tool,
// //                   index: index,
// //                   isFavorite: true,
// //                   onToggleFavorite: () => widget.onToggleFavorite(tool.title),
// //                   onToolTap: () => widget.onToolTap(tool),
// //                 );
// //               }, childCount: widget.filteredFavorites.length),
// //             ),
// //           ),
// //       ],
// //     );
// //   }
// // }

// // // ─── History Tab ──────────────────────────────────────────────────
// // class HistoryTab extends StatefulWidget {
// //   final List<HistoryEntry> history;
// //   final ValueChanged<int> onDeleteEntry;

// //   const HistoryTab({
// //     super.key,
// //     required this.history,
// //     required this.onDeleteEntry,
// //   });

// //   @override
// //   State<HistoryTab> createState() => _HistoryTabState();
// // }

// // class _HistoryTabState extends State<HistoryTab>
// //     with AutomaticKeepAliveClientMixin {
// //   @override
// //   bool get wantKeepAlive => true;

// //   @override
// //   Widget build(BuildContext context) {
// //     super.build(context);
// //     final colorScheme = Theme.of(context).colorScheme;

// //     return CustomScrollView(
// //       slivers: [
// //         SliverOverlapAbsorber(
// //           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
// //           sliver: SliverPadding(
// //             padding: const EdgeInsets.all(16),
// //             sliver: widget.history.isEmpty
// //                 ? SliverFillRemaining(child: const _EmptyHistoryState())
// //                 : SliverList(
// //                     delegate: SliverChildBuilderDelegate((context, index) {
// //                       final entry = widget.history[index];
// //                       return Card(
// //                         margin: const EdgeInsets.only(bottom: 10),
// //                         elevation: 1,
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(14),
// //                         ),
// //                         child: ListTile(
// //                           leading: CircleAvatar(
// //                             backgroundColor: colorScheme.primaryContainer,
// //                             child: Icon(
// //                               Icons.history_rounded,
// //                               color: colorScheme.primary,
// //                             ),
// //                           ),
// //                           title: Text(
// //                             entry.toolTitle,
// //                             style: const TextStyle(
// //                               fontWeight: FontWeight.w700,
// //                               fontSize: 16,
// //                             ),
// //                           ),
// //                           subtitle: Text(entry.formattedDateTime),
// //                           trailing: IconButton(
// //                             icon: Icon(
// //                               Icons.delete_outline_rounded,
// //                               color: colorScheme.error.withOpacity(0.6),
// //                             ),
// //                             onPressed: () => widget.onDeleteEntry(index),
// //                             tooltip: 'Remove from history',
// //                           ),
// //                         ),
// //                       );
// //                     }, childCount: widget.history.length),
// //                   ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // // ─────────────────────────────────────────────────────────────────────────────
// // // Reusable UI Components (unchanged except for SliverOverlapAbsorber usage)
// // // ─────────────────────────────────────────────────────────────────────────────

// // // ─── Staggered Tool Card ──────────────────────────────────────────
// // class _StaggeredToolCard extends StatefulWidget {
// //   final _ToolItem tool;
// //   final int index;
// //   final bool isFavorite;
// //   final VoidCallback onToggleFavorite;
// //   final VoidCallback onToolTap;

// //   const _StaggeredToolCard({
// //     required this.tool,
// //     required this.index,
// //     required this.isFavorite,
// //     required this.onToggleFavorite,
// //     required this.onToolTap,
// //   });

// //   @override
// //   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// // }

// // class _StaggeredToolCardState extends State<_StaggeredToolCard>
// //     with SingleTickerProviderStateMixin {
// //   late final AnimationController _ctrl;
// //   late final Animation<double> _fade;
// //   late final Animation<Offset> _slide;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _ctrl = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 420),
// //     );
// //     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
// //     _slide = Tween<Offset>(
// //       begin: const Offset(0, 0.08),
// //       end: Offset.zero,
// //     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

// //     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
// //     Future.delayed(delay, () {
// //       if (mounted) _ctrl.forward();
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _ctrl.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return FadeTransition(
// //       opacity: _fade,
// //       child: SlideTransition(
// //         position: _slide,
// //         child: _ToolCard(
// //           tool: widget.tool,
// //           isFavorite: widget.isFavorite,
// //           onToggleFavorite: widget.onToggleFavorite,
// //           onToolTap: widget.onToolTap,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─── Tool Card ────────────────────────────────────────────────────
// // class _ToolCard extends StatefulWidget {
// //   final _ToolItem tool;
// //   final bool isFavorite;
// //   final VoidCallback onToggleFavorite;
// //   final VoidCallback onToolTap;

// //   const _ToolCard({
// //     required this.tool,
// //     required this.isFavorite,
// //     required this.onToggleFavorite,
// //     required this.onToolTap,
// //   });

// //   @override
// //   State<_ToolCard> createState() => _ToolCardState();
// // }

// // class _ToolCardState extends State<_ToolCard>
// //     with SingleTickerProviderStateMixin {
// //   late final AnimationController _pressCtrl;
// //   late final Animation<double> _pressScale;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _pressCtrl = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 100),
// //       reverseDuration: const Duration(milliseconds: 200),
// //       lowerBound: 0.0,
// //       upperBound: 1.0,
// //     );
// //     _pressScale = Tween<double>(
// //       begin: 1.0,
// //       end: 0.95,
// //     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
// //   }

// //   @override
// //   void dispose() {
// //     _pressCtrl.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final colorScheme = Theme.of(context).colorScheme;
// //     final tool = widget.tool;

// //     return ScaleTransition(
// //       scale: _pressScale,
// //       child: GestureDetector(
// //         onTapDown: (_) => _pressCtrl.forward(),
// //         onTapUp: (_) => _pressCtrl.reverse(),
// //         onTapCancel: () => _pressCtrl.reverse(),
// //         onTap: tool.implemented
// //             ? widget.onToolTap
// //             : () {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text('${tool.title} is coming soon.'),
// //                     behavior: SnackBarBehavior.floating,
// //                   ),
// //                 );
// //               },
// //         child: Container(
// //           decoration: BoxDecoration(
// //             color: colorScheme.surface,
// //             borderRadius: BorderRadius.circular(24),
// //             border: Border.all(
// //               color: colorScheme.outlineVariant.withOpacity(0.25),
// //             ),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.black.withOpacity(0.05),
// //                 blurRadius: 20,
// //                 offset: const Offset(0, 10),
// //               ),
// //             ],
// //           ),
// //           child: Stack(
// //             children: [
// //               // "Live / Soon" tag
// //               Positioned(
// //                 top: 14,
// //                 right: 14,
// //                 child: Container(
// //                   padding: const EdgeInsets.symmetric(
// //                     horizontal: 9,
// //                     vertical: 4,
// //                   ),
// //                   decoration: BoxDecoration(
// //                     color: tool.implemented
// //                         ? tool.color.withOpacity(0.12)
// //                         : Colors.grey.withOpacity(0.12),
// //                     borderRadius: BorderRadius.circular(999),
// //                   ),
// //                   child: Text(
// //                     tool.implemented ? 'Live' : 'Soon',
// //                     style: TextStyle(
// //                       fontSize: 10,
// //                       fontWeight: FontWeight.w800,
// //                       color: tool.implemented ? tool.color : Colors.grey,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               // Star button (below the tag)
// //               Positioned(
// //                 top: 48,
// //                 right: 14,
// //                 child: GestureDetector(
// //                   onTap: widget.onToggleFavorite,
// //                   child: Container(
// //                     padding: const EdgeInsets.all(4),
// //                     decoration: BoxDecoration(
// //                       color: Colors.black.withOpacity(0.06),
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Icon(
// //                       widget.isFavorite
// //                           ? Icons.star_rounded
// //                           : Icons.star_border_rounded,
// //                       color: widget.isFavorite ? Colors.amber : Colors.grey,
// //                       size: 26,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               // Card content
// //               Padding(
// //                 padding: const EdgeInsets.all(16),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Hero(
// //                       tag: 'tool-icon-${tool.title}',
// //                       child: Container(
// //                         width: 56,
// //                         height: 56,
// //                         decoration: BoxDecoration(
// //                           gradient: LinearGradient(
// //                             colors: [
// //                               tool.color.withOpacity(0.95),
// //                               tool.color.withOpacity(0.55),
// //                             ],
// //                           ),
// //                           borderRadius: BorderRadius.circular(18),
// //                         ),
// //                         child: Icon(tool.icon, color: Colors.white, size: 29),
// //                       ),
// //                     ),
// //                     Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           tool.title,
// //                           style: const TextStyle(
// //                             fontSize: 15,
// //                             fontWeight: FontWeight.w800,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 6),
// //                         Text(
// //                           tool.subtitle,
// //                           maxLines: 2,
// //                           style: TextStyle(
// //                             color: colorScheme.onSurfaceVariant,
// //                             fontSize: 12.5,
// //                             height: 1.25,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─── Empty States ─────────────────────────────────────────────────
// // class _EmptyState extends StatelessWidget {
// //   final String query;
// //   final String category;

// //   const _EmptyState({required this.query, required this.category});

// //   @override
// //   Widget build(BuildContext context) {
// //     final colorScheme = Theme.of(context).colorScheme;

// //     return Center(
// //       child: Padding(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Container(
// //               width: 94,
// //               height: 94,
// //               decoration: BoxDecoration(
// //                 color: colorScheme.primaryContainer,
// //                 borderRadius: BorderRadius.circular(28),
// //               ),
// //               child: Icon(
// //                 Icons.search_off_rounded,
// //                 size: 44,
// //                 color: colorScheme.onPrimaryContainer,
// //               ),
// //             ),
// //             const SizedBox(height: 18),
// //             Text(
// //               'No matching tools',
// //               style: Theme.of(
// //                 context,
// //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               query.isEmpty
// //                   ? 'No tools found in $category.'
// //                   : 'Nothing matches "$query". Try another keyword or category.',
// //               textAlign: TextAlign.center,
// //               style: TextStyle(
// //                 color: colorScheme.onSurfaceVariant,
// //                 height: 1.4,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _EmptyFavoritesState extends StatelessWidget {
// //   const _EmptyFavoritesState();

// //   @override
// //   Widget build(BuildContext context) {
// //     final colorScheme = Theme.of(context).colorScheme;

// //     return Center(
// //       child: Padding(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Container(
// //               width: 94,
// //               height: 94,
// //               decoration: BoxDecoration(
// //                 color: colorScheme.primaryContainer,
// //                 borderRadius: BorderRadius.circular(28),
// //               ),
// //               child: Icon(
// //                 Icons.favorite_border_rounded,
// //                 size: 44,
// //                 color: colorScheme.onPrimaryContainer,
// //               ),
// //             ),
// //             const SizedBox(height: 18),
// //             Text(
// //               'No favorites yet',
// //               style: Theme.of(
// //                 context,
// //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               'Tap the star on any tool card to add it to your favorites.',
// //               textAlign: TextAlign.center,
// //               style: TextStyle(
// //                 color: colorScheme.onSurfaceVariant,
// //                 height: 1.4,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _EmptyHistoryState extends StatelessWidget {
// //   const _EmptyHistoryState();

// //   @override
// //   Widget build(BuildContext context) {
// //     final colorScheme = Theme.of(context).colorScheme;

// //     return Center(
// //       child: Padding(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Container(
// //               width: 94,
// //               height: 94,
// //               decoration: BoxDecoration(
// //                 color: colorScheme.primaryContainer,
// //                 borderRadius: BorderRadius.circular(28),
// //               ),
// //               child: Icon(
// //                 Icons.history,
// //                 size: 44,
// //                 color: colorScheme.onPrimaryContainer,
// //               ),
// //             ),
// //             const SizedBox(height: 18),
// //             Text(
// //               'No history yet',
// //               style: Theme.of(
// //                 context,
// //               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               'Your recently used tools will appear here.',
// //               textAlign: TextAlign.center,
// //               style: TextStyle(
// //                 color: colorScheme.onSurfaceVariant,
// //                 height: 1.4,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─── Data model ───────────────────────────────────────────────────
// // class _ToolItem {
// //   final String title;
// //   final String subtitle;
// //   final IconData icon;
// //   final Color color;
// //   final String category;
// //   final bool implemented;
// //   final VoidCallback? onTap;

// //   const _ToolItem({
// //     required this.title,
// //     required this.subtitle,
// //     required this.icon,
// //     required this.color,
// //     required this.category,
// //     required this.implemented,
// //     this.onTap,
// //   });
// // }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
// import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

// import '../services/theme_service.dart';
// import '../utils/app_transitions.dart';
// import '../features/qr_code_generator/qr_code_generator_screen.dart';
// import '../features/barcode_generator/barcode_generator_screen.dart';
// import '../features/age_calculator/age_calculator_screen.dart';
// import '../features/bmi_calculator/bmi_calculator_screen.dart';
// import '../features/unit_converter/unit_converter_screen.dart';
// import '../features/image_resizer/image_resizer_screen.dart';
// import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
// import '../features/pdf_split/pdf_split.dart';
// import '../features/image_compressor/image_compressor_screen.dart';
// import '../features/pdf_merge/pdf_merge_screen.dart';
// import '../features/image_to_pdf/image_to_pdf_screen.dart';
// import '../features/image_converter/image_converter_screen.dart';
// import '../features/pdf_compress/pdf_compress_screen.dart';

// // ─── History entry model ──────────────────────────────────────────
// class HistoryEntry {
//   final String toolTitle;
//   final DateTime timestamp;

//   HistoryEntry(this.toolTitle, this.timestamp);

//   String get formattedDateTime =>
//       '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   // ── Page controller for RollingBottomBar ──
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   // ── One SliverOverlapAbsorberHandle per tab ──
//   final List<SliverOverlapAbsorberHandle> _handles = List.generate(
//     4,
//     (_) => SliverOverlapAbsorberHandle(),
//   );

//   // ── Search controllers ──
//   final TextEditingController _searchController = TextEditingController();
//   final TextEditingController _searchToolsController = TextEditingController();
//   final TextEditingController _searchFavoritesController =
//       TextEditingController();

//   String _query = '';
//   String _queryTools = '';
//   String _queryFavorites = '';
//   String _selectedCategory = 'All';

//   // ── Favorites state ──
//   final Set<String> _favoriteToolTitles = {};

//   // ── History state ──
//   final List<HistoryEntry> _history = [];

//   late final AnimationController _fadeInController;
//   late final Animation<double> _fadeIn;

//   final List<String> _categories = [
//     'All',
//     'Media',
//     'PDF',
//     'Calculators',
//     'Scanning',
//   ];

//   @override
//   void initState() {
//     super.initState();

//     _fadeInController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 520),
//     );
//     _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _fadeInController.forward();
//     });

//     _searchController.addListener(() {
//       setState(() {
//         _query = _searchController.text.toLowerCase().trim();
//       });
//     });
//     _searchToolsController.addListener(() {
//       setState(() {
//         _queryTools = _searchToolsController.text.toLowerCase().trim();
//       });
//     });
//     _searchFavoritesController.addListener(() {
//       setState(() {
//         _queryFavorites = _searchFavoritesController.text.toLowerCase().trim();
//       });
//     });

//     _pageController.addListener(() {
//       if (_pageController.page != null) {
//         final page = _pageController.page!.round();
//         if (page != _currentPage) {
//           setState(() {
//             _currentPage = page;
//           });
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _fadeInController.dispose();
//     _searchController.dispose();
//     _searchToolsController.dispose();
//     _searchFavoritesController.dispose();
//     _pageController.dispose();
//     for (var handle in _handles) {
//       handle.dispose();
//     }
//     super.dispose();
//   }

//   void _toggleFavorite(String title) {
//     setState(() {
//       if (_favoriteToolTitles.contains(title)) {
//         _favoriteToolTitles.remove(title);
//       } else {
//         _favoriteToolTitles.add(title);
//       }
//     });
//   }

//   void _logHistory(String toolTitle) {
//     setState(() {
//       _history.insert(0, HistoryEntry(toolTitle, DateTime.now()));
//     });
//   }

//   void _clearHistory() {
//     setState(() {
//       _history.clear();
//     });
//   }

//   // ── Tool data (unchanged) ──
//   List<_ToolItem> _tools(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     return [
//       _ToolItem(
//         title: 'QR Code Generator',
//         subtitle: 'Create modern QR codes',
//         icon: Icons.qr_code_rounded,
//         color: colorScheme.primary,
//         category: 'Scanning',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'Barcode Generator',
//         subtitle: 'Generate barcodes instantly',
//         icon: Icons.document_scanner,
//         color: Colors.teal,
//         category: 'Scanning',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'Image Compressor',
//         subtitle: 'Reduce image size fast',
//         icon: Icons.compress_rounded,
//         color: Colors.green,
//         category: 'Media',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const ImageCompressorScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'Age Calculator',
//         subtitle: 'Calculate exact age',
//         icon: Icons.cake_rounded,
//         color: Colors.orange,
//         category: 'Calculators',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const AgeCalculatorScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'BMI Calculator',
//         subtitle: 'Track your body mass index',
//         icon: Icons.monitor_weight_rounded,
//         color: Colors.cyan,
//         category: 'Calculators',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const BmiCalculatorScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'Unit Converter',
//         subtitle: 'Convert units quickly',
//         icon: Icons.swap_horiz_rounded,
//         color: Colors.indigo,
//         category: 'Calculators',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const UnitConverterScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'PDF Merge',
//         subtitle: 'Join multiple PDFs',
//         icon: Icons.picture_as_pdf_rounded,
//         color: Colors.redAccent,
//         category: 'PDF',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const PdfMergeScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'PDF Split',
//         subtitle: 'Split PDF pages',
//         icon: Icons.call_split_rounded,
//         color: Colors.pink,
//         category: 'PDF',
//         implemented: true,
//         onTap: () =>
//             Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
//       ),
//       _ToolItem(
//         title: 'Image to PDF',
//         subtitle: 'Convert images to PDF',
//         icon: Icons.insert_drive_file_rounded,
//         color: Colors.brown,
//         category: 'Media',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const ImageToPdfScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'Image Converter',
//         subtitle: 'Change image formats',
//         icon: Icons.image_rounded,
//         color: Colors.deepOrange,
//         category: 'Media',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const ImageConverterScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'Image Resizer',
//         subtitle: 'Resize images precisely',
//         icon: Icons.photo_size_select_large_rounded,
//         color: Colors.blue,
//         category: 'Media',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const ImageResizerScreen()),
//         ),
//       ),
//       _ToolItem(
//         title: 'QR / Barcode Scanner',
//         subtitle: 'Scan codes with camera',
//         icon: Icons.document_scanner_rounded,
//         color: Colors.deepPurple,
//         category: 'Scanning',
//         implemented: true,
//         onTap: () => Navigator.push(
//           context,
//           AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
//         ),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeService = context.watch<ThemeService>();
//     final colorScheme = Theme.of(context).colorScheme;

//     final allTools = _tools(context);

//     // ── Filters ──
//     final homeFiltered = allTools.where((tool) {
//       final matchesQuery =
//           _query.isEmpty ||
//           tool.title.toLowerCase().contains(_query) ||
//           tool.subtitle.toLowerCase().contains(_query) ||
//           tool.category.toLowerCase().contains(_query);
//       final matchesCategory =
//           _selectedCategory == 'All' || tool.category == _selectedCategory;
//       return matchesQuery && matchesCategory;
//     }).toList();

//     final toolsFiltered = allTools.where((tool) {
//       return _queryTools.isEmpty ||
//           tool.title.toLowerCase().contains(_queryTools) ||
//           tool.subtitle.toLowerCase().contains(_queryTools);
//     }).toList();

//     final favoriteTools = allTools
//         .where((tool) => _favoriteToolTitles.contains(tool.title))
//         .toList();
//     final favoritesFiltered = favoriteTools.where((tool) {
//       return _queryFavorites.isEmpty ||
//           tool.title.toLowerCase().contains(_queryFavorites) ||
//           tool.subtitle.toLowerCase().contains(_queryFavorites);
//     }).toList();

//     return FadeTransition(
//       opacity: _fadeIn,
//       child: Scaffold(
//         body: NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 expandedHeight: 120.0,
//                 floating: false,
//                 pinned: true,
//                 backgroundColor: colorScheme.surface,
//                 foregroundColor: colorScheme.onSurface,
//                 elevation: 0,
//                 flexibleSpace: FlexibleSpaceBar(
//                   title: Row(
//                     children: [
//                       Icon(Icons.dashboard_rounded, color: colorScheme.primary),
//                       const SizedBox(width: 8),
//                       const Text('ToolKit Pro'),
//                     ],
//                   ),
//                   titlePadding: const EdgeInsets.only(left: 16, bottom: 8),
//                   background: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           colorScheme.primaryContainer,
//                           colorScheme.tertiaryContainer,
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 actions: [
//                   if (_currentPage == 3) // History tab
//                     IconButton(
//                       onPressed: _history.isEmpty ? null : _clearHistory,
//                       icon: Icon(
//                         Icons.delete_sweep_rounded,
//                         color: _history.isEmpty
//                             ? Colors.grey
//                             : colorScheme.error,
//                       ),
//                       tooltip: 'Clear history',
//                     ),
//                   IconButton(
//                     onPressed: themeService.toggleTheme,
//                     icon: Icon(
//                       themeService.isDark
//                           ? Icons.light_mode_rounded
//                           : Icons.dark_mode_rounded,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Settings coming soon!'),
//                           behavior: SnackBarBehavior.floating,
//                         ),
//                       );
//                     },
//                     icon: const Icon(Icons.settings_rounded),
//                   ),
//                 ],
//               ),
//             ];
//           },
//           body: PageView(
//             controller: _pageController,
//             children: [
//               HomeTab(
//                 handle: _handles[0],
//                 filteredTools: homeFiltered,
//                 categories: _categories,
//                 selectedCategory: _selectedCategory,
//                 onCategorySelected: (category) {
//                   setState(() {
//                     _selectedCategory = category;
//                   });
//                 },
//                 searchController: _searchController,
//                 query: _query,
//                 favoriteTitles: _favoriteToolTitles,
//                 onToggleFavorite: _toggleFavorite,
//                 onToolTap: (tool) {
//                   _logHistory(tool.title);
//                   tool.onTap?.call();
//                 },
//               ),
//               ToolsTab(
//                 handle: _handles[1],
//                 filteredTools: toolsFiltered,
//                 searchController: _searchToolsController,
//                 query: _queryTools,
//                 favoriteTitles: _favoriteToolTitles,
//                 onToggleFavorite: _toggleFavorite,
//                 onToolTap: (tool) {
//                   _logHistory(tool.title);
//                   tool.onTap?.call();
//                 },
//               ),
//               FavoritesTab(
//                 handle: _handles[2],
//                 filteredFavorites: favoritesFiltered,
//                 searchController: _searchFavoritesController,
//                 query: _queryFavorites,
//                 favoriteTitles: _favoriteToolTitles,
//                 onToggleFavorite: _toggleFavorite,
//                 onToolTap: (tool) {
//                   _logHistory(tool.title);
//                   tool.onTap?.call();
//                 },
//               ),
//               HistoryTab(
//                 handle: _handles[3],
//                 history: _history,
//                 onDeleteEntry: (index) {
//                   setState(() {
//                     _history.removeAt(index);
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//         extendBody: true,
//         bottomNavigationBar: RollingBottomBar(
//           controller: _pageController,
//           items: const [
//             RollingBottomBarItem(Icons.home_rounded, label: 'Home'),
//             RollingBottomBarItem(Icons.grid_view_rounded, label: 'Tools'),
//             RollingBottomBarItem(Icons.favorite_rounded, label: 'Favorites'),
//             RollingBottomBarItem(Icons.history_rounded, label: 'History'),
//           ],
//           activeItemColor: colorScheme.primary,
//           enableIconRotation: true,
//           flat: false,
//           onTap: (index) {
//             _pageController.animateToPage(
//               index,
//               duration: const Duration(milliseconds: 400),
//               curve: Curves.easeOut,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Tab Widgets – each receives its own SliverOverlapAbsorberHandle
// // ─────────────────────────────────────────────────────────────────────────────

// // ─── Home Tab ──────────────────────────────────────────────────────
// class HomeTab extends StatefulWidget {
//   final SliverOverlapAbsorberHandle handle;
//   final List<_ToolItem> filteredTools;
//   final List<String> categories;
//   final String selectedCategory;
//   final ValueChanged<String> onCategorySelected;
//   final TextEditingController searchController;
//   final String query;
//   final Set<String> favoriteTitles;
//   final ValueChanged<String> onToggleFavorite;
//   final ValueChanged<_ToolItem> onToolTap;

//   const HomeTab({
//     super.key,
//     required this.handle,
//     required this.filteredTools,
//     required this.categories,
//     required this.selectedCategory,
//     required this.onCategorySelected,
//     required this.searchController,
//     required this.query,
//     required this.favoriteTitles,
//     required this.onToggleFavorite,
//     required this.onToolTap,
//   });

//   @override
//   State<HomeTab> createState() => _HomeTabState();
// }

// class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     final colorScheme = Theme.of(context).colorScheme;

//     return CustomScrollView(
//       slivers: [
//         SliverOverlapAbsorber(
//           handle: widget.handle, // custom handle per tab
//           sliver: SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Welcome back!',
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     'Fast utilities, clean workflow, pro interface.',
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: colorScheme.onSurfaceVariant,
//                     ),
//                   ),
//                   const SizedBox(height: 18),
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(18),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(26),
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           colorScheme.primaryContainer,
//                           colorScheme.tertiaryContainer,
//                         ],
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Professional workspace',
//                                 style: Theme.of(context).textTheme.titleLarge
//                                     ?.copyWith(fontWeight: FontWeight.w800),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'Search, launch, and manage your tools from one premium dashboard.',
//                                 style: Theme.of(context).textTheme.bodyMedium,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Container(
//                           width: 66,
//                           height: 66,
//                           decoration: BoxDecoration(
//                             color: colorScheme.surface.withOpacity(0.35),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Icon(
//                             Icons.auto_awesome_rounded,
//                             size: 34,
//                             color: colorScheme.onPrimaryContainer,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 18),
//                   SearchBar(
//                     controller: widget.searchController,
//                     hintText: 'Search tools, calculators, PDFs...',
//                     leading: const Icon(Icons.search_rounded),
//                     trailing: const [Icon(Icons.tune_rounded)],
//                     elevation: const WidgetStatePropertyAll(0),
//                     backgroundColor: WidgetStatePropertyAll(
//                       colorScheme.surfaceContainerHighest.withOpacity(0.75),
//                     ),
//                     padding: const WidgetStatePropertyAll(
//                       EdgeInsets.symmetric(horizontal: 18),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
//             child: SizedBox(
//               height: 42,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: widget.categories.length,
//                 separatorBuilder: (_, __) => const SizedBox(width: 10),
//                 itemBuilder: (context, index) {
//                   final category = widget.categories[index];
//                   final selected = category == widget.selectedCategory;
//                   return AnimatedScale(
//                     scale: selected ? 1.05 : 1.0,
//                     duration: const Duration(milliseconds: 180),
//                     curve: Curves.easeOutCubic,
//                     child: ChoiceChip(
//                       label: Text(category),
//                       selected: selected,
//                       onSelected: (_) {
//                         widget.onCategorySelected(category);
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Featured tools',
//                   style: Theme.of(
//                     context,
//                   ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
//                 ),
//                 AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 220),
//                   child: Text(
//                     '${widget.filteredTools.length} shown',
//                     key: ValueKey(widget.filteredTools.length),
//                     style: TextStyle(
//                       color: colorScheme.primary,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (widget.filteredTools.isEmpty)
//           SliverFillRemaining(
//             hasScrollBody: false,
//             child: _EmptyState(
//               query: widget.query,
//               category: widget.selectedCategory,
//             ),
//           )
//         else
//           SliverPadding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
//             sliver: SliverGrid(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 14,
//                 crossAxisSpacing: 14,
//                 childAspectRatio: 0.82,
//               ),
//               delegate: SliverChildBuilderDelegate((context, index) {
//                 final tool = widget.filteredTools[index];
//                 return _StaggeredToolCard(
//                   tool: tool,
//                   index: index,
//                   isFavorite: widget.favoriteTitles.contains(tool.title),
//                   onToggleFavorite: () => widget.onToggleFavorite(tool.title),
//                   onToolTap: () => widget.onToolTap(tool),
//                 );
//               }, childCount: widget.filteredTools.length),
//             ),
//           ),
//       ],
//     );
//   }
// }

// // ─── Tools Tab ─────────────────────────────────────────────────────
// class ToolsTab extends StatefulWidget {
//   final SliverOverlapAbsorberHandle handle;
//   final List<_ToolItem> filteredTools;
//   final TextEditingController searchController;
//   final String query;
//   final Set<String> favoriteTitles;
//   final ValueChanged<String> onToggleFavorite;
//   final ValueChanged<_ToolItem> onToolTap;

//   const ToolsTab({
//     super.key,
//     required this.handle,
//     required this.filteredTools,
//     required this.searchController,
//     required this.query,
//     required this.favoriteTitles,
//     required this.onToggleFavorite,
//     required this.onToolTap,
//   });

//   @override
//   State<ToolsTab> createState() => _ToolsTabState();
// }

// class _ToolsTabState extends State<ToolsTab>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     final colorScheme = Theme.of(context).colorScheme;

//     return CustomScrollView(
//       slivers: [
//         SliverOverlapAbsorber(
//           handle: widget.handle,
//           sliver: SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
//               child: SearchBar(
//                 controller: widget.searchController,
//                 hintText: 'Search all tools...',
//                 leading: const Icon(Icons.search_rounded),
//                 elevation: const WidgetStatePropertyAll(0),
//                 backgroundColor: WidgetStatePropertyAll(
//                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
//                 ),
//                 padding: const WidgetStatePropertyAll(
//                   EdgeInsets.symmetric(horizontal: 18),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (widget.filteredTools.isEmpty)
//           SliverFillRemaining(
//             child: _EmptyState(query: widget.query, category: 'All Tools'),
//           )
//         else
//           SliverPadding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
//             sliver: SliverGrid(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 14,
//                 crossAxisSpacing: 14,
//                 childAspectRatio: 0.82,
//               ),
//               delegate: SliverChildBuilderDelegate((context, index) {
//                 final tool = widget.filteredTools[index];
//                 return _StaggeredToolCard(
//                   tool: tool,
//                   index: index,
//                   isFavorite: widget.favoriteTitles.contains(tool.title),
//                   onToggleFavorite: () => widget.onToggleFavorite(tool.title),
//                   onToolTap: () => widget.onToolTap(tool),
//                 );
//               }, childCount: widget.filteredTools.length),
//             ),
//           ),
//       ],
//     );
//   }
// }

// // ─── Favorites Tab ─────────────────────────────────────────────────
// class FavoritesTab extends StatefulWidget {
//   final SliverOverlapAbsorberHandle handle;
//   final List<_ToolItem> filteredFavorites;
//   final TextEditingController searchController;
//   final String query;
//   final Set<String> favoriteTitles;
//   final ValueChanged<String> onToggleFavorite;
//   final ValueChanged<_ToolItem> onToolTap;

//   const FavoritesTab({
//     super.key,
//     required this.handle,
//     required this.filteredFavorites,
//     required this.searchController,
//     required this.query,
//     required this.favoriteTitles,
//     required this.onToggleFavorite,
//     required this.onToolTap,
//   });

//   @override
//   State<FavoritesTab> createState() => _FavoritesTabState();
// }

// class _FavoritesTabState extends State<FavoritesTab>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     final colorScheme = Theme.of(context).colorScheme;

//     return CustomScrollView(
//       slivers: [
//         SliverOverlapAbsorber(
//           handle: widget.handle,
//           sliver: SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
//               child: SearchBar(
//                 controller: widget.searchController,
//                 hintText: 'Search favorites...',
//                 leading: const Icon(Icons.search_rounded),
//                 elevation: const WidgetStatePropertyAll(0),
//                 backgroundColor: WidgetStatePropertyAll(
//                   colorScheme.surfaceContainerHighest.withOpacity(0.75),
//                 ),
//                 padding: const WidgetStatePropertyAll(
//                   EdgeInsets.symmetric(horizontal: 18),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (widget.filteredFavorites.isEmpty)
//           SliverFillRemaining(child: const _EmptyFavoritesState())
//         else
//           SliverPadding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
//             sliver: SliverGrid(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 14,
//                 crossAxisSpacing: 14,
//                 childAspectRatio: 0.82,
//               ),
//               delegate: SliverChildBuilderDelegate((context, index) {
//                 final tool = widget.filteredFavorites[index];
//                 return _StaggeredToolCard(
//                   tool: tool,
//                   index: index,
//                   isFavorite: true,
//                   onToggleFavorite: () => widget.onToggleFavorite(tool.title),
//                   onToolTap: () => widget.onToolTap(tool),
//                 );
//               }, childCount: widget.filteredFavorites.length),
//             ),
//           ),
//       ],
//     );
//   }
// }

// // ─── History Tab ──────────────────────────────────────────────────
// class HistoryTab extends StatefulWidget {
//   final SliverOverlapAbsorberHandle handle;
//   final List<HistoryEntry> history;
//   final ValueChanged<int> onDeleteEntry;

//   const HistoryTab({
//     super.key,
//     required this.handle,
//     required this.history,
//     required this.onDeleteEntry,
//   });

//   @override
//   State<HistoryTab> createState() => _HistoryTabState();
// }

// class _HistoryTabState extends State<HistoryTab>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     final colorScheme = Theme.of(context).colorScheme;

//     return CustomScrollView(
//       slivers: [
//         SliverOverlapAbsorber(
//           handle: widget.handle,
//           sliver: SliverPadding(
//             padding: const EdgeInsets.all(16),
//             sliver: widget.history.isEmpty
//                 ? SliverFillRemaining(child: const _EmptyHistoryState())
//                 : SliverList(
//                     delegate: SliverChildBuilderDelegate((context, index) {
//                       final entry = widget.history[index];
//                       return Card(
//                         margin: const EdgeInsets.only(bottom: 10),
//                         elevation: 1,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(14),
//                         ),
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             backgroundColor: colorScheme.primaryContainer,
//                             child: Icon(
//                               Icons.history_rounded,
//                               color: colorScheme.primary,
//                             ),
//                           ),
//                           title: Text(
//                             entry.toolTitle,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16,
//                             ),
//                           ),
//                           subtitle: Text(entry.formattedDateTime),
//                           trailing: IconButton(
//                             icon: Icon(
//                               Icons.delete_outline_rounded,
//                               color: colorScheme.error.withOpacity(0.6),
//                             ),
//                             onPressed: () => widget.onDeleteEntry(index),
//                             tooltip: 'Remove from history',
//                           ),
//                         ),
//                       );
//                     }, childCount: widget.history.length),
//                   ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Reusable UI Components (unchanged)
// // ─────────────────────────────────────────────────────────────────────────────

// // ─── Staggered Tool Card ──────────────────────────────────────────
// class _StaggeredToolCard extends StatefulWidget {
//   final _ToolItem tool;
//   final int index;
//   final bool isFavorite;
//   final VoidCallback onToggleFavorite;
//   final VoidCallback onToolTap;

//   const _StaggeredToolCard({
//     required this.tool,
//     required this.index,
//     required this.isFavorite,
//     required this.onToggleFavorite,
//     required this.onToolTap,
//   });

//   @override
//   State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
// }

// class _StaggeredToolCardState extends State<_StaggeredToolCard>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _ctrl;
//   late final Animation<double> _fade;
//   late final Animation<Offset> _slide;

//   @override
//   void initState() {
//     super.initState();
//     _ctrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 420),
//     );
//     _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
//     _slide = Tween<Offset>(
//       begin: const Offset(0, 0.08),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

//     final delay = Duration(milliseconds: (widget.index * 35).clamp(0, 280));
//     Future.delayed(delay, () {
//       if (mounted) _ctrl.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _ctrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fade,
//       child: SlideTransition(
//         position: _slide,
//         child: _ToolCard(
//           tool: widget.tool,
//           isFavorite: widget.isFavorite,
//           onToggleFavorite: widget.onToggleFavorite,
//           onToolTap: widget.onToolTap,
//         ),
//       ),
//     );
//   }
// }

// // ─── Tool Card ────────────────────────────────────────────────────
// class _ToolCard extends StatefulWidget {
//   final _ToolItem tool;
//   final bool isFavorite;
//   final VoidCallback onToggleFavorite;
//   final VoidCallback onToolTap;

//   const _ToolCard({
//     required this.tool,
//     required this.isFavorite,
//     required this.onToggleFavorite,
//     required this.onToolTap,
//   });

//   @override
//   State<_ToolCard> createState() => _ToolCardState();
// }

// class _ToolCardState extends State<_ToolCard>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _pressCtrl;
//   late final Animation<double> _pressScale;

//   @override
//   void initState() {
//     super.initState();
//     _pressCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 100),
//       reverseDuration: const Duration(milliseconds: 200),
//       lowerBound: 0.0,
//       upperBound: 1.0,
//     );
//     _pressScale = Tween<double>(
//       begin: 1.0,
//       end: 0.95,
//     ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
//   }

//   @override
//   void dispose() {
//     _pressCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final tool = widget.tool;

//     return ScaleTransition(
//       scale: _pressScale,
//       child: GestureDetector(
//         onTapDown: (_) => _pressCtrl.forward(),
//         onTapUp: (_) => _pressCtrl.reverse(),
//         onTapCancel: () => _pressCtrl.reverse(),
//         onTap: tool.implemented
//             ? widget.onToolTap
//             : () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('${tool.title} is coming soon.'),
//                     behavior: SnackBarBehavior.floating,
//                   ),
//                 );
//               },
//         child: Container(
//           decoration: BoxDecoration(
//             color: colorScheme.surface,
//             borderRadius: BorderRadius.circular(24),
//             border: Border.all(
//               color: colorScheme.outlineVariant.withOpacity(0.25),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 20,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Stack(
//             children: [
//               // "Live / Soon" tag
//               Positioned(
//                 top: 14,
//                 right: 14,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 9,
//                     vertical: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: tool.implemented
//                         ? tool.color.withOpacity(0.12)
//                         : Colors.grey.withOpacity(0.12),
//                     borderRadius: BorderRadius.circular(999),
//                   ),
//                   child: Text(
//                     tool.implemented ? 'Live' : 'Soon',
//                     style: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w800,
//                       color: tool.implemented ? tool.color : Colors.grey,
//                     ),
//                   ),
//                 ),
//               ),
//               // Star button (below the tag)
//               Positioned(
//                 top: 48,
//                 right: 14,
//                 child: GestureDetector(
//                   onTap: widget.onToggleFavorite,
//                   child: Container(
//                     padding: const EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.06),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       widget.isFavorite
//                           ? Icons.star_rounded
//                           : Icons.star_border_rounded,
//                       color: widget.isFavorite ? Colors.amber : Colors.grey,
//                       size: 26,
//                     ),
//                   ),
//                 ),
//               ),
//               // Card content
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Hero(
//                       tag: 'tool-icon-${tool.title}',
//                       child: Container(
//                         width: 56,
//                         height: 56,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               tool.color.withOpacity(0.95),
//                               tool.color.withOpacity(0.55),
//                             ],
//                           ),
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         child: Icon(tool.icon, color: Colors.white, size: 29),
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           tool.title,
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           tool.subtitle,
//                           maxLines: 2,
//                           style: TextStyle(
//                             color: colorScheme.onSurfaceVariant,
//                             fontSize: 12.5,
//                             height: 1.25,
//                           ),
//                         ),
//                       ],
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
// }

// // ─── Empty States ─────────────────────────────────────────────────
// class _EmptyState extends StatelessWidget {
//   final String query;
//   final String category;

//   const _EmptyState({required this.query, required this.category});

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 94,
//               height: 94,
//               decoration: BoxDecoration(
//                 color: colorScheme.primaryContainer,
//                 borderRadius: BorderRadius.circular(28),
//               ),
//               child: Icon(
//                 Icons.search_off_rounded,
//                 size: 44,
//                 color: colorScheme.onPrimaryContainer,
//               ),
//             ),
//             const SizedBox(height: 18),
//             Text(
//               'No matching tools',
//               style: Theme.of(
//                 context,
//               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               query.isEmpty
//                   ? 'No tools found in $category.'
//                   : 'Nothing matches "$query". Try another keyword or category.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: colorScheme.onSurfaceVariant,
//                 height: 1.4,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _EmptyFavoritesState extends StatelessWidget {
//   const _EmptyFavoritesState();

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 94,
//               height: 94,
//               decoration: BoxDecoration(
//                 color: colorScheme.primaryContainer,
//                 borderRadius: BorderRadius.circular(28),
//               ),
//               child: Icon(
//                 Icons.favorite_border_rounded,
//                 size: 44,
//                 color: colorScheme.onPrimaryContainer,
//               ),
//             ),
//             const SizedBox(height: 18),
//             Text(
//               'No favorites yet',
//               style: Theme.of(
//                 context,
//               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Tap the star on any tool card to add it to your favorites.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: colorScheme.onSurfaceVariant,
//                 height: 1.4,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _EmptyHistoryState extends StatelessWidget {
//   const _EmptyHistoryState();

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 94,
//               height: 94,
//               decoration: BoxDecoration(
//                 color: colorScheme.primaryContainer,
//                 borderRadius: BorderRadius.circular(28),
//               ),
//               child: Icon(
//                 Icons.history,
//                 size: 44,
//                 color: colorScheme.onPrimaryContainer,
//               ),
//             ),
//             const SizedBox(height: 18),
//             Text(
//               'No history yet',
//               style: Theme.of(
//                 context,
//               ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Your recently used tools will appear here.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: colorScheme.onSurfaceVariant,
//                 height: 1.4,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─── Data model ───────────────────────────────────────────────────
// class _ToolItem {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final Color color;
//   final String category;
//   final bool implemented;
//   final VoidCallback? onTap;

//   const _ToolItem({
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.color,
//     required this.category,
//     required this.implemented,
//     this.onTap,
//   });
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/theme_service.dart';
import '../utils/app_transitions.dart';
import '../features/qr_code_generator/qr_code_generator_screen.dart';
import '../features/barcode_generator/barcode_generator_screen.dart';
import '../features/age_calculator/age_calculator_screen.dart';
import '../features/bmi_calculator/bmi_calculator_screen.dart';
import '../features/unit_converter/unit_converter_screen.dart';
import '../features/image_resizer/image_resizer_screen.dart';
import '../features/qr_barcode_scanner/qr_barcode_scanner_screen.dart';
import '../features/pdf_split/pdf_split.dart';
import '../features/image_compressor/image_compressor_screen.dart';
import '../features/pdf_merge/pdf_merge_screen.dart';
import '../features/image_to_pdf/image_to_pdf_screen.dart';
import '../features/image_converter/image_converter_screen.dart';
import '../features/pdf_compress/pdf_compress_screen.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SharedPreferences keys
// ─────────────────────────────────────────────────────────────────────────────
const String _kFavoritesKey = 'favorites_v1';
const String _kHistoryKey = 'history_v1';

// ─────────────────────────────────────────────────────────────────────────────
// History entry model
// ─────────────────────────────────────────────────────────────────────────────
class HistoryEntry {
  final String toolTitle;
  final DateTime timestamp;

  HistoryEntry(this.toolTitle, this.timestamp);

  String get formattedDateTime =>
      '${timestamp.day}/${timestamp.month}/${timestamp.year} '
      '${timestamp.hour.toString().padLeft(2, '0')}:'
      '${timestamp.minute.toString().padLeft(2, '0')}';

  Map<String, dynamic> toJson() => {
    'toolTitle': toolTitle,
    'timestamp': timestamp.toIso8601String(),
  };

  factory HistoryEntry.fromJson(Map<String, dynamic> json) => HistoryEntry(
    json['toolTitle'] as String,
    DateTime.parse(json['timestamp'] as String),
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared grid delegate
// ─────────────────────────────────────────────────────────────────────────────
const _kGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  mainAxisSpacing: 14,
  crossAxisSpacing: 14,
  childAspectRatio: 0.82,
);

// ─────────────────────────────────────────────────────────────────────────────
// HomeScreen
// ─────────────────────────────────────────────────────────────────────────────
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _searchToolsController = TextEditingController();
  final TextEditingController _searchFavoritesController =
      TextEditingController();

  String _query = '';
  String _queryTools = '';
  String _queryFavorites = '';
  String _selectedCategory = 'All';

  final Set<String> _favoriteToolTitles = {};
  final List<HistoryEntry> _history = [];

  bool _prefsLoaded = false;

  late final AnimationController _fadeInController;
  late final Animation<double> _fadeIn;

  final List<String> _categories = [
    'All',
    'Media',
    'PDF',
    'Calculators',
    'Scanning',
  ];

  // ── SharedPreferences ────────────────────────────────────────────

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final favList = prefs.getStringList(_kFavoritesKey) ?? [];
    _favoriteToolTitles.addAll(favList);

    final histJson = prefs.getStringList(_kHistoryKey) ?? [];
    for (final raw in histJson) {
      try {
        _history.add(
          HistoryEntry.fromJson(jsonDecode(raw) as Map<String, dynamic>),
        );
      } catch (_) {}
    }

    if (mounted) setState(() => _prefsLoaded = true);
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_kFavoritesKey, _favoriteToolTitles.toList());
  }

  Future<void> _saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _kHistoryKey,
      _history.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  // ── Lifecycle ────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();

    _fadeInController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );
    _fadeIn = CurvedAnimation(parent: _fadeInController, curve: Curves.easeOut);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadPrefs();
      _fadeInController.forward();
    });

    _searchController.addListener(
      () =>
          setState(() => _query = _searchController.text.toLowerCase().trim()),
    );
    _searchToolsController.addListener(
      () => setState(
        () => _queryTools = _searchToolsController.text.toLowerCase().trim(),
      ),
    );
    _searchFavoritesController.addListener(
      () => setState(
        () => _queryFavorites = _searchFavoritesController.text
            .toLowerCase()
            .trim(),
      ),
    );

    _pageController.addListener(() {
      final page = _pageController.page?.round();
      if (page != null && page != _currentPage) {
        setState(() => _currentPage = page);
      }
    });
  }

  @override
  void dispose() {
    _fadeInController.dispose();
    _searchController.dispose();
    _searchToolsController.dispose();
    _searchFavoritesController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // ── Mutations ────────────────────────────────────────────────────

  void _toggleFavorite(String title) {
    setState(() {
      if (_favoriteToolTitles.contains(title)) {
        _favoriteToolTitles.remove(title);
      } else {
        _favoriteToolTitles.add(title);
      }
    });
    _saveFavorites();
  }

  void _logHistory(String toolTitle) {
    setState(() {
      _history.removeWhere((e) => e.toolTitle == toolTitle);
      _history.insert(0, HistoryEntry(toolTitle, DateTime.now()));
      if (_history.length > 50) _history.removeLast();
    });
    _saveHistory();
  }

  void _clearHistory() {
    setState(() => _history.clear());
    _saveHistory();
  }

  void _deleteHistoryEntry(int index) {
    setState(() => _history.removeAt(index));
    _saveHistory();
  }

  // ── Tool data ────────────────────────────────────────────────────

  List<_ToolItem> _tools(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return [
      _ToolItem(
        title: 'QR Code Generator',
        subtitle: 'Create modern QR codes',
        icon: Icons.qr_code_rounded,
        color: colorScheme.primary,
        category: 'Scanning',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const QrCodeGeneratorScreen()),
        ),
      ),
      _ToolItem(
        title: 'Barcode Generator',
        subtitle: 'Generate barcodes instantly',
        icon: Icons.document_scanner,
        color: Colors.teal,
        category: 'Scanning',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const BarcodeGeneratorScreen()),
        ),
      ),
      _ToolItem(
        title: 'Image Compressor',
        subtitle: 'Reduce image size fast',
        icon: Icons.compress_rounded,
        color: Colors.green,
        category: 'Media',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const ImageCompressorScreen()),
        ),
      ),
      _ToolItem(
        title: 'Age Calculator',
        subtitle: 'Calculate exact age',
        icon: Icons.cake_rounded,
        color: Colors.orange,
        category: 'Calculators',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const AgeCalculatorScreen()),
        ),
      ),
      _ToolItem(
        title: 'BMI Calculator',
        subtitle: 'Track your body mass index',
        icon: Icons.monitor_weight_rounded,
        color: Colors.cyan,
        category: 'Calculators',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const BmiCalculatorScreen()),
        ),
      ),
      _ToolItem(
        title: 'Unit Converter',
        subtitle: 'Convert units quickly',
        icon: Icons.swap_horiz_rounded,
        color: Colors.indigo,
        category: 'Calculators',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const UnitConverterScreen()),
        ),
      ),
      _ToolItem(
        title: 'PDF Merge',
        subtitle: 'Join multiple PDFs',
        icon: Icons.picture_as_pdf_rounded,
        color: Colors.redAccent,
        category: 'PDF',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const PdfMergeScreen()),
        ),
      ),
      _ToolItem(
        title: 'PDF Split',
        subtitle: 'Split PDF pages',
        icon: Icons.call_split_rounded,
        color: Colors.pink,
        category: 'PDF',
        implemented: true,
        onTap: () =>
            Navigator.push(context, AppTransitions.elasticIn(const PdfSplit())),
      ),

      _ToolItem(
        title: 'Image to PDF',
        subtitle: 'Convert images to PDF',
        icon: Icons.insert_drive_file_rounded,
        color: Colors.brown,
        category: 'Media',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const ImageToPdfScreen()),
        ),
      ),
      _ToolItem(
        title: 'Image Converter',
        subtitle: 'Change image formats',
        icon: Icons.image_rounded,
        color: Colors.deepPurple,
        category: 'Media',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const ImageConverterScreen()),
        ),
      ),
      _ToolItem(
        title: 'Image Resizer',
        subtitle: 'Resize images precisely',
        icon: Icons.photo_size_select_large_rounded,
        color: Colors.blue,
        category: 'Media',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const ImageResizerScreen()),
        ),
      ),
      _ToolItem(
        title: 'QR / Barcode Scanner',
        subtitle: 'Scan codes with camera',
        icon: Icons.document_scanner_rounded,
        color: Colors.teal,
        category: 'Scanning',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          AppTransitions.elasticIn(const QrBarcodeScannerScreen()),
        ),
      ),
    ];
  }

  // ── Build ────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    if (!_prefsLoaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final themeService = context.watch<ThemeService>();
    final colorScheme = Theme.of(context).colorScheme;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final navBarClearance = kBottomNavigationBarHeight + bottomPadding + 12;

    final allTools = _tools(context);

    final homeFiltered = allTools.where((t) {
      final q = _query;
      final matchesQuery =
          q.isEmpty ||
          t.title.toLowerCase().contains(q) ||
          t.subtitle.toLowerCase().contains(q) ||
          t.category.toLowerCase().contains(q);
      final matchesCat =
          _selectedCategory == 'All' || t.category == _selectedCategory;
      return matchesQuery && matchesCat;
    }).toList();

    final toolsFiltered = allTools
        .where(
          (t) =>
              _queryTools.isEmpty ||
              t.title.toLowerCase().contains(_queryTools) ||
              t.subtitle.toLowerCase().contains(_queryTools),
        )
        .toList();

    final favoriteTools = allTools
        .where((t) => _favoriteToolTitles.contains(t.title))
        .toList();
    final favoritesFiltered = favoriteTools
        .where(
          (t) =>
              _queryFavorites.isEmpty ||
              t.title.toLowerCase().contains(_queryFavorites) ||
              t.subtitle.toLowerCase().contains(_queryFavorites),
        )
        .toList();

    // ── Shared AppBar builder ──
    // Each tab renders its own SliverAppBar inside its own CustomScrollView.
    // This completely avoids the NestedScrollView + SliverOverlapAbsorber/Injector
    // pattern that caused the "RenderObject has no descendants" crash.
    Widget buildAppBar({bool showClearHistory = false}) {
      return SliverAppBar(
        expandedHeight: 100.0,
        floating: true,
        snap: true,
        pinned: false,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 2,
        shadowColor: colorScheme.shadow.withOpacity(0.15),
        flexibleSpace: FlexibleSpaceBar(
          title: Row(
            children: [
              Icon(
                Icons.dashboard_rounded,
                color: colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'ToolKit Pro',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.tertiaryContainer,
                ],
              ),
            ),
          ),
        ),
        actions: [
          if (showClearHistory)
            IconButton(
              onPressed: _history.isEmpty ? null : _clearHistory,
              icon: Icon(
                Icons.delete_sweep_rounded,
                color: _history.isEmpty ? Colors.grey : colorScheme.error,
              ),
              tooltip: 'Clear history',
            ),
          IconButton(
            onPressed: themeService.toggleTheme,
            icon: Icon(
              themeService.isDark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
          ),
          IconButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Settings coming soon!'),
                behavior: SnackBarBehavior.floating,
              ),
            ),
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      );
    }

    return FadeTransition(
      opacity: _fadeIn,
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // ── Home ──
            _HomeTab(
              appBar: buildAppBar(),
              filteredTools: homeFiltered,
              categories: _categories,
              selectedCategory: _selectedCategory,
              onCategorySelected: (c) => setState(() => _selectedCategory = c),
              searchController: _searchController,
              query: _query,
              favoriteTitles: _favoriteToolTitles,
              onToggleFavorite: _toggleFavorite,
              onToolTap: (tool) {
                _logHistory(tool.title);
                tool.onTap?.call();
              },
              navBarClearance: navBarClearance,
            ),

            // ── Tools ──
            _ToolsTab(
              appBar: buildAppBar(),
              filteredTools: toolsFiltered,
              searchController: _searchToolsController,
              query: _queryTools,
              favoriteTitles: _favoriteToolTitles,
              onToggleFavorite: _toggleFavorite,
              onToolTap: (tool) {
                _logHistory(tool.title);
                tool.onTap?.call();
              },
              navBarClearance: navBarClearance,
            ),

            // ── Favorites ──
            _FavoritesTab(
              appBar: buildAppBar(),
              filteredFavorites: favoritesFiltered,
              searchController: _searchFavoritesController,
              query: _queryFavorites,
              favoriteTitles: _favoriteToolTitles,
              onToggleFavorite: _toggleFavorite,
              onToolTap: (tool) {
                _logHistory(tool.title);
                tool.onTap?.call();
              },
              navBarClearance: navBarClearance,
            ),

            // ── History ──
            _HistoryTab(
              appBar: buildAppBar(showClearHistory: true),
              history: _history,
              onDeleteEntry: _deleteHistoryEntry,
              navBarClearance: navBarClearance,
            ),
          ],
        ),

        // ── Elevated bottom nav bar ──
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            border: Border(
              top: BorderSide(
                color: colorScheme.outlineVariant.withOpacity(0.4),
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: RollingBottomBar(
            controller: _pageController,
            items: const [
              RollingBottomBarItem(Icons.home_rounded, label: 'Home'),
              RollingBottomBarItem(Icons.grid_view_rounded, label: 'Tools'),
              RollingBottomBarItem(Icons.favorite_rounded, label: 'Favorites'),
              RollingBottomBarItem(Icons.history_rounded, label: 'History'),
            ],
            activeItemColor: colorScheme.primary,
            enableIconRotation: true,
            flat: false,
            onTap: (index) => _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutCubic,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Home Tab
// ─────────────────────────────────────────────────────────────────────────────
class _HomeTab extends StatefulWidget {
  final Widget appBar;
  final List<_ToolItem> filteredTools;
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;
  final TextEditingController searchController;
  final String query;
  final Set<String> favoriteTitles;
  final ValueChanged<String> onToggleFavorite;
  final ValueChanged<_ToolItem> onToolTap;
  final double navBarClearance;

  const _HomeTab({
    required this.appBar,
    required this.filteredTools,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.searchController,
    required this.query,
    required this.favoriteTitles,
    required this.onToggleFavorite,
    required this.onToolTap,
    required this.navBarClearance,
  });

  @override
  State<_HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<_HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colorScheme = Theme.of(context).colorScheme;

    return CustomScrollView(
      slivers: [
        widget.appBar,
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back!',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 4),
                Text(
                  'Fast utilities, clean workflow, pro interface.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 18),
                // Hero banner
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.primaryContainer,
                        colorScheme.tertiaryContainer,
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Professional workspace',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Search, launch, and manage your tools from one premium dashboard.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                          color: colorScheme.surface.withOpacity(0.35),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.auto_awesome_rounded,
                          size: 34,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                SearchBar(
                  controller: widget.searchController,
                  hintText: 'Search tools, calculators, PDFs...',
                  leading: const Icon(Icons.search_rounded),
                  trailing: const [Icon(Icons.tune_rounded)],
                  elevation: const WidgetStatePropertyAll(0),
                  backgroundColor: WidgetStatePropertyAll(
                    colorScheme.surfaceContainerHighest.withOpacity(0.75),
                  ),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 18),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Category chips
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, i) {
                  final cat = widget.categories[i];
                  final selected = cat == widget.selectedCategory;
                  return AnimatedScale(
                    scale: selected ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOutCubic,
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: selected,
                      onSelected: (_) => widget.onCategorySelected(cat),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // Section header
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured tools',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: Text(
                    '${widget.filteredTools.length} shown',
                    key: ValueKey(widget.filteredTools.length),
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        if (widget.filteredTools.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: _EmptyState(
              query: widget.query,
              category: widget.selectedCategory,
            ),
          )
        else
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, widget.navBarClearance),
            sliver: SliverGrid(
              gridDelegate: _kGridDelegate,
              delegate: SliverChildBuilderDelegate((context, i) {
                final tool = widget.filteredTools[i];
                return _StaggeredToolCard(
                  tool: tool,
                  index: i,
                  isFavorite: widget.favoriteTitles.contains(tool.title),
                  onToggleFavorite: () => widget.onToggleFavorite(tool.title),
                  onToolTap: () => widget.onToolTap(tool),
                );
              }, childCount: widget.filteredTools.length),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tools Tab
// ─────────────────────────────────────────────────────────────────────────────
class _ToolsTab extends StatefulWidget {
  final Widget appBar;
  final List<_ToolItem> filteredTools;
  final TextEditingController searchController;
  final String query;
  final Set<String> favoriteTitles;
  final ValueChanged<String> onToggleFavorite;
  final ValueChanged<_ToolItem> onToolTap;
  final double navBarClearance;

  const _ToolsTab({
    required this.appBar,
    required this.filteredTools,
    required this.searchController,
    required this.query,
    required this.favoriteTitles,
    required this.onToggleFavorite,
    required this.onToolTap,
    required this.navBarClearance,
  });

  @override
  State<_ToolsTab> createState() => _ToolsTabState();
}

class _ToolsTabState extends State<_ToolsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colorScheme = Theme.of(context).colorScheme;

    return CustomScrollView(
      slivers: [
        widget.appBar,
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
            child: SearchBar(
              controller: widget.searchController,
              hintText: 'Search all tools...',
              leading: const Icon(Icons.search_rounded),
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(
                colorScheme.surfaceContainerHighest.withOpacity(0.75),
              ),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 18),
              ),
            ),
          ),
        ),
        if (widget.filteredTools.isEmpty)
          SliverFillRemaining(
            child: _EmptyState(query: widget.query, category: 'All Tools'),
          )
        else
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, widget.navBarClearance),
            sliver: SliverGrid(
              gridDelegate: _kGridDelegate,
              delegate: SliverChildBuilderDelegate((context, i) {
                final tool = widget.filteredTools[i];
                return _StaggeredToolCard(
                  tool: tool,
                  index: i,
                  isFavorite: widget.favoriteTitles.contains(tool.title),
                  onToggleFavorite: () => widget.onToggleFavorite(tool.title),
                  onToolTap: () => widget.onToolTap(tool),
                );
              }, childCount: widget.filteredTools.length),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Favorites Tab
// ─────────────────────────────────────────────────────────────────────────────
class _FavoritesTab extends StatefulWidget {
  final Widget appBar;
  final List<_ToolItem> filteredFavorites;
  final TextEditingController searchController;
  final String query;
  final Set<String> favoriteTitles;
  final ValueChanged<String> onToggleFavorite;
  final ValueChanged<_ToolItem> onToolTap;
  final double navBarClearance;

  const _FavoritesTab({
    required this.appBar,
    required this.filteredFavorites,
    required this.searchController,
    required this.query,
    required this.favoriteTitles,
    required this.onToggleFavorite,
    required this.onToolTap,
    required this.navBarClearance,
  });

  @override
  State<_FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<_FavoritesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colorScheme = Theme.of(context).colorScheme;

    return CustomScrollView(
      slivers: [
        widget.appBar,
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
            child: SearchBar(
              controller: widget.searchController,
              hintText: 'Search favorites...',
              leading: const Icon(Icons.search_rounded),
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(
                colorScheme.surfaceContainerHighest.withOpacity(0.75),
              ),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 18),
              ),
            ),
          ),
        ),
        if (widget.filteredFavorites.isEmpty)
          const SliverFillRemaining(child: _EmptyFavoritesState())
        else
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, widget.navBarClearance),
            sliver: SliverGrid(
              gridDelegate: _kGridDelegate,
              delegate: SliverChildBuilderDelegate((context, i) {
                final tool = widget.filteredFavorites[i];
                return _StaggeredToolCard(
                  tool: tool,
                  index: i,
                  isFavorite: true,
                  onToggleFavorite: () => widget.onToggleFavorite(tool.title),
                  onToolTap: () => widget.onToolTap(tool),
                );
              }, childCount: widget.filteredFavorites.length),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// History Tab
// ─────────────────────────────────────────────────────────────────────────────
class _HistoryTab extends StatefulWidget {
  final Widget appBar;
  final List<HistoryEntry> history;
  final ValueChanged<int> onDeleteEntry;
  final double navBarClearance;

  const _HistoryTab({
    required this.appBar,
    required this.history,
    required this.onDeleteEntry,
    required this.navBarClearance,
  });

  @override
  State<_HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<_HistoryTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colorScheme = Theme.of(context).colorScheme;

    return CustomScrollView(
      slivers: [
        widget.appBar,
        if (widget.history.isEmpty)
          const SliverFillRemaining(child: _EmptyHistoryState())
        else
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, widget.navBarClearance),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, i) {
                final entry = widget.history[i];
                return Dismissible(
                  key: ValueKey(
                    '${entry.toolTitle}_${entry.timestamp.millisecondsSinceEpoch}',
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => widget.onDeleteEntry(i),
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.delete_rounded,
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colorScheme.primaryContainer,
                        child: Icon(
                          Icons.history_rounded,
                          color: colorScheme.primary,
                        ),
                      ),
                      title: Text(
                        entry.toolTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(entry.formattedDateTime),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: colorScheme.error.withOpacity(0.6),
                        ),
                        onPressed: () => widget.onDeleteEntry(i),
                        tooltip: 'Remove',
                      ),
                    ),
                  ),
                );
              }, childCount: widget.history.length),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Staggered Tool Card
// ─────────────────────────────────────────────────────────────────────────────
class _StaggeredToolCard extends StatefulWidget {
  final _ToolItem tool;
  final int index;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToolTap;

  const _StaggeredToolCard({
    required this.tool,
    required this.index,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onToolTap,
  });

  @override
  State<_StaggeredToolCard> createState() => _StaggeredToolCardState();
}

class _StaggeredToolCardState extends State<_StaggeredToolCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    Future.delayed(
      Duration(milliseconds: (widget.index * 35).clamp(0, 280)),
      () {
        if (mounted) _ctrl.forward();
      },
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: _ToolCard(
          tool: widget.tool,
          isFavorite: widget.isFavorite,
          onToggleFavorite: widget.onToggleFavorite,
          onToolTap: widget.onToolTap,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tool Card
// ─────────────────────────────────────────────────────────────────────────────
class _ToolCard extends StatefulWidget {
  final _ToolItem tool;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToolTap;

  const _ToolCard({
    required this.tool,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onToolTap,
  });

  @override
  State<_ToolCard> createState() => _ToolCardState();
}

class _ToolCardState extends State<_ToolCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressCtrl;
  late final Animation<double> _pressScale;

  @override
  void initState() {
    super.initState();
    _pressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 200),
    );
    _pressScale = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _pressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tool = widget.tool;

    return ScaleTransition(
      scale: _pressScale,
      child: GestureDetector(
        onTapDown: (_) => _pressCtrl.forward(),
        onTapUp: (_) => _pressCtrl.reverse(),
        onTapCancel: () => _pressCtrl.reverse(),
        onTap: tool.implemented
            ? widget.onToolTap
            : () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${tool.title} is coming soon.'),
                  behavior: SnackBarBehavior.floating,
                ),
              ),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: colorScheme.outlineVariant.withOpacity(0.25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Live/Soon badge
              Positioned(
                top: 14,
                right: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: tool.implemented
                        ? tool.color.withOpacity(0.12)
                        : Colors.grey.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    tool.implemented ? 'Live' : 'Soon',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: tool.implemented ? tool.color : Colors.grey,
                    ),
                  ),
                ),
              ),
              // Star button
              Positioned(
                top: 48,
                right: 14,
                child: GestureDetector(
                  onTap: widget.onToggleFavorite,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: widget.isFavorite
                          ? Colors.amber.withOpacity(0.15)
                          : Colors.black.withOpacity(0.06),
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        widget.isFavorite
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        key: ValueKey(widget.isFavorite),
                        color: widget.isFavorite ? Colors.amber : Colors.grey,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: 'tool-icon-${tool.title}',
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              tool.color.withOpacity(0.95),
                              tool.color.withOpacity(0.55),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(tool.icon, color: Colors.white, size: 29),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tool.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          tool.subtitle,
                          maxLines: 2,
                          style: TextStyle(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 12.5,
                            height: 1.25,
                          ),
                        ),
                      ],
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
}

// ─────────────────────────────────────────────────────────────────────────────
// Empty States
// ─────────────────────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final String query;
  final String category;
  const _EmptyState({required this.query, required this.category});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 94,
              height: 94,
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                Icons.search_off_rounded,
                size: 44,
                color: cs.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'No matching tools',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              query.isEmpty
                  ? 'No tools found in $category.'
                  : 'Nothing matches "$query". Try another keyword.',
              textAlign: TextAlign.center,
              style: TextStyle(color: cs.onSurfaceVariant, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyFavoritesState extends StatelessWidget {
  const _EmptyFavoritesState();
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 94,
              height: 94,
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                size: 44,
                color: cs.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'No favorites yet',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the star on any tool card to save it here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: cs.onSurfaceVariant, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyHistoryState extends StatelessWidget {
  const _EmptyHistoryState();
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 94,
              height: 94,
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                Icons.history_rounded,
                size: 44,
                color: cs.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'No history yet',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              'Your recently used tools will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: cs.onSurfaceVariant, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Data model
// ─────────────────────────────────────────────────────────────────────────────
class _ToolItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String category;
  final bool implemented;
  final VoidCallback? onTap;

  const _ToolItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.category,
    required this.implemented,
    this.onTap,
  });
}
