// import 'package:flutter/material.dart';

// class AgeCalculatorScreen extends StatefulWidget {
//   const AgeCalculatorScreen({super.key});

//   @override
//   State<AgeCalculatorScreen> createState() => _AgeCalculatorScreenState();
// }

// class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
//   DateTime? _dob;
//   DateTime _asOf = DateTime.now();
//   bool _useCustomAsOf = false;

//   // --- Result fields ---
//   int? _years, _months, _days;
//   int? _totalDays, _totalWeeks;
//   int? _nextBirthdayDays;
//   String? _nextBirthdayDate;

//   // ----------------------------------------------------------------
//   // Date pickers
//   // ----------------------------------------------------------------
//   Future<void> _pickDob() async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: _dob ?? DateTime(2000),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//       helpText: 'Select Date of Birth',
//     );
//     if (picked != null) {
//       setState(() {
//         _dob = picked;
//         _clearResults();
//       });
//     }
//   }

//   Future<void> _pickAsOf() async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: _asOf,
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//       helpText: 'Calculate age as of…',
//     );
//     if (picked != null) {
//       setState(() {
//         _asOf = picked;
//         _clearResults();
//       });
//     }
//   }

//   void _clearResults() {
//     _years = _months = _days = _totalDays = _totalWeeks = _nextBirthdayDays =
//         null;
//     _nextBirthdayDate = null;
//   }

//   // ----------------------------------------------------------------
//   // Core calculation — pure Dart, no packages
//   // ----------------------------------------------------------------
//   void _calculate() {
//     if (_dob == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a date of birth first.')),
//       );
//       return;
//     }

//     final ref = _useCustomAsOf ? _asOf : DateTime.now();

//     if (_dob!.isAfter(ref)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Date of birth cannot be after the reference date.'),
//         ),
//       );
//       return;
//     }

//     // Years
//     int years = ref.year - _dob!.year;
//     int months = ref.month - _dob!.month;
//     int days = ref.day - _dob!.day;

//     if (days < 0) {
//       months--;
//       // Days in previous month of ref
//       final prevMonth = DateTime(ref.year, ref.month, 0);
//       days += prevMonth.day;
//     }
//     if (months < 0) {
//       years--;
//       months += 12;
//     }

//     // Total days & weeks
//     final totalDays = ref.difference(_dob!).inDays;
//     final totalWeeks = totalDays ~/ 7;

//     // Next birthday
//     DateTime nextBirthday = DateTime(ref.year, _dob!.month, _dob!.day);
//     if (!nextBirthday.isAfter(ref)) {
//       nextBirthday = DateTime(ref.year + 1, _dob!.month, _dob!.day);
//     }
//     final nextBirthdayDays = nextBirthday.difference(ref).inDays;

//     setState(() {
//       _years = years;
//       _months = months;
//       _days = days;
//       _totalDays = totalDays;
//       _totalWeeks = totalWeeks;
//       _nextBirthdayDays = nextBirthdayDays;
//       _nextBirthdayDate = _formatDate(nextBirthday);
//     });
//   }

//   // ----------------------------------------------------------------
//   // Helpers
//   // ----------------------------------------------------------------
//   String _formatDate(DateTime d) {
//     const months = [
//       '',
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec',
//     ];
//     return '${d.day} ${months[d.month]} ${d.year}';
//   }

//   String _formatDateFull(DateTime d) {
//     const monthNames = [
//       '',
//       'January',
//       'February',
//       'March',
//       'April',
//       'May',
//       'June',
//       'July',
//       'August',
//       'September',
//       'October',
//       'November',
//       'December',
//     ];
//     const weekdays = [
//       '',
//       'Monday',
//       'Tuesday',
//       'Wednesday',
//       'Thursday',
//       'Friday',
//       'Saturday',
//       'Sunday',
//     ];
//     return '${weekdays[d.weekday]}, ${d.day} ${monthNames[d.month]} ${d.year}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Age Calculator'),
//         backgroundColor: colorScheme.inversePrimary,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // --- DOB picker ---
//             _SectionCard(
//               title: 'Date of Birth',
//               child: InkWell(
//                 onTap: _pickDob,
//                 borderRadius: BorderRadius.circular(12),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 14,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: colorScheme.outline),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.cake, color: Colors.amber[700]),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           _dob != null
//                               ? _formatDateFull(_dob!)
//                               : 'Tap to select date of birth',
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: _dob != null
//                                 ? colorScheme.onSurface
//                                 : colorScheme.onSurface.withOpacity(0.5),
//                           ),
//                         ),
//                       ),
//                       Icon(
//                         Icons.calendar_today,
//                         size: 18,
//                         color: colorScheme.primary,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),

