// import 'package:flutter/material.dart';

// // ---------------------------------------------------------------------------
// // All conversion factors — base unit listed in comment
// // Temperature handled separately (non-linear)
// // ---------------------------------------------------------------------------
// class _UnitData {
//   final String category;
//   final IconData icon;
//   final Color color;
//   final String baseUnit;
//   // factor = how many base units this unit equals
//   final Map<String, double> units;

//   const _UnitData({
//     required this.category,
//     required this.icon,
//     required this.color,
//     required this.baseUnit,
//     required this.units,
//   });
// }

// const _categories = [
//   _UnitData(
//     category: 'Length',
//     icon: Icons.straighten,
//     color: Colors.blue,
//     baseUnit: 'Meter',
//     units: {
//       'Kilometer': 0.001,
//       'Meter': 1,
//       'Centimeter': 100,
//       'Millimeter': 1000,
//       'Mile': 0.000621371,
//       'Yard': 1.09361,
//       'Foot': 3.28084,
//       'Inch': 39.3701,
//       'Nautical Mile': 0.000539957,
//     },
//   ),
//   _UnitData(
//     category: 'Weight',
//     icon: Icons.monitor_weight,
//     color: Colors.green,
//     baseUnit: 'Kilogram',
//     units: {
//       'Kilogram': 1,
//       'Gram': 1000,
//       'Milligram': 1e6,
//       'Metric Ton': 0.001,
//       'Pound': 2.20462,
//       'Ounce': 35.274,
//       'Stone': 0.157473,
//     },
//   ),
//   _UnitData(
//     category: 'Temperature',
//     icon: Icons.thermostat,
//     color: Colors.red,
//     baseUnit: 'Celsius',
//     units: {'Celsius': 1, 'Fahrenheit': 1, 'Kelvin': 1},
//   ),
//   _UnitData(
//     category: 'Area',
//     icon: Icons.crop_square,
//     color: Colors.purple,
//     baseUnit: 'Square Meter',
//     units: {
//       'Square Meter': 1,
//       'Square Kilometer': 1e-6,
//       'Square Mile': 3.861e-7,
//       'Square Yard': 1.19599,
//       'Square Foot': 10.7639,
//       'Square Inch': 1550.0,
//       'Hectare': 0.0001,
//       'Acre': 0.000247105,
//     },
//   ),
//   _UnitData(
//     category: 'Volume',
//     icon: Icons.water_drop,
//     color: Colors.cyan,
//     baseUnit: 'Liter',
//     units: {
//       'Liter': 1,
//       'Milliliter': 1000,
//       'Cubic Meter': 0.001,
//       'Gallon (US)': 0.264172,
//       'Gallon (UK)': 0.219969,
//       'Quart': 1.05669,
//       'Pint': 2.11338,
//       'Cup': 4.22675,
//       'Fluid Ounce': 33.814,
//       'Tablespoon': 67.628,
//       'Teaspoon': 202.884,
//     },
//   ),
//   _UnitData(
//     category: 'Speed',
//     icon: Icons.speed,
//     color: Colors.orange,
//     baseUnit: 'Meter/Second',
//     units: {
//       'Meter/Second': 1,
//       'Kilometer/Hour': 3.6,
//       'Mile/Hour': 2.23694,
//       'Foot/Second': 3.28084,
//       'Knot': 1.94384,
//     },
//   ),
//   _UnitData(
//     category: 'Time',
//     icon: Icons.access_time,
//     color: Colors.teal,
//     baseUnit: 'Second',
//     units: {
//       'Second': 1,
//       'Millisecond': 1000,
//       'Minute': 1 / 60,
//       'Hour': 1 / 3600,
//       'Day': 1 / 86400,
//       'Week': 1 / 604800,
//       'Month (avg)': 1 / 2629800,
//       'Year': 1 / 31557600,
//     },
//   ),
//   _UnitData(
//     category: 'Energy',
//     icon: Icons.bolt,
//     color: Colors.amber,
//     baseUnit: 'Joule',
//     units: {
//       'Joule': 1,
//       'Kilojoule': 0.001,
//       'Calorie': 0.239006,
//       'Kilocalorie': 0.000239006,
//       'Watt-Hour': 0.000277778,
//       'Kilowatt-Hour': 2.77778e-7,
//       'BTU': 0.000947817,
//       'Electronvolt': 6.242e18,
//     },
//   ),
//   _UnitData(
//     category: 'Pressure',
//     icon: Icons.compress,
//     color: Colors.indigo,
//     baseUnit: 'Pascal',
//     units: {
//       'Pascal': 1,
//       'Kilopascal': 0.001,
//       'Bar': 1e-5,
//       'PSI': 0.000145038,
//       'Atmosphere': 9.8692e-6,
//       'Torr': 0.00750062,
//     },
//   ),
//   _UnitData(
//     category: 'Data',
//     icon: Icons.storage,
//     color: Colors.brown,
//     baseUnit: 'Byte',
//     units: {
//       'Bit': 8,
//       'Byte': 1,
//       'Kilobyte': 1 / 1024,
//       'Megabyte': 1 / 1048576,
//       'Gigabyte': 1 / 1073741824,
//       'Terabyte': 1 / 1.09951e12,
//       'Petabyte': 1 / 1.12590e15,
//     },
//   ),
//   _UnitData(
//     category: 'Angle',
//     icon: Icons.rotate_right,
//     color: Colors.pink,
//     baseUnit: 'Degree',
//     units: {
//       'Degree': 1,
//       'Radian': 0.0174533,
//       'Gradian': 1.11111,
//       'Arcminute': 60,
//       'Arcsecond': 3600,
//       'Turn': 0.00277778,
//     },
//   ),
//   _UnitData(
//     category: 'Fuel',
//     icon: Icons.local_gas_station,
//     color: Colors.deepOrange,
//     baseUnit: 'L/100km',
//     units: {
//       'L/100km': 1,
//       'km/L': 100, // convert separately
//       'MPG (US)': 235.215,
//       'MPG (UK)': 282.481,
//     },
//   ),
// ];

