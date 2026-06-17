// // // import 'package:flutter/material.dart';

// // // /// Centralized page transition utilities for ToolKit Pro.
// // // /// All screen navigations should use one of these builders for consistency.
// // // class AppTransitions {
// // //   AppTransitions._();

// // //   // ── Durations ──────────────────────────────────────────────────────────────
// // //   static const Duration fast = Duration(milliseconds: 250);
// // //   static const Duration normal = Duration(milliseconds: 340);
// // //   static const Duration slow = Duration(milliseconds: 480);

// // //   // ── Curves ────────────────────────────────────────────────────────────────
// // //   static const Curve enter = Curves.easeOutCubic;
// // //   static const Curve exit = Curves.easeInCubic;

// // //   // ── Route builders ────────────────────────────────────────────────────────

// // //   /// Slide up from bottom + fade. Great for detail / feature screens.
// // //   static PageRouteBuilder<T> slideUp<T>(
// // //     Widget page, {
// // //     Duration duration = normal,
// // //     RouteSettings? settings,
// // //   }) {
// // //     return PageRouteBuilder<T>(
// // //       settings: settings,
// // //       transitionDuration: duration,
// // //       reverseTransitionDuration: fast,
// // //       pageBuilder: (_, __, ___) => page,
// // //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
// // //         final slide = Tween<Offset>(
// // //           begin: const Offset(0, 0.06),
// // //           end: Offset.zero,
// // //         ).animate(CurvedAnimation(parent: animation, curve: enter));

// // //         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
// // //           CurvedAnimation(
// // //             parent: animation,
// // //             curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
// // //           ),
// // //         );

// // //         // Secondary: outgoing screen fades out slightly
// // //         final secondaryFade = Tween<double>(
// // //           begin: 1.0,
// // //           end: 0.92,
// // //         ).animate(CurvedAnimation(parent: secondaryAnimation, curve: exit));

// // //         return FadeTransition(
// // //           opacity: secondaryFade,
// // //           child: FadeTransition(
// // //             opacity: fade,
// // //             child: SlideTransition(position: slide, child: child),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }

// // //   /// Slide in from the right + fade. Standard lateral navigation.
// // //   static PageRouteBuilder<T> slideRight<T>(
// // //     Widget page, {
// // //     Duration duration = normal,
// // //     RouteSettings? settings,
// // //   }) {
// // //     return PageRouteBuilder<T>(
// // //       settings: settings,
// // //       transitionDuration: duration,
// // //       reverseTransitionDuration: fast,
// // //       pageBuilder: (_, __, ___) => page,
// // //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
// // //         final slide = Tween<Offset>(
// // //           begin: const Offset(0.06, 0),
// // //           end: Offset.zero,
// // //         ).animate(CurvedAnimation(parent: animation, curve: enter));

// // //         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
// // //           CurvedAnimation(
// // //             parent: animation,
// // //             curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
// // //           ),
// // //         );

// // //         return FadeTransition(
// // //           opacity: fade,
// // //           child: SlideTransition(position: slide, child: child),
// // //         );
// // //       },
// // //     );
// // //   }

// // //   /// Pure cross-fade. Good for settings / theme toggles.
// // //   static PageRouteBuilder<T> fade<T>(
// // //     Widget page, {
// // //     Duration duration = normal,
// // //     RouteSettings? settings,
// // //   }) {
// // //     return PageRouteBuilder<T>(
// // //       settings: settings,
// // //       transitionDuration: duration,
// // //       reverseTransitionDuration: fast,
// // //       pageBuilder: (_, __, ___) => page,
// // //       transitionsBuilder: (_, animation, __, child) {
// // //         return FadeTransition(
// // //           opacity: CurvedAnimation(parent: animation, curve: enter),
// // //           child: child,
// // //         );
// // //       },
// // //     );
// // //   }

