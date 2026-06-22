// // // import 'dart:ui' as ui;
// // // import 'dart:typed_data';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/rendering.dart';
// // // import 'package:qr_flutter/qr_flutter.dart';

// // // class QrCodeGeneratorScreen extends StatefulWidget {
// // //   const QrCodeGeneratorScreen({super.key});

// // //   @override
// // //   State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
// // // }

// // // class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {
// // //   // Selected content type
// // //   String _selectedType = 'URL';
// // //   final List<String> _types = [
// // //     'URL',
// // //     'Text',
// // //     'Email',
// // //     'Phone',
// // //     'Wi-Fi',
// // //     'vCard',
// // //   ];

// // //   // Controllers for each type
// // //   final _urlController = TextEditingController(text: 'https://');
// // //   final _textController = TextEditingController();
// // //   final _emailController = TextEditingController();
// // //   final _phoneController = TextEditingController();

// // //   // Wi-Fi fields
// // //   final _wifiSsidController = TextEditingController();
// // //   final _wifiPassController = TextEditingController();
// // //   String _wifiEncryption = 'WPA';

// // //   // vCard fields
// // //   final _vcardNameController = TextEditingController();
// // //   final _vcardPhoneController = TextEditingController();
// // //   final _vcardEmailController = TextEditingController();

// // //   // QR data (live)
// // //   String _qrData = 'https://';

// // //   // RepaintBoundary key for saving
// // //   final GlobalKey _repaintKey = GlobalKey();

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _urlController.addListener(_updateQr);
// // //     _textController.addListener(_updateQr);
// // //     _emailController.addListener(_updateQr);
// // //     _phoneController.addListener(_updateQr);
// // //     _wifiSsidController.addListener(_updateQr);
// // //     _wifiPassController.addListener(_updateQr);
// // //     _vcardNameController.addListener(_updateQr);
// // //     _vcardPhoneController.addListener(_updateQr);
// // //     _vcardEmailController.addListener(_updateQr);
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _urlController.dispose();
// // //     _textController.dispose();
// // //     _emailController.dispose();
// // //     _phoneController.dispose();
// // //     _wifiSsidController.dispose();
// // //     _wifiPassController.dispose();
// // //     _vcardNameController.dispose();
// // //     _vcardPhoneController.dispose();
// // //     _vcardEmailController.dispose();
// // //     super.dispose();
// // //   }

// // //   void _updateQr() {
// // //     final data = _encodeContent();
// // //     if (data != _qrData) {
// // //       setState(() => _qrData = data.isEmpty ? ' ' : data);
// // //     }
// // //   }

// // //   String _encodeContent() {
// // //     switch (_selectedType) {
// // //       case 'URL':
// // //         return _urlController.text.trim().isEmpty
// // //             ? ' '
// // //             : _urlController.text.trim();
// // //       case 'Text':
// // //         return _textController.text.isEmpty ? ' ' : _textController.text;
// // //       case 'Email':
// // //         final email = _emailController.text.trim();
// // //         return email.isEmpty ? ' ' : 'mailto:$email';
// // //       case 'Phone':
// // //         final phone = _phoneController.text.trim();
// // //         return phone.isEmpty ? ' ' : 'tel:$phone';
// // //       case 'Wi-Fi':
// // //         final ssid = _wifiSsidController.text;
// // //         final pass = _wifiPassController.text;
// // //         if (ssid.isEmpty) return ' ';
// // //         return 'WIFI:T:$_wifiEncryption;S:$ssid;P:$pass;;';
// // //       case 'vCard':
// // //         final name = _vcardNameController.text;
// // //         final phone = _vcardPhoneController.text;
// // //         final email = _vcardEmailController.text;
// // //         if (name.isEmpty) return ' ';
// // //         return 'BEGIN:VCARD\nVERSION:3.0\nFN:$name\nTEL:$phone\nEMAIL:$email\nEND:VCARD';
// // //       default:
// // //         return ' ';
// // //     }
// // //   }