// // ---------------------------------------------------------------------------
// // Main screen — category grid
// // ---------------------------------------------------------------------------
// class UnitConverterScreen extends StatelessWidget {
//   const UnitConverterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Unit Converter'),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: GridView.builder(
//           itemCount: _categories.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 0.95,
//           ),
//           itemBuilder: (context, i) {
//             final cat = _categories[i];
//             return InkWell(
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => _ConverterScreen(data: cat)),
//               ),
//               borderRadius: BorderRadius.circular(16),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: cat.color.withOpacity(0.15),
//                       child: Icon(cat.icon, color: cat.color, size: 24),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       cat.category,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// // ---------------------------------------------------------------------------
// // Converter screen for a single category
// // ---------------------------------------------------------------------------
// class _ConverterScreen extends StatefulWidget {
//   final _UnitData data;
//   const _ConverterScreen({required this.data});

//   @override
//   State<_ConverterScreen> createState() => _ConverterScreenState();
// }

// class _ConverterScreenState extends State<_ConverterScreen> {
//   late String _fromUnit;
//   late String _toUnit;
//   final _inputController = TextEditingController();
//   String _result = '';

//   @override
//   void initState() {
//     super.initState();
//     final keys = widget.data.units.keys.toList();
//     _fromUnit = keys[0];
//     _toUnit = keys.length > 1 ? keys[1] : keys[0];
//     _inputController.addListener(_convert);
//   }

//   @override
//   void dispose() {
//     _inputController.dispose();
//     super.dispose();
//   }

//   void _convert() {
//     final input = double.tryParse(_inputController.text);
//     if (input == null) {
//       setState(() => _result = '');
//       return;
//     }

