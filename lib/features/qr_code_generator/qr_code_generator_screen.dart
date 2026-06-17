// import 'dart:ui' as ui;
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class QrCodeGeneratorScreen extends StatefulWidget {
//   const QrCodeGeneratorScreen({super.key});

//   @override
//   State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
// }

// class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {
//   // Selected content type
//   String _selectedType = 'URL';
//   final List<String> _types = [
//     'URL',
//     'Text',
//     'Email',
//     'Phone',
//     'Wi-Fi',
//     'vCard',
//   ];

//   // Controllers for each type
//   final _urlController = TextEditingController(text: 'https://');
//   final _textController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();

//   // Wi-Fi fields
//   final _wifiSsidController = TextEditingController();
//   final _wifiPassController = TextEditingController();
//   String _wifiEncryption = 'WPA';

//   // vCard fields
//   final _vcardNameController = TextEditingController();
//   final _vcardPhoneController = TextEditingController();
//   final _vcardEmailController = TextEditingController();

//   // QR data (live)
//   String _qrData = 'https://';

//   // RepaintBoundary key for saving
//   final GlobalKey _repaintKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     _urlController.addListener(_updateQr);
//     _textController.addListener(_updateQr);
//     _emailController.addListener(_updateQr);
//     _phoneController.addListener(_updateQr);
//     _wifiSsidController.addListener(_updateQr);
//     _wifiPassController.addListener(_updateQr);
//     _vcardNameController.addListener(_updateQr);
//     _vcardPhoneController.addListener(_updateQr);
//     _vcardEmailController.addListener(_updateQr);
//   }

//   @override
//   void dispose() {
//     _urlController.dispose();
//     _textController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _wifiSsidController.dispose();
//     _wifiPassController.dispose();
//     _vcardNameController.dispose();
//     _vcardPhoneController.dispose();
//     _vcardEmailController.dispose();
//     super.dispose();
//   }

//   void _updateQr() {
//     final data = _encodeContent();
//     if (data != _qrData) {
//       setState(() => _qrData = data.isEmpty ? ' ' : data);
//     }
//   }

//   String _encodeContent() {
//     switch (_selectedType) {
//       case 'URL':
//         return _urlController.text.trim().isEmpty
//             ? ' '
//             : _urlController.text.trim();
//       case 'Text':
//         return _textController.text.isEmpty ? ' ' : _textController.text;
//       case 'Email':
//         final email = _emailController.text.trim();
//         return email.isEmpty ? ' ' : 'mailto:$email';
//       case 'Phone':
//         final phone = _phoneController.text.trim();
//         return phone.isEmpty ? ' ' : 'tel:$phone';
//       case 'Wi-Fi':
//         final ssid = _wifiSsidController.text;
//         final pass = _wifiPassController.text;
//         if (ssid.isEmpty) return ' ';
//         return 'WIFI:T:$_wifiEncryption;S:$ssid;P:$pass;;';
//       case 'vCard':
//         final name = _vcardNameController.text;
//         final phone = _vcardPhoneController.text;
//         final email = _vcardEmailController.text;
//         if (name.isEmpty) return ' ';
//         return 'BEGIN:VCARD\nVERSION:3.0\nFN:$name\nTEL:$phone\nEMAIL:$email\nEND:VCARD';
//       default:
//         return ' ';
//     }
//   }

//   Future<void> _downloadQr() async {
//     try {
//       final boundary =
//           _repaintKey.currentContext!.findRenderObject()
//               as RenderRepaintBoundary;
//       final ui.Image image = await boundary.toImage(pixelRatio: 4.0);
//       final ByteData? byteData = await image.toByteData(
//         format: ui.ImageByteFormat.png,
//       );

//       if (byteData == null) {
//         _showSnack('Failed to capture QR image.');
//         return;
//       }

//       // NOTE: To actually save to gallery, add gallery_saver package and call:
//       // await GallerySaver.saveImage(filePath);
//       // For now we show a success message as the package isn't wired up yet.
//       _showSnack('QR captured! Wire up gallery_saver to save to gallery.');
//     } catch (e) {
//       _showSnack('Error: $e');
//     }
//   }

//   void _showSnack(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Code Generator'),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // --- Type selector ---
//             SizedBox(
//               height: 40,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: _types.length,
//                 separatorBuilder: (_, __) => const SizedBox(width: 8),
//                 itemBuilder: (context, i) {
//                   final t = _types[i];
//                   final selected = t == _selectedType;
//                   return ChoiceChip(
//                     label: Text(t),
//                     selected: selected,
//                     onSelected: (_) {
//                       setState(() => _selectedType = t);
//                       _updateQr();
//                     },
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),

//             // --- Input fields ---
//             _buildInputFields(),
//             const SizedBox(height: 24),

