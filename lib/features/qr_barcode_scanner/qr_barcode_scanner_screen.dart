// // import 'package:flutter/material.dart';
// // import 'package:mobile_scanner/mobile_scanner.dart';

// // class QrBarcodeScannerScreen extends StatefulWidget {
// //   const QrBarcodeScannerScreen({super.key});

// //   @override
// //   State<QrBarcodeScannerScreen> createState() => _QrBarcodeScannerScreenState();
// // }

// // class _QrBarcodeScannerScreenState extends State<QrBarcodeScannerScreen> {
// //   final MobileScannerController _controller = MobileScannerController(
// //     facing: CameraFacing.back,
// //     torchEnabled: false,
// //     detectionSpeed: DetectionSpeed.normal,
// //   );

// //   String? _scannedValue;
// //   BarcodeFormat? _scannedFormat;
// //   bool _hasScanned = false;

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   void _handleDetect(BarcodeCapture capture) {
// //     if (_hasScanned) return;

// //     for (final barcode in capture.barcodes) {
// //       final value = barcode.rawValue;
// //       if (value == null || value.isEmpty) continue;

// //       setState(() {
// //         _hasScanned = true;
// //         _scannedValue = value;
// //         _scannedFormat = barcode.format;
// //       });

// //       _controller.stop();
// //       break;
// //     }
// //   }

// //   void _scanAgain() {
// //     setState(() {
// //       _hasScanned = false;
// //       _scannedValue = null;
// //       _scannedFormat = null;
// //     });
// //     _controller.start();
// //   }

// //   String _formatLabel(BarcodeFormat? format) {
// //     if (format == null) return 'Unknown';
// //     return format.name.toUpperCase();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final colorScheme = Theme.of(context).colorScheme;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('QR / Barcode Scanner'),
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             onPressed: () => _controller.toggleTorch(),
// //             icon: const Icon(Icons.flash_on_rounded),
// //           ),
// //           IconButton(
// //             onPressed: () => _controller.switchCamera(),
// //             icon: const Icon(Icons.cameraswitch_rounded),
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             flex: 5,
// //             child: Stack(
// //               children: [
// //                 MobileScanner(controller: _controller, onDetect: _handleDetect),
// //                 Center(
// //                   child: Container(
// //                     width: 260,
// //                     height: 260,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(24),
// //                       border: Border.all(color: colorScheme.primary, width: 3),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Expanded(
// //             flex: 3,
// //             child: Container(
// //               width: double.infinity,
// //               padding: const EdgeInsets.all(20),
// //               decoration: BoxDecoration(
// //                 color: colorScheme.surface,
// //                 borderRadius: const BorderRadius.vertical(
// //                   top: Radius.circular(28),
// //                 ),
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// //                 children: [
// //                   Text(
// //                     'Scan result',
// //                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
// //                       fontWeight: FontWeight.w800,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 12),
// //                   if (_scannedValue == null) ...[
// //                     Text(
// //                       'Point the camera at a QR code or barcode.',
// //                       style: TextStyle(color: colorScheme.onSurfaceVariant),
// //                     ),
// //                   ] else ...[
// //                     Text(
// //                       _formatLabel(_scannedFormat),
// //                       style: TextStyle(
// //                         color: colorScheme.primary,
// //                         fontWeight: FontWeight.w800,
// //                         letterSpacing: 1,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 10),
// //                     SelectableText(
// //                       _scannedValue!,
// //                       style: Theme.of(context).textTheme.bodyLarge,
// //                     ),
// //                   ],
// //                   const Spacer(),
// //                   ElevatedButton.icon(
// //                     onPressed: _scanAgain,
// //                     icon: const Icon(Icons.qr_code_scanner_rounded),
// //                     label: const Text('Scan Again'),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class QrBarcodeScannerScreen extends StatefulWidget {
//   const QrBarcodeScannerScreen({super.key});

//   @override
//   State<QrBarcodeScannerScreen> createState() => _QrBarcodeScannerScreenState();
// }

// class _QrBarcodeScannerScreenState extends State<QrBarcodeScannerScreen> {
//   final MobileScannerController _controller = MobileScannerController(
//     facing: CameraFacing.back,
//     torchEnabled: false,
//     detectionSpeed: DetectionSpeed.normal,
//   );

//   String? _scannedValue;
//   BarcodeFormat? _scannedFormat;
//   bool _hasScanned = false;

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _handleDetect(BarcodeCapture capture) {
//     if (_hasScanned) return;

//     for (final barcode in capture.barcodes) {
//       final value = barcode.rawValue;
//       if (value == null || value.isEmpty) continue;

//       setState(() {
//         _hasScanned = true;
//         _scannedValue = value;
//         _scannedFormat = barcode.format;
//       });

//       _controller.stop();
//       break;
//     }
//   }

//   void _scanAgain() {
//     setState(() {
//       _hasScanned = false;
//       _scannedValue = null;
//       _scannedFormat = null;
//     });
//     _controller.start();
//   }

//   String _formatLabel(BarcodeFormat? format) {
//     if (format == null) return 'Unknown';
//     return format.name.toUpperCase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         // ── Hero icon matching the card ──
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Hero(
//             tag: 'tool-icon-QR / Barcode Scanner',
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.deepPurple.withOpacity(0.95),
//                     Colors.deepPurple.withOpacity(0.55),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Icon(
//                 Icons.document_scanner_rounded,
//                 color: Colors.white,
//                 size: 22,
//               ),
//             ),
//           ),
//         ),
//         title: const Text('QR / Barcode Scanner'),
//         centerTitle: true,
//         backgroundColor: colorScheme.inversePrimary,
//         actions: [
//           IconButton(
//             onPressed: () => _controller.toggleTorch(),
//             icon: const Icon(Icons.flash_on_rounded),
//           ),
//           IconButton(
//             onPressed: () => _controller.switchCamera(),
//             icon: const Icon(Icons.cameraswitch_rounded),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: Stack(
//               children: [
//                 MobileScanner(controller: _controller, onDetect: _handleDetect),
//                 Center(
//                   child: Container(
//                     width: 260,
//                     height: 260,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(24),
//                       border: Border.all(color: colorScheme.primary, width: 3),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: colorScheme.surface,
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(28),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Text(
//                     'Scan result',
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   if (_scannedValue == null) ...[
//                     Text(
//                       'Point the camera at a QR code or barcode.',
//                       style: TextStyle(color: colorScheme.onSurfaceVariant),
//                     ),
//                   ] else ...[
//                     Text(
//                       _formatLabel(_scannedFormat),
//                       style: TextStyle(
//                         color: colorScheme.primary,
//                         fontWeight: FontWeight.w800,
//                         letterSpacing: 1,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     SelectableText(
//                       _scannedValue!,
//                       style: Theme.of(context).textTheme.bodyLarge,
//                     ),
//                   ],
//                   const Spacer(),
//                   ElevatedButton.icon(
//                     onPressed: _scanAgain,
//                     icon: const Icon(Icons.qr_code_scanner_rounded),
//                     label: const Text('Scan Again'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QrBarcodeScannerScreen extends StatefulWidget {
  const QrBarcodeScannerScreen({super.key});

  @override
  State<QrBarcodeScannerScreen> createState() => _QrBarcodeScannerScreenState();
}

class _QrBarcodeScannerScreenState extends State<QrBarcodeScannerScreen> {
  final MobileScannerController _controller = MobileScannerController(
    facing: CameraFacing.back,
    torchEnabled: false,
    detectionSpeed: DetectionSpeed.normal,
  );

  String? _scannedValue;
  BarcodeFormat? _scannedFormat;
  bool _hasScanned = false;
  bool _cameraPermissionGranted = false; // ← added

  @override
  void initState() {
    super.initState();
    _requestCameraPermission(); // ← added
  }

  // ── added ──────────────────────────────────────────────────────────────────
  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (mounted) {
      setState(() => _cameraPermissionGranted = status.isGranted);
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Camera permission is required to scan codes.'),
          ),
        );
      }
    }
  }
  // ───────────────────────────────────────────────────────────────────────────

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDetect(BarcodeCapture capture) {
    if (_hasScanned) return;

    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue;
      if (value == null || value.isEmpty) continue;

      setState(() {
        _hasScanned = true;
        _scannedValue = value;
        _scannedFormat = barcode.format;
      });

      _controller.stop();
      break;
    }
  }

  void _scanAgain() {
    setState(() {
      _hasScanned = false;
      _scannedValue = null;
      _scannedFormat = null;
    });
    _controller.start();
  }

  String _formatLabel(BarcodeFormat? format) {
    if (format == null) return 'Unknown';
    return format.name.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'tool-icon-QR / Barcode Scanner',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.withOpacity(0.95),
                    Colors.deepPurple.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.document_scanner_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('QR / Barcode Scanner'),
        centerTitle: true,
        backgroundColor: colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => _controller.toggleTorch(),
            icon: const Icon(Icons.flash_on_rounded),
          ),
          IconButton(
            onPressed: () => _controller.switchCamera(),
            icon: const Icon(Icons.cameraswitch_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            // ── show permission denied message instead of blank camera ──
            child: _cameraPermissionGranted
                ? Stack(
                    children: [
                      MobileScanner(
                        controller: _controller,
                        onDetect: _handleDetect,
                      ),
                      Center(
                        child: Container(
                          width: 260,
                          height: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: colorScheme.primary,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Camera permission is required.\nPlease grant it in app settings.',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: openAppSettings, // opens device settings
                            child: const Text('Open Settings'),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Scan result',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (_scannedValue == null) ...[
                    Text(
                      'Point the camera at a QR code or barcode.',
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                  ] else ...[
                    Text(
                      _formatLabel(_scannedFormat),
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SelectableText(
                      _scannedValue!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: _scanAgain,
                    icon: const Icon(Icons.qr_code_scanner_rounded),
                    label: const Text('Scan Again'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