//     double result;
//     if (widget.data.category == 'Temperature') {
//       result = _convertTemp(input, _fromUnit, _toUnit);
//     } else {
//       // Convert: input → base → target
//       final fromFactor = widget.data.units[_fromUnit]!;
//       final toFactor = widget.data.units[_toUnit]!;
//       // value in base = input / fromFactor  (since factor = units per base)
//       final inBase = input / fromFactor;
//       result = inBase * toFactor;
//     }

//     setState(() {
//       _result = _formatResult(result);
//     });
//   }

//   double _convertTemp(double value, String from, String to) {
//     // Convert to Celsius first
//     double celsius;
//     switch (from) {
//       case 'Celsius':
//         celsius = value;
//         break;
//       case 'Fahrenheit':
//         celsius = (value - 32) * 5 / 9;
//         break;
//       case 'Kelvin':
//         celsius = value - 273.15;
//         break;
//       default:
//         celsius = value;
//     }
//     // Then to target
//     switch (to) {
//       case 'Celsius':
//         return celsius;
//       case 'Fahrenheit':
//         return celsius * 9 / 5 + 32;
//       case 'Kelvin':
//         return celsius + 273.15;
//       default:
//         return celsius;
//     }
//   }

//   String _formatResult(double v) {
//     if (v == 0) return '0';
//     if (v.abs() >= 1e12 || (v.abs() < 1e-6 && v != 0)) {
//       return v.toStringAsExponential(6);
//     }
//     // Up to 8 significant digits, trim trailing zeros
//     String s = v.toStringAsFixed(8);
//     s = s.replaceAll(RegExp(r'0+$'), '');
//     s = s.replaceAll(RegExp(r'\.$'), '');
//     return s;
//   }