// // //   /// Scale + fade. Ideal for launching tools from a card (feels like "opening").
// // //   static PageRouteBuilder<T> scaleUp<T>(
// // //     Widget page, {
// // //     Duration duration = normal,
// // //     RouteSettings? settings,
// // //   }) {
// // //     return PageRouteBuilder<T>(
// // //       settings: settings,
// // //       transitionDuration: duration,
// // //       reverseTransitionDuration: fast,
// // //       pageBuilder: (_, __, ___) => page,
// // //       transitionsBuilder: (_, animation, secondaryAnimation, child) {
// // //         final scale = Tween<double>(
// // //           begin: 0.96,
// // //           end: 1.0,
// // //         ).animate(CurvedAnimation(parent: animation, curve: enter));

// // //         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
// // //           CurvedAnimation(
// // //             parent: animation,
// // //             curve: const Interval(0.0, 0.55, curve: Curves.easeOut),
// // //           ),
// // //         );

// // //         final secondaryFade = Tween<double>(
// // //           begin: 1.0,
// // //           end: 0.88,
// // //         ).animate(CurvedAnimation(parent: secondaryAnimation, curve: exit));

// // //         return FadeTransition(
// // //           opacity: secondaryFade,
// // //           child: ScaleTransition(
// // //             scale: scale,
// // //             child: FadeTransition(opacity: fade, child: child),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';

// // /// Centralized page transition utilities for ToolKit Pro.
// // /// All screen navigations should use one of these builders for consistency.
// // class AppTransitions {
// //   AppTransitions._();

// //   // ── Durations ──────────────────────────────────────────────────────────────
// //   static const Duration fast = Duration(milliseconds: 250);
// //   static const Duration normal = Duration(milliseconds: 340);
// //   static const Duration slow = Duration(milliseconds: 480);

// //   // ── Curves ────────────────────────────────────────────────────────────────
// //   static const Curve enter = Curves.easeOutCubic;
// //   static const Curve exit = Curves.easeInCubic;

// //   // ── Route builders ────────────────────────────────────────────────────────

// //   /// Slide up from bottom + fade. Great for detail / feature screens.
// //   static PageRouteBuilder<T> slideUp<T>(
// //     Widget page, {
// //     Duration duration = normal,
// //     RouteSettings? settings,
// //   }) {
// //     return PageRouteBuilder<T>(
// //       settings: settings,
// //       transitionDuration: duration,
// //       reverseTransitionDuration: fast,
// //       pageBuilder: (_, __, ___) => page,
// //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
// //         final slide = Tween<Offset>(
// //           begin: const Offset(0, 0.06),
// //           end: Offset.zero,
// //         ).animate(CurvedAnimation(parent: animation, curve: enter));

// //         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
// //           CurvedAnimation(
// //             parent: animation,
// //             curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
// //           ),
// //         );

// //         // Secondary: outgoing screen fades out slightly
// //         final secondaryFade = Tween<double>(
// //           begin: 1.0,
// //           end: 0.92,
// //         ).animate(CurvedAnimation(parent: secondaryAnimation, curve: exit));

// //         return FadeTransition(
// //           opacity: secondaryFade,
// //           child: FadeTransition(
// //             opacity: fade,
// //             child: SlideTransition(position: slide, child: child),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   /// Slide in from the right + fade. Standard lateral navigation.
// //   static PageRouteBuilder<T> slideRight<T>(
// //     Widget page, {
// //     Duration duration = normal,
// //     RouteSettings? settings,
// //   }) {
// //     return PageRouteBuilder<T>(
// //       settings: settings,
// //       transitionDuration: duration,
// //       reverseTransitionDuration: fast,
// //       pageBuilder: (_, __, ___) => page,
// //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
// //         final slide = Tween<Offset>(
// //           begin: const Offset(0.06, 0),
// //           end: Offset.zero,
// //         ).animate(CurvedAnimation(parent: animation, curve: enter));

// //         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
// //           CurvedAnimation(
// //             parent: animation,
// //             curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
// //           ),
// //         );

// //         return FadeTransition(
// //           opacity: fade,
// //           child: SlideTransition(position: slide, child: child),
// //         );
// //       },
// //     );
// //   }