// // //   Future<void> _downloadQr() async {
// // //     try {
// // //       final boundary =
// // //           _repaintKey.currentContext!.findRenderObject()
// // //               as RenderRepaintBoundary;
// // //       final ui.Image image = await boundary.toImage(pixelRatio: 4.0);
// // //       final ByteData? byteData = await image.toByteData(
// // //         format: ui.ImageByteFormat.png,
// // //       );

// // //       if (byteData == null) {
// // //         _showSnack('Failed to capture QR image.');
// // //         return;
// // //       }

// // //       // NOTE: To actually save to gallery, add gallery_saver package and call:
// // //       // await GallerySaver.saveImage(filePath);
// // //       // For now we show a success message as the package isn't wired up yet.
// // //       _showSnack('QR captured! Wire up gallery_saver to save to gallery.');
// // //     } catch (e) {
// // //       _showSnack('Error: $e');
// // //     }
// // //   }

// // //   void _showSnack(String msg) {
// // //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('QR Code Generator'),
// // //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.stretch,
// // //           children: [
// // //             // --- Type selector ---
// // //             SizedBox(
// // //               height: 40,
// // //               child: ListView.separated(
// // //                 scrollDirection: Axis.horizontal,
// // //                 itemCount: _types.length,
// // //                 separatorBuilder: (_, __) => const SizedBox(width: 8),
// // //                 itemBuilder: (context, i) {
// // //                   final t = _types[i];
// // //                   final selected = t == _selectedType;
// // //                   return ChoiceChip(
// // //                     label: Text(t),
// // //                     selected: selected,
// // //                     onSelected: (_) {
// // //                       setState(() => _selectedType = t);
// // //                       _updateQr();
// // //                     },
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //             const SizedBox(height: 20),

// // //             // --- Input fields ---
// // //             _buildInputFields(),
// // //             const SizedBox(height: 24),

// // //             // --- QR Preview ---
// // //             Center(
// // //               child: RepaintBoundary(
// // //                 key: _repaintKey,
// // //                 child: Container(
// // //                   color: Colors.white,
// // //                   padding: const EdgeInsets.all(12),
// // //                   child: QrImageView(
// // //                     data: _qrData.isEmpty ? ' ' : _qrData,
// // //                     version: QrVersions.auto,
// // //                     size: 220,
// // //                     eyeStyle: const QrEyeStyle(
// // //                       eyeShape: QrEyeShape.square,
// // //                       color: Colors.black,
// // //                     ),
// // //                     dataModuleStyle: const QrDataModuleStyle(
// // //                       dataModuleShape: QrDataModuleShape.square,
// // //                       color: Colors.black,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 24),