//             // --- Optional "as of" date ---
//             _SectionCard(
//               title: 'Calculate As Of (optional)',
//               child: Column(
//                 children: [
//                   SwitchListTile(
//                     contentPadding: EdgeInsets.zero,
//                     title: const Text('Use custom date'),
//                     subtitle: const Text('Default is today'),
//                     value: _useCustomAsOf,
//                     onChanged: (v) => setState(() {
//                       _useCustomAsOf = v;
//                       if (!v) _asOf = DateTime.now();
//                       _clearResults();
//                     }),
//                   ),
//                   if (_useCustomAsOf) ...[
//                     const SizedBox(height: 8),
//                     InkWell(
//                       onTap: _pickAsOf,
//                       borderRadius: BorderRadius.circular(12),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 14,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: colorScheme.outline),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(Icons.event, color: colorScheme.primary),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Text(
//                                 _formatDateFull(_asOf),
//                                 style: const TextStyle(fontSize: 15),
//                               ),
//                             ),
//                             Icon(
//                               Icons.calendar_today,
//                               size: 18,
//                               color: colorScheme.primary,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // --- Calculate button ---
//             ElevatedButton.icon(
//               onPressed: _calculate,
//               icon: const Icon(Icons.calculate),
//               label: const Text('Calculate Age'),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 textStyle: const TextStyle(fontSize: 16),
//               ),
//             ),
//             const SizedBox(height: 24),

//             // --- Results ---
//             if (_years != null) ...[
//               // Main age display
//               Card(
//                 color: colorScheme.primaryContainer,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       Text(
//                         '$_years Years',
//                         style: TextStyle(
//                           fontSize: 42,
//                           fontWeight: FontWeight.bold,
//                           color: colorScheme.onPrimaryContainer,
//                         ),
//                       ),
//                       Text(
//                         '$_months months  $_days days',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: colorScheme.onPrimaryContainer.withOpacity(
//                             0.8,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),

//               // Stats row
//               Row(
//                 children: [
//                   Expanded(
//                     child: _StatCard(
//                       icon: Icons.today,
//                       label: 'Total Days',
//                       value: _formatNumber(_totalDays!),
//                       color: Colors.blue,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _StatCard(
//                       icon: Icons.date_range,
//                       label: 'Total Weeks',
//                       value: _formatNumber(_totalWeeks!),
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),

//               // Next birthday
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.orange.withOpacity(0.15),
//                     child: const Icon(Icons.celebration, color: Colors.orange),
//                   ),
//                   title: const Text('Next Birthday'),
//                   subtitle: Text(_nextBirthdayDate ?? ''),
//                   trailing: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 6,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.orange.withOpacity(0.15),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       _nextBirthdayDays == 0
//                           ? '🎉 Today!'
//                           : 'in $_nextBirthdayDays days',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   String _formatNumber(int n) {
//     // Add comma separators
//     final s = n.toString();
//     final buf = StringBuffer();
//     for (int i = 0; i < s.length; i++) {
//       if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
//       buf.write(s[i]);
//     }
//     return buf.toString();
//   }
// }

// // ---------------------------------------------------------------------------
// // Reusable sub-widgets
// // ---------------------------------------------------------------------------
// class _SectionCard extends StatelessWidget {
//   final String title;
//   final Widget child;
//   const _SectionCard({required this.title, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 8),
//         child,
//       ],
//     );
//   }
// }

