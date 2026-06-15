import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme_service.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Media',
    'PDF',
    'Calculators',
    'Scanning',
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _query = _searchController.text.toLowerCase().trim();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          MaterialPageRoute(builder: (_) => const QrCodeGeneratorScreen()),
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
          MaterialPageRoute(builder: (_) => const BarcodeGeneratorScreen()),
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
          MaterialPageRoute(builder: (_) => const ImageCompressorScreen()),
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
          MaterialPageRoute(builder: (_) => const AgeCalculatorScreen()),
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
          MaterialPageRoute(builder: (_) => const BmiCalculatorScreen()),
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
          MaterialPageRoute(builder: (_) => const UnitConverterScreen()),
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
          MaterialPageRoute(builder: (_) => const PdfMergeScreen()),
        ),
      ),
      _ToolItem(
        title: 'PDF Split',
        subtitle: 'Split PDF pages',
        icon: Icons.call_split_rounded,
        color: Colors.pink,
        category: 'PDF',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PdfSplit()),
        ),
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
          MaterialPageRoute(builder: (_) => const ImageToPdfScreen()),
        ),
      ),
      _ToolItem(
        title: 'Image Converter',
        subtitle: 'Change image formats',
        icon: Icons.image_rounded,
        color: Colors.deepOrange,
        category: 'Media',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ImageConverterScreen()),
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
          MaterialPageRoute(builder: (_) => const ImageResizerScreen()),
        ),
      ),
      _ToolItem(
        title: 'QR / Barcode Scanner',
        subtitle: 'Scan codes with camera',
        icon: Icons.document_scanner_rounded,
        color: Colors.deepPurple,
        category: 'Scanning',
        implemented: true,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const QrBarcodeScannerScreen()),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final themeService = context.watch<ThemeService>();
    final colorScheme = Theme.of(context).colorScheme;

    final allTools = _tools(context);
    final filteredTools = allTools.where((tool) {
      final matchesQuery =
          _query.isEmpty ||
          tool.title.toLowerCase().contains(_query) ||
          tool.subtitle.toLowerCase().contains(_query) ||
          tool.category.toLowerCase().contains(_query);

      final matchesCategory =
          _selectedCategory == 'All' || tool.category == _selectedCategory;

      return matchesQuery && matchesCategory;
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.primary,
                                colorScheme.tertiary,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.dashboard_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ToolKit Pro',
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: -0.5,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Fast utilities, clean workflow, pro interface',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        IconButton.filledTonal(
                          onPressed: () =>
                              context.read<ThemeService>().toggleTheme(),
                          icon: Icon(
                            themeService.isDark
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
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
                      controller: _searchController,
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                child: SizedBox(
                  height: 42,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      final selected = category == _selectedCategory;

                      return ChoiceChip(
                        label: Text(category),
                        selected: selected,
                        onSelected: (_) {
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured tools',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '${filteredTools.length} shown',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (filteredTools.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: _EmptyState(query: _query, category: _selectedCategory),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.82,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final tool = filteredTools[index];
                    return _ToolCard(tool: tool);
                  }, childCount: filteredTools.length),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ToolCard extends StatelessWidget {
  final _ToolItem tool;
  const _ToolCard({required this.tool});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: tool.implemented
          ? tool.onTap
          : () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${tool.title} is coming soon.'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
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
            Positioned(
              top: 14,
              right: 14,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String query;
  final String category;

  const _EmptyState({required this.query, required this.category});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                Icons.search_off_rounded,
                size: 44,
                color: colorScheme.onPrimaryContainer,
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
                  : 'Nothing matches "$query". Try another keyword or category.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