// // //             // --- Download button ---
// // //             ElevatedButton.icon(
// // //               onPressed: _qrData.trim().isEmpty ? null : _downloadQr,
// // //               icon: const Icon(Icons.download),
// // //               label: const Text('Download QR (PNG)'),
// // //               style: ElevatedButton.styleFrom(
// // //                 padding: const EdgeInsets.symmetric(vertical: 14),
// // //                 textStyle: const TextStyle(fontSize: 16),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildInputFields() {
// // //     switch (_selectedType) {
// // //       case 'URL':
// // //         return _field(
// // //           'URL',
// // //           _urlController,
// // //           hint: 'https://example.com',
// // //           keyboard: TextInputType.url,
// // //         );
// // //       case 'Text':
// // //         return _field(
// // //           'Plain Text',
// // //           _textController,
// // //           hint: 'Enter any text',
// // //           maxLines: 3,
// // //         );
// // //       case 'Email':
// // //         return _field(
// // //           'Email Address',
// // //           _emailController,
// // //           hint: 'user@example.com',
// // //           keyboard: TextInputType.emailAddress,
// // //         );
// // //       case 'Phone':
// // //         return _field(
// // //           'Phone Number',
// // //           _phoneController,
// // //           hint: '+1234567890',
// // //           keyboard: TextInputType.phone,
// // //         );
// // //       case 'Wi-Fi':
// // //         return Column(
// // //           children: [
// // //             _field('Network Name (SSID)', _wifiSsidController, hint: 'MyWiFi'),
// // //             const SizedBox(height: 12),
// // //             _field(
// // //               'Password',
// // //               _wifiPassController,
// // //               hint: 'Password',
// // //               obscure: true,
// // //             ),
// // //             const SizedBox(height: 12),
// // //             DropdownButtonFormField<String>(
// // //               value: _wifiEncryption,
// // //               decoration: const InputDecoration(
// // //                 labelText: 'Encryption',
// // //                 border: OutlineInputBorder(),
// // //               ),
// // //               items: [
// // //                 'WPA',
// // //                 'WEP',
// // //                 'nopass',
// // //               ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
// // //               onChanged: (v) {
// // //                 if (v != null) setState(() => _wifiEncryption = v);
// // //                 _updateQr();
// // //               },
// // //             ),
// // //           ],
// // //         );
// // //       case 'vCard':
// // //         return Column(
// // //           children: [
// // //             _field('Full Name', _vcardNameController, hint: 'John Doe'),
// // //             const SizedBox(height: 12),
// // //             _field(
// // //               'Phone',
// // //               _vcardPhoneController,
// // //               hint: '+1234567890',
// // //               keyboard: TextInputType.phone,
// // //             ),
// // //             const SizedBox(height: 12),
// // //             _field(
// // //               'Email',
// // //               _vcardEmailController,
// // //               hint: 'john@example.com',
// // //               keyboard: TextInputType.emailAddress,
// // //             ),
// // //           ],
// // //         );
// // //       default:
// // //         return const SizedBox.shrink();
// // //     }
// // //   }

// // //   Widget _field(
// // //     String label,
// // //     TextEditingController controller, {
// // //     String hint = '',
// // //     TextInputType keyboard = TextInputType.text,
// // //     bool obscure = false,
// // //     int maxLines = 1,
// // //   }) {
// // //     return TextField(
// // //       controller: controller,
// // //       keyboardType: keyboard,
// // //       obscureText: obscure,
// // //       maxLines: maxLines,
// // //       decoration: InputDecoration(
// // //         labelText: label,
// // //         hintText: hint,
// // //         border: const OutlineInputBorder(),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'dart:ui' as ui;
// // import 'dart:typed_data';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/rendering.dart';
// // import 'package:qr_flutter/qr_flutter.dart';

// // class QrCodeGeneratorScreen extends StatefulWidget {
// //   const QrCodeGeneratorScreen({super.key});

// //   @override
// //   State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
// // }

// // class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {
// //   // Selected content type
// //   String _selectedType = 'URL';
// //   final List<String> _types = [
// //     'URL',
// //     'Text',
// //     'Email',
// //     'Phone',
// //     'Wi-Fi',
// //     'vCard',
// //   ];

// //   // Controllers for each type
// //   final _urlController = TextEditingController(text: 'https://');
// //   final _textController = TextEditingController();
// //   final _emailController = TextEditingController();
// //   final _phoneController = TextEditingController();

// //   // Wi-Fi fields
// //   final _wifiSsidController = TextEditingController();
// //   final _wifiPassController = TextEditingController();
// //   String _wifiEncryption = 'WPA';

// //   // vCard fields
// //   final _vcardNameController = TextEditingController();
// //   final _vcardPhoneController = TextEditingController();
// //   final _vcardEmailController = TextEditingController();

// //   // QR data (live)
// //   String _qrData = 'https://';

// //   // RepaintBoundary key for saving
// //   final GlobalKey _repaintKey = GlobalKey();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _urlController.addListener(_updateQr);
// //     _textController.addListener(_updateQr);
// //     _emailController.addListener(_updateQr);
// //     _phoneController.addListener(_updateQr);
// //     _wifiSsidController.addListener(_updateQr);
// //     _wifiPassController.addListener(_updateQr);
// //     _vcardNameController.addListener(_updateQr);
// //     _vcardPhoneController.addListener(_updateQr);
// //     _vcardEmailController.addListener(_updateQr);
// //   }