//             // --- QR Preview ---
//             Center(
//               child: RepaintBoundary(
//                 key: _repaintKey,
//                 child: Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.all(12),
//                   child: QrImageView(
//                     data: _qrData.isEmpty ? ' ' : _qrData,
//                     version: QrVersions.auto,
//                     size: 220,
//                     eyeStyle: const QrEyeStyle(
//                       eyeShape: QrEyeShape.square,
//                       color: Colors.black,
//                     ),
//                     dataModuleStyle: const QrDataModuleStyle(
//                       dataModuleShape: QrDataModuleShape.square,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),

//             // --- Download button ---
//             ElevatedButton.icon(
//               onPressed: _qrData.trim().isEmpty ? null : _downloadQr,
//               icon: const Icon(Icons.download),
//               label: const Text('Download QR (PNG)'),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 textStyle: const TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInputFields() {
//     switch (_selectedType) {
//       case 'URL':
//         return _field(
//           'URL',
//           _urlController,
//           hint: 'https://example.com',
//           keyboard: TextInputType.url,
//         );
//       case 'Text':
//         return _field(
//           'Plain Text',
//           _textController,
//           hint: 'Enter any text',
//           maxLines: 3,
//         );
//       case 'Email':
//         return _field(
//           'Email Address',
//           _emailController,
//           hint: 'user@example.com',
//           keyboard: TextInputType.emailAddress,
//         );
//       case 'Phone':
//         return _field(
//           'Phone Number',
//           _phoneController,
//           hint: '+1234567890',
//           keyboard: TextInputType.phone,
//         );
//       case 'Wi-Fi':
//         return Column(
//           children: [
//             _field('Network Name (SSID)', _wifiSsidController, hint: 'MyWiFi'),
//             const SizedBox(height: 12),
//             _field(
//               'Password',
//               _wifiPassController,
//               hint: 'Password',
//               obscure: true,
//             ),
//             const SizedBox(height: 12),
//             DropdownButtonFormField<String>(
//               value: _wifiEncryption,
//               decoration: const InputDecoration(
//                 labelText: 'Encryption',
//                 border: OutlineInputBorder(),
//               ),
//               items: [
//                 'WPA',
//                 'WEP',
//                 'nopass',
//               ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//               onChanged: (v) {
//                 if (v != null) setState(() => _wifiEncryption = v);
//                 _updateQr();
//               },
//             ),
//           ],
//         );
//       case 'vCard':
//         return Column(
//           children: [
//             _field('Full Name', _vcardNameController, hint: 'John Doe'),
//             const SizedBox(height: 12),
//             _field(
//               'Phone',
//               _vcardPhoneController,
//               hint: '+1234567890',
//               keyboard: TextInputType.phone,
//             ),
//             const SizedBox(height: 12),
//             _field(
//               'Email',
//               _vcardEmailController,
//               hint: 'john@example.com',
//               keyboard: TextInputType.emailAddress,
//             ),
//           ],
//         );
//       default:
//         return const SizedBox.shrink();
//     }
//   }

//   Widget _field(
//     String label,
//     TextEditingController controller, {
//     String hint = '',
//     TextInputType keyboard = TextInputType.text,
//     bool obscure = false,
//     int maxLines = 1,
//   }) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboard,
//       obscureText: obscure,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         border: const OutlineInputBorder(),
//       ),
//     );
//   }
// }
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGeneratorScreen extends StatefulWidget {
  const QrCodeGeneratorScreen({super.key});

  @override
  State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
}

class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {
  // Selected content type
  String _selectedType = 'URL';
  final List<String> _types = [
    'URL',
    'Text',
    'Email',
    'Phone',
    'Wi-Fi',
    'vCard',
  ];

  // Controllers for each type
  final _urlController = TextEditingController(text: 'https://');
  final _textController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // Wi-Fi fields
  final _wifiSsidController = TextEditingController();
  final _wifiPassController = TextEditingController();
  String _wifiEncryption = 'WPA';

  // vCard fields
  final _vcardNameController = TextEditingController();
  final _vcardPhoneController = TextEditingController();
  final _vcardEmailController = TextEditingController();

  // QR data (live)
  String _qrData = 'https://';