//   void _swap() {
//     setState(() {
//       final tmp = _fromUnit;
//       _fromUnit = _toUnit;
//       _toUnit = tmp;
//     });
//     _convert();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final units = widget.data.units.keys.toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.data.category),
//         backgroundColor: colorScheme.inversePrimary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Category icon banner
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: widget.data.color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Row(
//                 children: [
//                   Icon(widget.data.icon, color: widget.data.color, size: 32),
//                   const SizedBox(width: 12),
//                   Text(
//                     '${widget.data.category} Converter',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: widget.data.color,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),

//             // From unit
//             _label('From'),
//             DropdownButtonFormField<String>(
//               value: _fromUnit,
//               decoration: const InputDecoration(border: OutlineInputBorder()),
//               items: units
//                   .map((u) => DropdownMenuItem(value: u, child: Text(u)))
//                   .toList(),
//               onChanged: (v) {
//                 if (v != null) setState(() => _fromUnit = v);
//                 _convert();
//               },
//             ),
//             const SizedBox(height: 12),

//             // Input value
//             TextField(
//               controller: _inputController,
//               keyboardType: const TextInputType.numberWithOptions(
//                 decimal: true,
//                 signed: true,
//               ),
//               decoration: InputDecoration(
//                 labelText: 'Enter value',
//                 border: const OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () => _inputController.clear(),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),

//             // Swap button
//             Center(
//               child: IconButton.filled(
//                 tooltip: 'Swap units',
//                 icon: const Icon(Icons.swap_vert),
//                 onPressed: _swap,
//               ),
//             ),
//             const SizedBox(height: 8),

//             // To unit
//             _label('To'),
//             DropdownButtonFormField<String>(
//               value: _toUnit,
//               decoration: const InputDecoration(border: OutlineInputBorder()),
//               items: units
//                   .map((u) => DropdownMenuItem(value: u, child: Text(u)))
//                   .toList(),
//               onChanged: (v) {
//                 if (v != null) setState(() => _toUnit = v);
//                 _convert();
//               },
//             ),
//             const SizedBox(height: 24),

//             // Result
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: colorScheme.primaryContainer,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: _result.isEmpty
//                   ? Center(
//                       child: Text(
//                         'Enter a value above',
//                         style: TextStyle(
//                           color: colorScheme.onPrimaryContainer.withOpacity(
//                             0.5,
//                           ),
//                         ),
//                       ),
//                     )
//                   : Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${_inputController.text} $_fromUnit  =',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: colorScheme.onPrimaryContainer.withOpacity(
//                               0.7,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           '$_result $_toUnit',
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: colorScheme.onPrimaryContainer,
//                           ),
//                         ),
//                       ],
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _label(String text) => Padding(
//     padding: const EdgeInsets.only(bottom: 6),
//     child: Text(
//       text,
//       style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//     ),
//   );
// }
import 'package:all_in_one_ui/utils/app_transitions.dart';
import 'package:flutter/material.dart';
import '../../utils/app_transitions.dart'; // make sure this imports your transitions

// ---------------------------------------------------------------------------
// All conversion factors — base unit listed in comment
// Temperature handled separately (non-linear)
// ---------------------------------------------------------------------------
class _UnitData {
  final String category;
  final IconData icon;
  final Color color;
  final String baseUnit;
  final Map<String, double> units;

  const _UnitData({
    required this.category,
    required this.icon,
    required this.color,
    required this.baseUnit,
    required this.units,
  });
}

const _categories = [
  _UnitData(
    category: 'Length',
    icon: Icons.straighten,
    color: Colors.blue,
    baseUnit: 'Meter',
    units: {
      'Kilometer': 0.001,
      'Meter': 1,
      'Centimeter': 100,
      'Millimeter': 1000,
      'Mile': 0.000621371,
      'Yard': 1.09361,
      'Foot': 3.28084,
      'Inch': 39.3701,
      'Nautical Mile': 0.000539957,
    },
  ),
  _UnitData(
    category: 'Weight',
    icon: Icons.monitor_weight,
    color: Colors.green,
    baseUnit: 'Kilogram',
    units: {
      'Kilogram': 1,
      'Gram': 1000,
      'Milligram': 1e6,
      'Metric Ton': 0.001,
      'Pound': 2.20462,
      'Ounce': 35.274,
      'Stone': 0.157473,
    },
  ),
  _UnitData(
    category: 'Temperature',
    icon: Icons.thermostat,
    color: Colors.red,
    baseUnit: 'Celsius',
    units: {'Celsius': 1, 'Fahrenheit': 1, 'Kelvin': 1},
  ),
  _UnitData(
    category: 'Area',
    icon: Icons.crop_square,
    color: Colors.purple,
    baseUnit: 'Square Meter',
    units: {
      'Square Meter': 1,
      'Square Kilometer': 1e-6,
      'Square Mile': 3.861e-7,
      'Square Yard': 1.19599,
      'Square Foot': 10.7639,
      'Square Inch': 1550.0,
      'Hectare': 0.0001,
      'Acre': 0.000247105,
    },
  ),
  _UnitData(
    category: 'Volume',
    icon: Icons.water_drop,
    color: Colors.cyan,
    baseUnit: 'Liter',
    units: {
      'Liter': 1,
      'Milliliter': 1000,
      'Cubic Meter': 0.001,
      'Gallon (US)': 0.264172,
      'Gallon (UK)': 0.219969,
      'Quart': 1.05669,
      'Pint': 2.11338,
      'Cup': 4.22675,
      'Fluid Ounce': 33.814,
      'Tablespoon': 67.628,
      'Teaspoon': 202.884,
    },
  ),
  _UnitData(
    category: 'Speed',
    icon: Icons.speed,
    color: Colors.orange,
    baseUnit: 'Meter/Second',
    units: {
      'Meter/Second': 1,
      'Kilometer/Hour': 3.6,
      'Mile/Hour': 2.23694,
      'Foot/Second': 3.28084,
      'Knot': 1.94384,
    },
  ),
  _UnitData(
    category: 'Time',
    icon: Icons.access_time,
    color: Colors.teal,
    baseUnit: 'Second',
    units: {
      'Second': 1,
      'Millisecond': 1000,
      'Minute': 1 / 60,
      'Hour': 1 / 3600,
      'Day': 1 / 86400,
      'Week': 1 / 604800,
      'Month (avg)': 1 / 2629800,
      'Year': 1 / 31557600,
    },
  ),
  _UnitData(
    category: 'Energy',
    icon: Icons.bolt,
    color: Colors.amber,
    baseUnit: 'Joule',
    units: {
      'Joule': 1,
      'Kilojoule': 0.001,
      'Calorie': 0.239006,
      'Kilocalorie': 0.000239006,
      'Watt-Hour': 0.000277778,
      'Kilowatt-Hour': 2.77778e-7,
      'BTU': 0.000947817,
      'Electronvolt': 6.242e18,
    },
  ),
  _UnitData(
    category: 'Pressure',
    icon: Icons.compress,
    color: Colors.indigo,
    baseUnit: 'Pascal',
    units: {
      'Pascal': 1,
      'Kilopascal': 0.001,
      'Bar': 1e-5,
      'PSI': 0.000145038,
      'Atmosphere': 9.8692e-6,
      'Torr': 0.00750062,
    },
  ),
  _UnitData(
    category: 'Data',
    icon: Icons.storage,
    color: Colors.brown,
    baseUnit: 'Byte',
    units: {
      'Bit': 8,
      'Byte': 1,
      'Kilobyte': 1 / 1024,
      'Megabyte': 1 / 1048576,
      'Gigabyte': 1 / 1073741824,
      'Terabyte': 1 / 1.09951e12,
      'Petabyte': 1 / 1.12590e15,
    },
  ),
  _UnitData(
    category: 'Angle',
    icon: Icons.rotate_right,
    color: Colors.pink,
    baseUnit: 'Degree',
    units: {
      'Degree': 1,
      'Radian': 0.0174533,
      'Gradian': 1.11111,
      'Arcminute': 60,
      'Arcsecond': 3600,
      'Turn': 0.00277778,
    },
  ),
  _UnitData(
    category: 'Fuel',
    icon: Icons.local_gas_station,
    color: Colors.deepOrange,
    baseUnit: 'L/100km',
    units: {
      'L/100km': 1,
      'km/L': 100, // convert separately
      'MPG (US)': 235.215,
      'MPG (UK)': 282.481,
    },
  ),
];

// ---------------------------------------------------------------------------
// Main screen — category grid
// ---------------------------------------------------------------------------
class UnitConverterScreen extends StatelessWidget {
  const UnitConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        // ── Hero icon matching the home screen card ──
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'tool-icon-Unit Converter',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo.withOpacity(0.95),
                    Colors.indigo.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.swap_horiz_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('Unit Converter'),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: _categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, i) {
            final cat = _categories[i];
            return InkWell(
              onTap: () => Navigator.push(
                context,
                // ── Use elasticIn transition ──
                AppTransitions.elasticIn(_ConverterScreen(data: cat)),
              ),
              borderRadius: BorderRadius.circular(16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ── Hero for the category icon (used in detail screen) ──
                    Hero(
                      tag: 'converter-icon-${cat.category}',
                      child: CircleAvatar(
                        backgroundColor: cat.color.withOpacity(0.15),
                        child: Icon(cat.icon, color: cat.color, size: 24),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cat.category,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Converter screen for a single category
// ---------------------------------------------------------------------------
class _ConverterScreen extends StatefulWidget {
  final _UnitData data;
  const _ConverterScreen({required this.data});

  @override
  State<_ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<_ConverterScreen> {
  late String _fromUnit;
  late String _toUnit;
  final _inputController = TextEditingController();
  String _result = '';

  @override
  void initState() {
    super.initState();
    final keys = widget.data.units.keys.toList();
    _fromUnit = keys[0];
    _toUnit = keys.length > 1 ? keys[1] : keys[0];
    _inputController.addListener(_convert);
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _convert() {
    final input = double.tryParse(_inputController.text);
    if (input == null) {
      setState(() => _result = '');
      return;
    }

    double result;
    if (widget.data.category == 'Temperature') {
      result = _convertTemp(input, _fromUnit, _toUnit);
    } else {
      final fromFactor = widget.data.units[_fromUnit]!;
      final toFactor = widget.data.units[_toUnit]!;
      final inBase = input / fromFactor;
      result = inBase * toFactor;
    }

    setState(() {
      _result = _formatResult(result);
    });
  }

  double _convertTemp(double value, String from, String to) {
    double celsius;
    switch (from) {
      case 'Celsius':
        celsius = value;
        break;
      case 'Fahrenheit':
        celsius = (value - 32) * 5 / 9;
        break;
      case 'Kelvin':
        celsius = value - 273.15;
        break;
      default:
        celsius = value;
    }
    switch (to) {
      case 'Celsius':
        return celsius;
      case 'Fahrenheit':
        return celsius * 9 / 5 + 32;
      case 'Kelvin':
        return celsius + 273.15;
      default:
        return celsius;
    }
  }

  String _formatResult(double v) {
    if (v == 0) return '0';
    if (v.abs() >= 1e12 || (v.abs() < 1e-6 && v != 0)) {
      return v.toStringAsExponential(6);
    }
    String s = v.toStringAsFixed(8);
    s = s.replaceAll(RegExp(r'0+$'), '');
    s = s.replaceAll(RegExp(r'\.$'), '');
    return s;
  }

  void _swap() {
    setState(() {
      final tmp = _fromUnit;
      _fromUnit = _toUnit;
      _toUnit = tmp;
    });
    _convert();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final units = widget.data.units.keys.toList();

    return Scaffold(
      appBar: AppBar(
        // ── Hero icon matching the category grid item ──
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'converter-icon-${widget.data.category}',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.data.color.withOpacity(0.95),
                    widget.data.color.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.data.icon, color: Colors.white, size: 22),
            ),
          ),
        ),
        title: Text(widget.data.category),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.data.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(widget.data.icon, color: widget.data.color, size: 32),
                  const SizedBox(width: 12),
                  Text(
                    '${widget.data.category} Converter',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: widget.data.color,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _label('From'),
            DropdownButtonFormField<String>(
              value: _fromUnit,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: units
                  .map((u) => DropdownMenuItem(value: u, child: Text(u)))
                  .toList(),
              onChanged: (v) {
                if (v != null) setState(() => _fromUnit = v);
                _convert();
              },
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _inputController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: InputDecoration(
                labelText: 'Enter value',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _inputController.clear(),
                ),
              ),
            ),
            const SizedBox(height: 8),

            Center(
              child: IconButton.filled(
                tooltip: 'Swap units',
                icon: const Icon(Icons.swap_vert),
                onPressed: _swap,
              ),
            ),
            const SizedBox(height: 8),

            _label('To'),
            DropdownButtonFormField<String>(
              value: _toUnit,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: units
                  .map((u) => DropdownMenuItem(value: u, child: Text(u)))
                  .toList(),
              onChanged: (v) {
                if (v != null) setState(() => _toUnit = v);
                _convert();
              },
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: _result.isEmpty
                  ? Center(
                      child: Text(
                        'Enter a value above',
                        style: TextStyle(
                          color: colorScheme.onPrimaryContainer.withOpacity(
                            0.5,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_inputController.text} $_fromUnit  =',
                          style: TextStyle(
                            fontSize: 13,
                            color: colorScheme.onPrimaryContainer.withOpacity(
                              0.7,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$_result $_toUnit',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      text,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
    ),
  );
}