// //   @override
// //   void dispose() {
// //     _urlController.dispose();
// //     _textController.dispose();
// //     _emailController.dispose();
// //     _phoneController.dispose();
// //     _wifiSsidController.dispose();
// //     _wifiPassController.dispose();
// //     _vcardNameController.dispose();
// //     _vcardPhoneController.dispose();
// //     _vcardEmailController.dispose();
// //     super.dispose();
// //   }

// //   void _updateQr() {
// //     final data = _encodeContent();
// //     if (data != _qrData) {
// //       setState(() => _qrData = data.isEmpty ? ' ' : data);
// //     }
// //   }

// //   String _encodeContent() {
// //     switch (_selectedType) {
// //       case 'URL':
// //         return _urlController.text.trim().isEmpty
// //             ? ' '
// //             : _urlController.text.trim();
// //       case 'Text':
// //         return _textController.text.isEmpty ? ' ' : _textController.text;
// //       case 'Email':
// //         final email = _emailController.text.trim();
// //         return email.isEmpty ? ' ' : 'mailto:$email';
// //       case 'Phone':
// //         final phone = _phoneController.text.trim();
// //         return phone.isEmpty ? ' ' : 'tel:$phone';
// //       case 'Wi-Fi':
// //         final ssid = _wifiSsidController.text;
// //         final pass = _wifiPassController.text;
// //         if (ssid.isEmpty) return ' ';
// //         return 'WIFI:T:$_wifiEncryption;S:$ssid;P:$pass;;';
// //       case 'vCard':
// //         final name = _vcardNameController.text;
// //         final phone = _vcardPhoneController.text;
// //         final email = _vcardEmailController.text;
// //         if (name.isEmpty) return ' ';
// //         return 'BEGIN:VCARD\nVERSION:3.0\nFN:$name\nTEL:$phone\nEMAIL:$email\nEND:VCARD';
// //       default:
// //         return ' ';
// //     }
// //   }

// //   Future<void> _downloadQr() async {
// //     try {
// //       final boundary =
// //           _repaintKey.currentContext!.findRenderObject()
// //               as RenderRepaintBoundary;
// //       final ui.Image image = await boundary.toImage(pixelRatio: 4.0);
// //       final ByteData? byteData = await image.toByteData(
// //         format: ui.ImageByteFormat.png,
// //       );

// //       if (byteData == null) {
// //         _showSnack('Failed to capture QR image.');
// //         return;
// //       }

// //       // NOTE: To actually save to gallery, add gallery_saver package and call:
// //       // await GallerySaver.saveImage(filePath);
// //       // For now we show a success message as the package isn't wired up yet.
// //       _showSnack('QR captured! Wire up gallery_saver to save to gallery.');
// //     } catch (e) {
// //       _showSnack('Error: $e');
// //     }
// //   }

// //   void _showSnack(String msg) {
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final colorScheme = Theme.of(context).colorScheme;