  // RepaintBoundary key for saving
  final GlobalKey _repaintKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _urlController.addListener(_updateQr);
    _textController.addListener(_updateQr);
    _emailController.addListener(_updateQr);
    _phoneController.addListener(_updateQr);
    _wifiSsidController.addListener(_updateQr);
    _wifiPassController.addListener(_updateQr);
    _vcardNameController.addListener(_updateQr);
    _vcardPhoneController.addListener(_updateQr);
    _vcardEmailController.addListener(_updateQr);
  }

  @override
  void dispose() {
    _urlController.dispose();
    _textController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _wifiSsidController.dispose();
    _wifiPassController.dispose();
    _vcardNameController.dispose();
    _vcardPhoneController.dispose();
    _vcardEmailController.dispose();
    super.dispose();
  }

  void _updateQr() {
    final data = _encodeContent();
    if (data != _qrData) {
      setState(() => _qrData = data.isEmpty ? ' ' : data);
    }
  }

  String _encodeContent() {
    switch (_selectedType) {
      case 'URL':
        return _urlController.text.trim().isEmpty
            ? ' '
            : _urlController.text.trim();
      case 'Text':
        return _textController.text.isEmpty ? ' ' : _textController.text;
      case 'Email':
        final email = _emailController.text.trim();
        return email.isEmpty ? ' ' : 'mailto:$email';
      case 'Phone':
        final phone = _phoneController.text.trim();
        return phone.isEmpty ? ' ' : 'tel:$phone';
      case 'Wi-Fi':
        final ssid = _wifiSsidController.text;
        final pass = _wifiPassController.text;
        if (ssid.isEmpty) return ' ';
        return 'WIFI:T:$_wifiEncryption;S:$ssid;P:$pass;;';
      case 'vCard':
        final name = _vcardNameController.text;
        final phone = _vcardPhoneController.text;
        final email = _vcardEmailController.text;
        if (name.isEmpty) return ' ';
        return 'BEGIN:VCARD\nVERSION:3.0\nFN:$name\nTEL:$phone\nEMAIL:$email\nEND:VCARD';
      default:
        return ' ';
    }
  }

  Future<void> _downloadQr() async {
    try {
      final boundary =
          _repaintKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 4.0);
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (byteData == null) {
        _showSnack('Failed to capture QR image.');
        return;
      }

      // NOTE: To actually save to gallery, add gallery_saver package and call:
      // await GallerySaver.saveImage(filePath);
      // For now we show a success message as the package isn't wired up yet.
      _showSnack('QR captured! Wire up gallery_saver to save to gallery.');
    } catch (e) {
      _showSnack('Error: $e');
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
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
            tag: 'tool-icon-QR Code Generator',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary.withOpacity(0.95),
                    colorScheme.primary.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.qr_code_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('QR Code Generator'),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Type selector ---
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _types.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final t = _types[i];
                  final selected = t == _selectedType;
                  return ChoiceChip(
                    label: Text(t),
                    selected: selected,
                    onSelected: (_) {
                      setState(() => _selectedType = t);
                      _updateQr();
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // --- Input fields ---
            _buildInputFields(),
            const SizedBox(height: 24),

            // --- QR Preview ---
            Center(
              child: RepaintBoundary(
                key: _repaintKey,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(12),
                  child: QrImageView(
                    data: _qrData.isEmpty ? ' ' : _qrData,
                    version: QrVersions.auto,
                    size: 220,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Colors.black,
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- Download button ---
            ElevatedButton.icon(
              onPressed: _qrData.trim().isEmpty ? null : _downloadQr,
              icon: const Icon(Icons.download),
              label: const Text('Download QR (PNG)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    switch (_selectedType) {
      case 'URL':
        return _field(
          'URL',
          _urlController,
          hint: 'https://example.com',
          keyboard: TextInputType.url,
        );
      case 'Text':
        return _field(
          'Plain Text',
          _textController,
          hint: 'Enter any text',
          maxLines: 3,
        );
      case 'Email':
        return _field(
          'Email Address',
          _emailController,
          hint: 'user@example.com',
          keyboard: TextInputType.emailAddress,
        );
      case 'Phone':
        return _field(
          'Phone Number',
          _phoneController,
          hint: '+1234567890',
          keyboard: TextInputType.phone,
        );
      case 'Wi-Fi':
        return Column(
          children: [
            _field('Network Name (SSID)', _wifiSsidController, hint: 'MyWiFi'),
            const SizedBox(height: 12),
            _field(
              'Password',
              _wifiPassController,
              hint: 'Password',
              obscure: true,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _wifiEncryption,
              decoration: const InputDecoration(
                labelText: 'Encryption',
                border: OutlineInputBorder(),
              ),
              items: [
                'WPA',
                'WEP',
                'nopass',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) {
                if (v != null) setState(() => _wifiEncryption = v);
                _updateQr();
              },
            ),
          ],
        );
      case 'vCard':
        return Column(
          children: [
            _field('Full Name', _vcardNameController, hint: 'John Doe'),
            const SizedBox(height: 12),
            _field(
              'Phone',
              _vcardPhoneController,
              hint: '+1234567890',
              keyboard: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            _field(
              'Email',
              _vcardEmailController,
              hint: 'john@example.com',
              keyboard: TextInputType.emailAddress,
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    String hint = '',
    TextInputType keyboard = TextInputType.text,
    bool obscure = false,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
