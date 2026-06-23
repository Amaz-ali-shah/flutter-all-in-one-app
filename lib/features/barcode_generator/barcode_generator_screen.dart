import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeGeneratorScreen extends StatefulWidget {
  const BarcodeGeneratorScreen({super.key});

  @override
  State<BarcodeGeneratorScreen> createState() => _BarcodeGeneratorScreenState();
}

class _BarcodeGeneratorScreenState extends State<BarcodeGeneratorScreen> {
  String _selectedFormat = 'CODE128';
  final List<String> _formats = ['CODE128', 'EAN-13', 'EAN-8', 'UPC-A'];

  final _inputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _barcodeData = '';
  String? _fullCode;

  final GlobalKey _repaintKey = GlobalKey();

  String? _validate(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a value';
    switch (_selectedFormat) {
      case 'CODE128':
        if (value.length < 1 || value.length > 80) {
          return 'CODE128: 1–80 characters';
        }
        return null;
      case 'EAN-13':
        if (!RegExp(r'^\d{12}$').hasMatch(value)) {
          return 'EAN-13: exactly 12 digits (check digit auto-added)';
        }
        return null;
      case 'EAN-8':
        if (!RegExp(r'^\d{7}$').hasMatch(value)) {
          return 'EAN-8: exactly 7 digits (check digit auto-added)';
        }
        return null;
      case 'UPC-A':
        if (!RegExp(r'^\d{11}$').hasMatch(value)) {
          return 'UPC-A: exactly 11 digits (check digit auto-added)';
        }
        return null;
    }
    return null;
  }

  int _eanCheckDigit(String digits) {
    int sum = 0;
    for (int i = 0; i < digits.length; i++) {
      final d = int.parse(digits[i]);
      sum += (i % 2 == 0) ? d : d * 3;
    }
    final mod = sum % 10;
    return mod == 0 ? 0 : 10 - mod;
  }

  String _buildFullCode(String input) {
    switch (_selectedFormat) {
      case 'EAN-13':
      case 'EAN-8':
      case 'UPC-A':
        final check = _eanCheckDigit(input);
        return '$input$check';
      default:
        return input;
    }
  }

  Barcode _getBarcodeType() {
    switch (_selectedFormat) {
      case 'EAN-13':
        return Barcode.ean13();
      case 'EAN-8':
        return Barcode.ean8();
      case 'UPC-A':
        return Barcode.upcA();
      case 'CODE128':
      default:
        return Barcode.code128();
    }
  }

  void _generate() {
    if (_formKey.currentState!.validate()) {
      final full = _buildFullCode(_inputController.text.trim());
      setState(() {
        _barcodeData = full;
        _fullCode = full;
      });
    }
  }

  Future<void> _download() async {
    try {
      final boundary =
          _repaintKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 4.0);
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (byteData == null) {
        _showSnack('Failed to capture barcode.');
        return;
      }
      _showSnack('Barcode captured! Add gallery_saver to save to gallery.');
    } catch (e) {
      _showSnack('Error: $e');
    }
  }

  void _showSnack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  String get _hintText {
    switch (_selectedFormat) {
      case 'CODE128':
        return 'e.g. HELLO-WORLD-123';
      case 'EAN-13':
        return 'Enter 12 digits, e.g. 590123412345';
      case 'EAN-8':
        return 'Enter 7 digits, e.g. 9638507';
      case 'UPC-A':
        return 'Enter 11 digits, e.g. 01234565431';
      default:
        return '';
    }
  }

  String get _helperText {
    switch (_selectedFormat) {
      case 'EAN-13':
      case 'EAN-8':
      case 'UPC-A':
        return 'Check digit will be auto-calculated and appended';
      default:
        return '';
    }
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'tool-icon-Barcode Generator',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.withOpacity(0.95),
                    Colors.teal.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.document_scanner,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('Barcode Generator'),
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
              // --- Format dropdown ---
              DropdownButtonFormField<String>(
                value: _selectedFormat,
                decoration: const InputDecoration(
                  labelText: 'Barcode Format',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.barcode_reader),
                ),
                items: _formats
                    .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                    .toList(),
                onChanged: (v) {
                  if (v != null) {
                    setState(() {
                      _selectedFormat = v;
                      _barcodeData = '';
                      _fullCode = null;
                      _inputController.clear();
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              // --- Input field + validation ---
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _inputController,
                  onTapOutside: (_) =>
                      FocusScope.of(context).unfocus(), // ← key fix
                  keyboardType: _selectedFormat == 'CODE128'
                      ? TextInputType.text
                      : TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Barcode Content',
                    hintText: _hintText,
                    helperText: _helperText,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _inputController.clear();
                        setState(() {
                          _barcodeData = '';
                          _fullCode = null;
                        });
                      },
                    ),
                  ),
                  validator: _validate,
                  onChanged: (_) {
                    if (_barcodeData.isNotEmpty) {
                      setState(() {
                        _barcodeData = '';
                        _fullCode = null;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              // --- Generate button ---
              ElevatedButton.icon(
                onPressed: _generate,
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Generate Barcode'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 28),

              // --- Barcode preview ---
              if (_barcodeData.isNotEmpty) ...[
                if (_fullCode != null &&
                    _fullCode != _inputController.text.trim())
                  Center(
                    child: Text(
                      'Full code: $_fullCode',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                const SizedBox(height: 12),

                Center(
                  child: RepaintBoundary(
                    key: _repaintKey,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 20,
                      ),
                      child: BarcodeWidget(
                        barcode: _getBarcodeType(),
                        data: _barcodeData,
                        width: 300,
                        height: 100,
                        drawText: true,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // --- Download button ---
                ElevatedButton.icon(
                  onPressed: _download,
                  icon: const Icon(Icons.download),
                  label: const Text('Download Barcode (PNG)'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
