import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

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
        title: const Text('QR / Barcode Scanner'),
        centerTitle: true,
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
            child: Stack(
              children: [
                MobileScanner(controller: _controller, onDetect: _handleDetect),
                Center(
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: colorScheme.primary, width: 3),
                    ),
                  ),
                ),
              ],
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