// class _StatCard extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;
//   final Color color;
//   const _StatCard({
//     required this.icon,
//     required this.label,
//     required this.value,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: color.withOpacity(0.15),
//               child: Icon(icon, color: color, size: 22),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               value,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AgeCalculatorScreen extends StatefulWidget {
  const AgeCalculatorScreen({super.key});

  @override
  State<AgeCalculatorScreen> createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen>
    with SingleTickerProviderStateMixin {
  DateTime? _dob;
  DateTime _asOf = DateTime.now();
  bool _useCustomAsOf = false;

  // --- Result fields ---
  int? _years, _months, _days;
  int? _totalDays, _totalWeeks;
  int? _nextBirthdayDays;
  String? _nextBirthdayDate;

  // Controls the animated appearance of the results section.
  late final AnimationController _resultsCtrl;
  late final Animation<double> _resultsFade;
  late final Animation<Offset> _resultsSlide;

  @override
  void initState() {
    super.initState();
    _resultsCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _resultsFade = CurvedAnimation(parent: _resultsCtrl, curve: Curves.easeOut);
    _resultsSlide =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(parent: _resultsCtrl, curve: Curves.easeOutCubic),
        );
  }

  @override
  void dispose() {
    _resultsCtrl.dispose();
    super.dispose();
  }

  // ----------------------------------------------------------------
  // Date pickers
  // ----------------------------------------------------------------
  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Select Date of Birth',
    );
    if (picked != null) {
      setState(() {
        _dob = picked;
        _clearResults();
      });
    }
  }

  Future<void> _pickAsOf() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _asOf,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: 'Calculate age as of…',
    );
    if (picked != null) {
      setState(() {
        _asOf = picked;
        _clearResults();
      });
    }
  }

  void _clearResults() {
    _resultsCtrl.reset();
    _years = _months = _days = _totalDays = _totalWeeks = _nextBirthdayDays =
        null;
    _nextBirthdayDate = null;
  }

  // ----------------------------------------------------------------
  // Core calculation — pure Dart, no packages
  // ----------------------------------------------------------------
  void _calculate() {
    if (_dob == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date of birth first.')),
      );
      return;
    }

    final ref = _useCustomAsOf ? _asOf : DateTime.now();

    if (_dob!.isAfter(ref)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Date of birth cannot be after the reference date.'),
        ),
      );
      return;
    }

    int years = ref.year - _dob!.year;
    int months = ref.month - _dob!.month;
    int days = ref.day - _dob!.day;

    if (days < 0) {
      months--;
      final prevMonth = DateTime(ref.year, ref.month, 0);
      days += prevMonth.day;
    }
    if (months < 0) {
      years--;
      months += 12;
    }

    final totalDays = ref.difference(_dob!).inDays;
    final totalWeeks = totalDays ~/ 7;

    DateTime nextBirthday = DateTime(ref.year, _dob!.month, _dob!.day);
    if (!nextBirthday.isAfter(ref)) {
      nextBirthday = DateTime(ref.year + 1, _dob!.month, _dob!.day);
    }
    final nextBirthdayDays = nextBirthday.difference(ref).inDays;

    setState(() {
      _years = years;
      _months = months;
      _days = days;
      _totalDays = totalDays;
      _totalWeeks = totalWeeks;
      _nextBirthdayDays = nextBirthdayDays;
      _nextBirthdayDate = _formatDate(nextBirthday);
    });

    // Animate results in after state update.
    _resultsCtrl.forward(from: 0.0);
  }

  // ----------------------------------------------------------------
  // Helpers
  // ----------------------------------------------------------------
  String _formatDate(DateTime d) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${d.day} ${months[d.month]} ${d.year}';
  }

  String _formatDateFull(DateTime d) {
    const monthNames = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    const weekdays = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return '${weekdays[d.weekday]}, ${d.day} ${monthNames[d.month]} ${d.year}';
  }

  String _formatNumber(int n) {
    final s = n.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return buf.toString();
  }

  // ----------------------------------------------------------------
  // Build
  // ----------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        // Hero-compatible leading icon that matches the card icon tag.
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'tool-icon-Age Calculator',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.withOpacity(0.95),
                    Colors.orange.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.cake_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('Age Calculator'),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- DOB picker ---
            _SectionCard(
              title: 'Date of Birth',
              child: InkWell(
                onTap: _pickDob,
                borderRadius: BorderRadius.circular(12),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _dob != null
                          ? colorScheme.primary
                          : colorScheme.outline,
                      width: _dob != null ? 1.5 : 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.cake, color: Colors.amber[700]),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _dob != null
                              ? _formatDateFull(_dob!)
                              : 'Tap to select date of birth',
                          style: TextStyle(
                            fontSize: 15,
                            color: _dob != null
                                ? colorScheme.onSurface
                                : colorScheme.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // --- Optional "as of" date ---
            _SectionCard(
              title: 'Calculate As Of (optional)',
              child: Column(
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Use custom date'),
                    subtitle: const Text('Default is today'),
                    value: _useCustomAsOf,
                    onChanged: (v) => setState(() {
                      _useCustomAsOf = v;
                      if (!v) _asOf = DateTime.now();
                      _clearResults();
                    }),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeOutCubic,
                    child: _useCustomAsOf
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: InkWell(
                              onTap: _pickAsOf,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: colorScheme.outline,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.event,
                                      color: colorScheme.primary,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        _formatDateFull(_asOf),
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      size: 18,
                                      color: colorScheme.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- Calculate button ---
            ElevatedButton.icon(
              onPressed: _calculate,
              icon: const Icon(Icons.calculate),
              label: const Text('Calculate Age'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),

            // --- Results (animated entry) ---
            if (_years != null)
              FadeTransition(
                opacity: _resultsFade,
                child: SlideTransition(
                  position: _resultsSlide,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Main age display
                      Card(
                        color: colorScheme.primaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                '$_years Years',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onPrimaryContainer,
                                ),
                              ),
                              Text(
                                '$_months months  $_days days',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colorScheme.onPrimaryContainer
                                      .withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Stats row
                      Row(
                        children: [
                          Expanded(
                            child: _StatCard(
                              icon: Icons.today,
                              label: 'Total Days',
                              value: _formatNumber(_totalDays!),
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _StatCard(
                              icon: Icons.date_range,
                              label: 'Total Weeks',
                              value: _formatNumber(_totalWeeks!),
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Next birthday
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange.withOpacity(0.15),
                            child: const Icon(
                              Icons.celebration,
                              color: Colors.orange,
                            ),
                          ),
                          title: const Text('Next Birthday'),
                          subtitle: Text(_nextBirthdayDate ?? ''),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _nextBirthdayDays == 0
                                  ? '🎉 Today!'
                                  : 'in $_nextBirthdayDays days',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Reusable sub-widgets
// ---------------------------------------------------------------------------
class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