// //     return Scaffold(
// //       appBar: AppBar(
// //         // ── Hero icon matching the card ──
// //         leading: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Hero(
// //             tag: 'tool-icon-QR Code Generator',
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 gradient: LinearGradient(
// //                   colors: [
// //                     colorScheme.primary.withOpacity(0.95),
// //                     colorScheme.primary.withOpacity(0.55),
// //                   ],
// //                 ),
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               child: const Icon(
// //                 Icons.qr_code_rounded,
// //                 color: Colors.white,
// //                 size: 22,
// //               ),
// //             ),
// //           ),
// //         ),
// //         title: const Text('QR Code Generator'),
// //         backgroundColor: colorScheme.inversePrimary,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             // --- Type selector ---
// //             SizedBox(
// //               height: 40,
// //               child: ListView.separated(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: _types.length,
// //                 separatorBuilder: (_, __) => const SizedBox(width: 8),
// //                 itemBuilder: (context, i) {
// //                   final t = _types[i];
// //                   final selected = t == _selectedType;
// //                   return ChoiceChip(
// //                     label: Text(t),
// //                     selected: selected,
// //                     onSelected: (_) {
// //                       setState(() => _selectedType = t);
// //                       _updateQr();
// //                     },
// //                   );
// //                 },
// //               ),
// //             ),
// //             const SizedBox(height: 20),

// //             // --- Input fields ---
// //             _buildInputFields(),
// //             const SizedBox(height: 24),

// //             // --- QR Preview ---
// //             Center(
// //               child: RepaintBoundary(
// //                 key: _repaintKey,
// //                 child: Container(
// //                   color: Colors.white,
// //                   padding: const EdgeInsets.all(12),
// //                   child: QrImageView(
// //                     data: _qrData.isEmpty ? ' ' : _qrData,
// //                     version: QrVersions.auto,
// //                     size: 220,
// //                     eyeStyle: const QrEyeStyle(
// //                       eyeShape: QrEyeShape.square,
// //                       color: Colors.black,
// //                     ),
// //                     dataModuleStyle: const QrDataModuleStyle(
// //                       dataModuleShape: QrDataModuleShape.square,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 24),

// //             // --- Download button ---
// //             ElevatedButton.icon(
// //               onPressed: _qrData.trim().isEmpty ? null : _downloadQr,
// //               icon: const Icon(Icons.download),
// //               label: const Text('Download QR (PNG)'),
// //               style: ElevatedButton.styleFrom(
// //                 padding: const EdgeInsets.symmetric(vertical: 14),
// //                 textStyle: const TextStyle(fontSize: 16),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildInputFields() {
// //     switch (_selectedType) {
// //       case 'URL':
// //         return _field(
// //           'URL',
// //           _urlController,
// //           hint: 'https://example.com',
// //           keyboard: TextInputType.url,
// //         );
// //       case 'Text':
// //         return _field(
// //           'Plain Text',
// //           _textController,
// //           hint: 'Enter any text',
// //           maxLines: 3,
// //         );
// //       case 'Email':
// //         return _field(
// //           'Email Address',
// //           _emailController,
// //           hint: 'user@example.com',
// //           keyboard: TextInputType.emailAddress,
// //         );
// //       case 'Phone':
// //         return _field(
// //           'Phone Number',
// //           _phoneController,
// //           hint: '+1234567890',
// //           keyboard: TextInputType.phone,
// //         );
// //       case 'Wi-Fi':
// //         return Column(
// //           children: [
// //             _field('Network Name (SSID)', _wifiSsidController, hint: 'MyWiFi'),
// //             const SizedBox(height: 12),
// //             _field(
// //               'Password',
// //               _wifiPassController,
// //               hint: 'Password',
// //               obscure: true,
// //             ),
// //             const SizedBox(height: 12),
// //             DropdownButtonFormField<String>(
// //               value: _wifiEncryption,
// //               decoration: const InputDecoration(
// //                 labelText: 'Encryption',
// //                 border: OutlineInputBorder(),
// //               ),
// //               items: [
// //                 'WPA',
// //                 'WEP',
// //                 'nopass',
// //               ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
// //               onChanged: (v) {
// //                 if (v != null) setState(() => _wifiEncryption = v);
// //                 _updateQr();
// //               },
// //             ),
// //           ],
// //         );
// //       case 'vCard':
// //         return Column(
// //           children: [
// //             _field('Full Name', _vcardNameController, hint: 'John Doe'),
// //             const SizedBox(height: 12),
// //             _field(
// //               'Phone',
// //               _vcardPhoneController,
// //               hint: '+1234567890',
// //               keyboard: TextInputType.phone,
// //             ),
// //             const SizedBox(height: 12),
// //             _field(
// //               'Email',
// //               _vcardEmailController,
// //               hint: 'john@example.com',
// //               keyboard: TextInputType.emailAddress,
// //             ),
// //           ],
// //         );
// //       default:
// //         return const SizedBox.shrink();
// //     }
// //   }

// //   Widget _field(
// //     String label,
// //     TextEditingController controller, {
// //     String hint = '',
// //     TextInputType keyboard = TextInputType.text,
// //     bool obscure = false,
// //     int maxLines = 1,
// //   }) {
// //     return TextField(
// //       controller: controller,
// //       keyboardType: keyboard,
// //       obscureText: obscure,
// //       maxLines: maxLines,
// //       decoration: InputDecoration(
// //         labelText: label,
// //         hintText: hint,
// //         border: const OutlineInputBorder(),
// //       ),
// //     );
// //   }
// // }
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
//   String _selectedType = 'URL';
//   final List<String> _types = [
//     'URL',
//     'Text',
//     'Email',
//     'Phone',
//     'Wi-Fi',
//     'vCard',
//   ];

//   final _urlController = TextEditingController(text: 'https://');
//   final _textController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();

//   final _wifiSsidController = TextEditingController();
//   final _wifiPassController = TextEditingController();
//   String _wifiEncryption = 'WPA';

//   final _vcardNameController = TextEditingController();
//   final _vcardPhoneController = TextEditingController();
//   final _vcardEmailController = TextEditingController();

//   String _qrData = 'https://';

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
//     final colorScheme = Theme.of(context).colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Hero(
//             tag: 'tool-icon-QR Code Generator',
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     colorScheme.primary.withOpacity(0.95),
//                     colorScheme.primary.withOpacity(0.55),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Icon(
//                 Icons.qr_code_rounded,
//                 color: Colors.white,
//                 size: 22,
//               ),
//             ),
//           ),
//         ),
//         title: const Text('QR Code Generator'),
//         backgroundColor: colorScheme.inversePrimary,
//       ),
//       body: GestureDetector(
//         // ← added
//         onTap: () => FocusScope.of(context).unfocus(),
//         behavior: HitTestBehavior.opaque,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // --- Type selector ---
//               SizedBox(
//                 height: 40,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: _types.length,
//                   separatorBuilder: (_, __) => const SizedBox(width: 8),
//                   itemBuilder: (context, i) {
//                     final t = _types[i];
//                     final selected = t == _selectedType;
//                     return ChoiceChip(
//                       label: Text(t),
//                       selected: selected,
//                       onSelected: (_) {
//                         setState(() => _selectedType = t);
//                         _updateQr();
//                       },
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // --- Input fields ---
//               _buildInputFields(),
//               const SizedBox(height: 24),

//               // --- QR Preview ---
//               Center(
//                 child: RepaintBoundary(
//                   key: _repaintKey,
//                   child: Container(
//                     color: Colors.white,
//                     padding: const EdgeInsets.all(12),
//                     child: QrImageView(
//                       data: _qrData.isEmpty ? ' ' : _qrData,
//                       version: QrVersions.auto,
//                       size: 220,
//                       eyeStyle: const QrEyeStyle(
//                         eyeShape: QrEyeShape.square,
//                         color: Colors.black,
//                       ),
//                       dataModuleStyle: const QrDataModuleStyle(
//                         dataModuleShape: QrDataModuleShape.square,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // --- Download button ---
//               ElevatedButton.icon(
//                 onPressed: _qrData.trim().isEmpty ? null : _downloadQr,
//                 icon: const Icon(Icons.download),
//                 label: const Text('Download QR (PNG)'),
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   textStyle: const TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ), // ← closes GestureDetector
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
  String _selectedType = 'URL';
  final List<String> _types = [
    'URL',
    'Text',
    'Email',
    'Phone',
    'Wi-Fi',
    'vCard',
  ];

  final _urlController = TextEditingController(text: 'https://');
  final _textController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _wifiSsidController = TextEditingController();
  final _wifiPassController = TextEditingController();
  String _wifiEncryption = 'WPA';

  final _vcardNameController = TextEditingController();
  final _vcardPhoneController = TextEditingController();
  final _vcardEmailController = TextEditingController();

  String _qrData = 'https://';
  bool _wifiPassVisible = false;

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

  // FIX: Set _selectedType BEFORE calling _encodeContent so the right
  // branch is used immediately — no stale state.
  void _selectType(String type) {
    _selectedType = type;
    setState(() {
      _qrData = _encodeContent();
    });
  }

  void _updateQr() {
    final data = _encodeContent();
    if (data != _qrData) {
      setState(() => _qrData = data);
    }
  }

  // FIX: Escape special Wi-Fi characters per the Wi-Fi QR spec.
  String _escapeWifi(String s) {
    return s
        .replaceAll('\\', '\\\\')
        .replaceAll(';', '\\;')
        .replaceAll(',', '\\,')
        .replaceAll('"', '\\"')
        .replaceAll(':', '\\:');
  }

  // FIX: Never return a plain space — return a clearly valid placeholder or
  // the real data so scanners always get something meaningful.
  String _encodeContent() {
    switch (_selectedType) {
      case 'URL':
        final url = _urlController.text.trim();
        return url.isEmpty ? 'https://' : url;

      case 'Text':
        final text = _textController.text;
        return text.isEmpty ? 'Text QR' : text;

      case 'Email':
        final email = _emailController.text.trim();
        return email.isEmpty ? 'mailto:' : 'mailto:$email';

      case 'Phone':
        final phone = _phoneController.text.trim();
        return phone.isEmpty ? 'tel:' : 'tel:$phone';

      case 'Wi-Fi':
        final ssid = _wifiSsidController.text;
        final pass = _wifiPassController.text;
        if (ssid.isEmpty) return 'WIFI:T:WPA;S:;P:;;';
        // FIX: Properly escape SSID and password special characters.
        return 'WIFI:T:$_wifiEncryption;S:${_escapeWifi(ssid)};P:${_escapeWifi(pass)};;';

      case 'vCard':
        final name = _vcardNameController.text;
        final phone = _vcardPhoneController.text;
        final email = _vcardEmailController.text;
        if (name.isEmpty) return 'BEGIN:VCARD\nVERSION:3.0\nFN:Name\nEND:VCARD';
        return 'BEGIN:VCARD\nVERSION:3.0\nFN:$name\nTEL:$phone\nEMAIL:$email\nEND:VCARD';

      default:
        return 'QR';
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

      // Wire up gallery_saver or image_gallery_saver here to persist to disk.
      // Example (add dependency first):
      //   final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      _showSnack(
        'QR captured! Wire up image_gallery_saver to save to gallery.',
      );
    } catch (e) {
      _showSnack('Error: $e');
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  bool get _hasValidData {
    switch (_selectedType) {
      case 'URL':
        return _urlController.text.trim().isNotEmpty;
      case 'Text':
        return _textController.text.isNotEmpty;
      case 'Email':
        return _emailController.text.trim().isNotEmpty;
      case 'Phone':
        return _phoneController.text.trim().isNotEmpty;
      case 'Wi-Fi':
        return _wifiSsidController.text.isNotEmpty;
      case 'vCard':
        return _vcardNameController.text.isNotEmpty;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
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
                      // FIX: update _selectedType before encoding
                      onSelected: (_) => _selectType(t),
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
                      data: _qrData,
                      version: QrVersions.auto,
                      size: 220,
                      // FIX: set error correction level so more scanners can read it
                      errorCorrectionLevel: QrErrorCorrectLevel.M,
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
              const SizedBox(height: 8),

              // Show the encoded data so you can debug what's in the QR
              if (_hasValidData)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    'Encoded: $_qrData',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              const SizedBox(height: 16),

              // --- Download button ---
              ElevatedButton.icon(
                onPressed: _hasValidData ? _downloadQr : null,
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
            // FIX: password field with visibility toggle
            TextField(
              controller: _wifiPassController,
              obscureText: !_wifiPassVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _wifiPassVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () =>
                      setState(() => _wifiPassVisible = !_wifiPassVisible),
                ),
              ),
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
                if (v != null) {
                  _wifiEncryption = v;
                  _updateQr();
                }
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