// //   /// Pure cross-fade. Good for settings / theme toggles.
// //   static PageRouteBuilder<T> fade<T>(
// //     Widget page, {
// //     Duration duration = normal,
// //     RouteSettings? settings,
// //   }) {
// //     return PageRouteBuilder<T>(
// //       settings: settings,
// //       transitionDuration: duration,
// //       reverseTransitionDuration: fast,
// //       pageBuilder: (_, __, ___) => page,
// //       transitionsBuilder: (_, animation, __, child) {
// //         return FadeTransition(
// //           opacity: CurvedAnimation(parent: animation, curve: enter),
// //           child: child,
// //         );
// //       },
// //     );
// //   }

// //   /// Slides up from the bottom on enter, slides back down on exit.
// //   /// The reverse (back navigation) mirrors the enter — screen drops away downward.
// //   static PageRouteBuilder<T> bottomSheet<T>(
// //     Widget page, {
// //     Duration duration = normal,
// //     RouteSettings? settings,
// //   }) {
// //     return PageRouteBuilder<T>(
// //       settings: settings,
// //       transitionDuration: duration,
// //       reverseTransitionDuration: duration,
// //       pageBuilder: (_, __, ___) => page,
// //       transitionsBuilder: (_, animation, __, child) {
// //         final slide =
// //             Tween<Offset>(
// //               begin: const Offset(
// //                 0,
// //                 1,
// //               ), // starts fully off-screen at the bottom
// //               end: Offset.zero,
// //             ).animate(
// //               CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
// //             );

// //         return SlideTransition(position: slide, child: child);
// //       },
// //     );
// //   }

// //   /// Scale + fade. Ideal for launching tools from a card (feels like "opening").
// //   static PageRouteBuilder<T> scaleUp<T>(
// //     Widget page, {
// //     Duration duration = normal,
// //     RouteSettings? settings,
// //   }) {
// //     return PageRouteBuilder<T>(
// //       settings: settings,
// //       transitionDuration: duration,
// //       reverseTransitionDuration: fast,
// //       pageBuilder: (_, __, ___) => page,
// //       transitionsBuilder: (_, animation, secondaryAnimation, child) {
// //         final scale = Tween<double>(
// //           begin: 0.96,
// //           end: 1.0,
// //         ).animate(CurvedAnimation(parent: animation, curve: enter));

// //         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
// //           CurvedAnimation(
// //             parent: animation,
// //             curve: const Interval(0.0, 0.55, curve: Curves.easeOut),
// //           ),
// //         );

// //         final secondaryFade = Tween<double>(
// //           begin: 1.0,
// //           end: 0.88,
// //         ).animate(CurvedAnimation(parent: secondaryAnimation, curve: exit));

// //         return FadeTransition(
// //           opacity: secondaryFade,
// //           child: ScaleTransition(
// //             scale: scale,
// //             child: FadeTransition(opacity: fade, child: child),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// /// Centralized page transition utilities for ToolKit Pro.
// /// All screen navigations should use one of these builders for consistency.
// class AppTransitions {
//   AppTransitions._();

//   // ── Durations ──────────────────────────────────────────────────────────────
//   static const Duration fast = Duration(milliseconds: 250);
//   static const Duration normal = Duration(milliseconds: 340);
//   static const Duration slow = Duration(milliseconds: 480);

//   // ── Curves ────────────────────────────────────────────────────────────────
//   static const Curve enter = Curves.easeOutCubic;
//   static const Curve exit = Curves.easeInCubic;

//   // ── Route builders ────────────────────────────────────────────────────────

