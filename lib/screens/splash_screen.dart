import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnim;

  final List<_SplashData> _pages = [
    _SplashData(
      icon: Icons.dashboard_rounded,
      title: 'Welcome to ToolKit Pro',
      subtitle:
          'Your all-in-one professional workspace for everyday utilities — fast, clean, and powerful.',
      gradient: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
    ),
    _SplashData(
      icon: Icons.auto_awesome_rounded,
      title: '12 Tools, One App',
      subtitle:
          'QR codes, PDF tools, image utilities, calculators, scanners — everything you need in one place.',
      gradient: [Color(0xFF0EA5E9), Color(0xFF0369A1)],
    ),
    _SplashData(
      icon: Icons.bolt_rounded,
      title: 'Fast & Offline Ready',
      subtitle:
          'Lightweight, snappy, and designed to work without an internet connection. Pro workflow, zero friction.',
      gradient: [Color(0xFF10B981), Color(0xFF047857)],
    ),
  ];

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _goToHome() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, animation, __) =>
            FadeTransition(opacity: animation, child: const HomeScreen()),
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _goToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final page = _pages[_currentPage];

    return FadeTransition(
      opacity: _fadeAnim,
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: page.gradient,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // ── Skip button ─────────────────────────────────────────
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 20, 0),
                    child: AnimatedOpacity(
                      opacity: _currentPage < _pages.length - 1 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      child: TextButton(
                        onPressed: _goToHome,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white70,
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ── PageView ────────────────────────────────────────────
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (i) => setState(() => _currentPage = i),
                    itemBuilder: (context, index) =>
                        _SplashPage(data: _pages[index], size: size),
                  ),
                ),

                // ── Dots + button ───────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 28, 36),
                  child: Column(
                    children: [
                      // Dot indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                          (i) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 6,
                            width: _currentPage == i ? 28 : 6,
                            decoration: BoxDecoration(
                              color: _currentPage == i
                                  ? Colors.white
                                  : Colors.white38,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // CTA button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: page.gradient.first,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: Text(
                              _currentPage == _pages.length - 1
                                  ? 'Get Started'
                                  : 'Continue',
                              key: ValueKey(_currentPage),
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Single splash page content
// ─────────────────────────────────────────────────────────────────────────────
class _SplashPage extends StatefulWidget {
  final _SplashData data;
  final Size size;

  const _SplashPage({required this.data, required this.size});

  @override
  State<_SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<_SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    _scale = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    _ctrl.forward();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon blob
              ScaleTransition(
                scale: _scale,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(44),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.25),
                      width: 1.5,
                    ),
                  ),
                  child: Icon(widget.data.icon, size: 72, color: Colors.white),
                ),
              ),
              const SizedBox(height: 44),

              // App badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'TOOLKIT PRO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    letterSpacing: 2.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                widget.data.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  height: 1.2,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 16),

              // Subtitle
              Text(
                widget.data.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.82),
                  fontSize: 15.5,
                  height: 1.55,
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
// Data model
// ─────────────────────────────────────────────────────────────────────────────
class _SplashData {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> gradient;

  const _SplashData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.gradient,
  });
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../services/theme_service.dart';
// import 'home_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   // Onboarding data – use your app’s features and icons
//   final List<Map<String, dynamic>> _pages = [
//     {
//       'title': 'QR & Barcode Tools',
//       'subtitle': 'Generate and scan codes instantly',
//       'icon': Icons.qr_code_scanner_rounded,
//       'color': Colors.deepPurple,
//     },
//     {
//       'title': 'PDF Utilities',
//       'subtitle': 'Merge, split, compress, and convert PDFs',
//       'icon': Icons.picture_as_pdf_rounded,
//       'color': Colors.redAccent,
//     },
//     {
//       'title': 'Media & Calculators',
//       'subtitle': 'Compress images, convert formats, calculate BMI & more',
//       'icon': Icons.auto_awesome_rounded,
//       'color': Colors.teal,
//     },
//   ];

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _goToHome() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const HomeScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeService = context.watch<ThemeService>();
//     final colorScheme = Theme.of(context).colorScheme;
//     final isDark = themeService.isDark;

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // PageView (3 pages)
//             Expanded(
//               flex: 3,
//               child: PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   setState(() => _currentPage = index);
//                 },
//                 itemCount: _pages.length,
//                 itemBuilder: (context, index) {
//                   final page = _pages[index];
//                   return _SplashPage(
//                     icon: page['icon'],
//                     title: page['title'],
//                     subtitle: page['subtitle'],
//                     color: page['color'],
//                   );
//                 },
//               ),
//             ),
//             // Bottom section: indicators + button
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Column(
//                   children: [
//                     const Spacer(),
//                     // Page indicators
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(
//                         _pages.length,
//                         (index) => AnimatedContainer(
//                           duration: const Duration(milliseconds: 250),
//                           margin: const EdgeInsets.only(right: 6),
//                           height: 6,
//                           width: _currentPage == index ? 24 : 6,
//                           decoration: BoxDecoration(
//                             color: _currentPage == index
//                                 ? colorScheme.primary
//                                 : colorScheme.outlineVariant,
//                             borderRadius: BorderRadius.circular(3),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Spacer(flex: 2),
//                     // Continue / Get Started button
//                     ElevatedButton(
//                       onPressed: () {
//                         // If last page, go to home; else go to next page
//                         if (_currentPage == _pages.length - 1) {
//                           _goToHome();
//                         } else {
//                           _pageController.nextPage(
//                             duration: const Duration(milliseconds: 400),
//                             curve: Curves.easeInOut,
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         backgroundColor: colorScheme.primary,
//                         foregroundColor: colorScheme.onPrimary,
//                         minimumSize: const Size(double.infinity, 52),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: Text(
//                         _currentPage == _pages.length - 1
//                             ? 'Get Started'
//                             : 'Continue',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Individual page widget
// class _SplashPage extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//   final Color color;

//   const _SplashPage({
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 32),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // App logo / icon
//           Container(
//             width: 120,
//             height: 120,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [color, color.withOpacity(0.6)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(36),
//               boxShadow: [
//                 BoxShadow(
//                   color: color.withOpacity(0.3),
//                   blurRadius: 30,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Icon(icon, size: 64, color: Colors.white),
//           ),
//           const SizedBox(height: 32),
//           // Title
//           Text(
//             title,
//             style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//               fontWeight: FontWeight.w900,
//               letterSpacing: -0.5,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 12),
//           // Subtitle
//           Text(
//             subtitle,
//             style: Theme.of(context).textTheme.titleMedium?.copyWith(
//               color: colorScheme.onSurfaceVariant,
//               height: 1.4,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           // Small "ToolKit Pro" tag
//           Chip(
//             label: Text(
//               'ToolKit Pro',
//               style: TextStyle(
//                 color: colorScheme.primary,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             backgroundColor: colorScheme.primaryContainer,
//             side: BorderSide.none,
//           ),
//         ],
//       ),
//     );
//   }
// }