//   /// Slide up from bottom + fade. Great for detail / feature screens.
//   static PageRouteBuilder<T> slideUp<T>(
//     Widget page, {
//     Duration duration = normal,
//     RouteSettings? settings,
//   }) {
//     return PageRouteBuilder<T>(
//       settings: settings,
//       transitionDuration: duration,
//       reverseTransitionDuration: fast,
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         final slide = Tween<Offset>(
//           begin: const Offset(0, 0.06),
//           end: Offset.zero,
//         ).animate(CurvedAnimation(parent: animation, curve: enter));

//         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
//           CurvedAnimation(
//             parent: animation,
//             curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
//           ),
//         );

//         // Secondary: outgoing screen fades out slightly
//         final secondaryFade = Tween<double>(
//           begin: 1.0,
//           end: 0.92,
//         ).animate(CurvedAnimation(parent: secondaryAnimation, curve: exit));

//         return FadeTransition(
//           opacity: secondaryFade,
//           child: FadeTransition(
//             opacity: fade,
//             child: SlideTransition(position: slide, child: child),
//           ),
//         );
//       },
//     );
//   }

//   /// Slide in from the right + fade. Standard lateral navigation.
//   static PageRouteBuilder<T> slideRight<T>(
//     Widget page, {
//     Duration duration = normal,
//     RouteSettings? settings,
//   }) {
//     return PageRouteBuilder<T>(
//       settings: settings,
//       transitionDuration: duration,
//       reverseTransitionDuration: fast,
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         final slide = Tween<Offset>(
//           begin: const Offset(0.06, 0),
//           end: Offset.zero,
//         ).animate(CurvedAnimation(parent: animation, curve: enter));

//         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
//           CurvedAnimation(
//             parent: animation,
//             curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
//           ),
//         );

//         return FadeTransition(
//           opacity: fade,
//           child: SlideTransition(position: slide, child: child),
//         );
//       },
//     );
//   }

//   /// Pure cross-fade. Good for settings / theme toggles.
//   static PageRouteBuilder<T> fade<T>(
//     Widget page, {
//     Duration duration = normal,
//     RouteSettings? settings,
//   }) {
//     return PageRouteBuilder<T>(
//       settings: settings,
//       transitionDuration: duration,
//       reverseTransitionDuration: fast,
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (_, animation, __, child) {
//         return FadeTransition(
//           opacity: CurvedAnimation(parent: animation, curve: enter),
//           child: child,
//         );
//       },
//     );
//   }

//   /// Slides up from the bottom on enter, slides back down on exit.
//   /// The reverse (back navigation) mirrors the enter — screen drops away downward.
//   static PageRouteBuilder<T> bottomSheet<T>(
//     Widget page, {
//     Duration duration = normal,
//     RouteSettings? settings,
//   }) {
//     return PageRouteBuilder<T>(
//       settings: settings,
//       transitionDuration: duration,
//       reverseTransitionDuration: duration,
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (_, animation, __, child) {
//         final slide =
//             Tween<Offset>(
//               begin: const Offset(
//                 0,
//                 1,
//               ), // starts fully off-screen at the bottom
//               end: Offset.zero,
//             ).animate(
//               CurvedAnimation(parent: animation, curve: Curves.easeOutExpo),
//             );

//         return SlideTransition(position: slide, child: child);
//       },
//     );
//   }

//   /// Scale + fade. Ideal for launching tools from a card (feels like "opening").
//   static PageRouteBuilder<T> scaleUp<T>(
//     Widget page, {
//     Duration duration = normal,
//     RouteSettings? settings,
//   }) {
//     return PageRouteBuilder<T>(
//       settings: settings,
//       transitionDuration: duration,
//       reverseTransitionDuration: fast,
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (_, animation, secondaryAnimation, child) {
//         final scale = Tween<double>(
//           begin: 0.96,
//           end: 1.0,
//         ).animate(CurvedAnimation(parent: animation, curve: enter));

//         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
//           CurvedAnimation(
//             parent: animation,
//             curve: const Interval(0.0, 0.55, curve: Curves.easeOut),
//           ),
//         );

//         final secondaryFade = Tween<double>(
//           begin: 1.0,
//           end: 0.88,
//         ).animate(CurvedAnimation(parent: secondaryAnimation, curve: exit));

//         return FadeTransition(
//           opacity: secondaryFade,
//           child: ScaleTransition(
//             scale: scale,
//             child: FadeTransition(opacity: fade, child: child),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// Central place for custom page transitions.
class AppTransitions {
  // ─── Simple linear transitions ──────────────────────────────────────────────

  /// Standard scale‑up transition.
  static PageRoute scaleUp(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (_, animation, __, child) {
        final tween = Tween(begin: 0.8, end: 1.0);
        return ScaleTransition(
          scale: animation.drive(
            tween.chain(CurveTween(curve: Curves.easeOutCubic)),
          ),
          child: FadeTransition(
            opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
            child: child,
          ),
        );
      },
    );
  }

  /// Slide in from the bottom.
  static PageRoute slideFromBottom(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero)
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
          child: child,
        );
      },
    );
  }

  /// Slide in from the right.
  static PageRoute slideFromRight(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
          child: child,
        );
      },
    );
  }

  /// Fade in.
  static PageRoute fadeIn(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
          child: child,
        );
      },
    );
  }

  /// Rotate in with a bit of scaling.
  static PageRoute rotateIn(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (_, animation, __, child) {
        return RotationTransition(
          turns: Tween(begin: -0.1, end: 0.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
          ),
          child: ScaleTransition(
            scale: Tween(begin: 0.7, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
    );
  }

  /// Bottom‑sheet style.
  static PageRoute bottomSheet(
    Widget page, {
    Duration duration = const Duration(milliseconds: 700),
  }) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 0.9), end: Offset.zero)
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
          child: child,
        );
      },
    );
  }

  // ─── Physics‑based spring transitions ──────────────────────────────────────

  /// Spring scale: the page scales from 0 to 1 with a spring (overshoot).
  static PageRoute springScale(Widget page) {
    return _SpringPageRoute(
      page: page,
      animationBuilder: (child) =>
          _SpringScaleTransition(child: child), // ✅ fixed
    );
  }

  /// Spring slide: the page slides from bottom with a spring effect.
  static PageRoute springSlide(Widget page) {
    return _SpringPageRoute(
      page: page,
      animationBuilder: (child) =>
          _SpringSlideTransition(child: child), // ✅ fixed
    );
  }

  /// Bounce effect (uses ElasticOut curve, not a physics simulation).
  static PageRoute bounceIn(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (_, animation, __, child) {
        return ScaleTransition(
          scale: animation.drive(
            Tween(
              begin: 0.0,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.elasticOut)),
          ),
          child: child,
        );
      },
    );
  }

  /// Elastic‑like scale (using ElasticOut).
  static PageRoute elasticIn(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (_, animation, __, child) {
        return ScaleTransition(
          scale: animation.drive(
            Tween(
              begin: 0.3,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.elasticOut)),
          ),
          child: FadeTransition(
            opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
            child: child,
          ),
        );
      },
    );
  }
}

// ─── Internal helpers for spring transitions ──────────────────────────────────

/// Base route that builds a spring‑animated transition.
class _SpringPageRoute extends PageRouteBuilder {
  final Widget page;
  final Widget Function(Widget child)
  animationBuilder; // now accepts a positional Widget

  _SpringPageRoute({required this.page, required this.animationBuilder})
    : super(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: Duration.zero, // we manage our own duration
        reverseTransitionDuration: Duration.zero,
      );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return animationBuilder(child); // call with the child
  }
}

/// Spring scale transition.
class _SpringScaleTransition extends StatefulWidget {
  final Widget child;
  const _SpringScaleTransition({required this.child});

  @override
  State<_SpringScaleTransition> createState() => _SpringScaleTransitionState();
}

class _SpringScaleTransitionState extends State<_SpringScaleTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation<double>? _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ), // not used, but needed for controller
    );

    const spring = SpringDescription(mass: 1, stiffness: 80, damping: 15);
    final simulation = SpringSimulation(spring, 0, 1, 0);

    _controller.animateWith(simulation);
    _scale = _controller.drive(Tween(begin: 0.0, end: 1.0));
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _scale!, child: widget.child);
  }
}

/// Spring slide transition (from bottom).
class _SpringSlideTransition extends StatefulWidget {
  final Widget child;
  const _SpringSlideTransition({required this.child});

  @override
  State<_SpringSlideTransition> createState() => _SpringSlideTransitionState();
}

class _SpringSlideTransitionState extends State<_SpringSlideTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation<Offset>? _position;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    const spring = SpringDescription(mass: 1, stiffness: 120, damping: 14);
    final simulation = SpringSimulation(spring, 0, 1, 0);

    _controller.animateWith(simulation);
    _position = _controller.drive(
      Tween<Offset>(begin: const Offset(0, 0.8), end: Offset.zero),
    );

    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _position!, child: widget.child);
  }
}
