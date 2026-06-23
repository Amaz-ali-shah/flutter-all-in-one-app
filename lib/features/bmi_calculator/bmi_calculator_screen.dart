import 'dart:math' as math;
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen>
    with SingleTickerProviderStateMixin {
  bool _isMetric = true;

  final _heightCmController = TextEditingController();
  final _weightKgController = TextEditingController();

  final _heightFtController = TextEditingController();
  final _heightInController = TextEditingController();
  final _weightLbController = TextEditingController();

  double? _bmi;
  double? _heightM;
  late AnimationController _animController;
  late Animation<double> _bmiAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _bmiAnim = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _animController.dispose();
    _heightCmController.dispose();
    _weightKgController.dispose();
    _heightFtController.dispose();
    _heightInController.dispose();
    _weightLbController.dispose();
    super.dispose();
  }

  void _calculate() {
    double? weightKg, heightM;

    if (_isMetric) {
      final cm = double.tryParse(_heightCmController.text);
      final kg = double.tryParse(_weightKgController.text);
      if (cm == null || kg == null || cm <= 0 || kg <= 0) {
        _showError('Please enter valid height (cm) and weight (kg).');
        return;
      }
      heightM = cm / 100;
      weightKg = kg;
    } else {
      final ft = double.tryParse(_heightFtController.text) ?? 0;
      final inches = double.tryParse(_heightInController.text) ?? 0;
      final lb = double.tryParse(_weightLbController.text);
      final totalInches = ft * 12 + inches;
      if (totalInches <= 0 || lb == null || lb <= 0) {
        _showError('Please enter valid height (ft/in) and weight (lbs).');
        return;
      }
      heightM = totalInches * 2.54 / 100;
      weightKg = lb * 0.453592;
    }

    final bmi = weightKg / (heightM * heightM);
    final prevBmi = _bmi ?? 0;

    setState(() {
      _bmi = bmi;
      _heightM = heightM;
    });

    _bmiAnim = Tween<double>(
      begin: prevBmi,
      end: bmi,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward(from: 0);
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  String _category(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  Color _categoryColor(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  String _idealRange(double heightM) {
    final minKg = 18.5 * heightM * heightM;
    final maxKg = 24.9 * heightM * heightM;
    if (_isMetric) {
      return '${minKg.toStringAsFixed(1)} – ${maxKg.toStringAsFixed(1)} kg';
    } else {
      final minLb = minKg / 0.453592;
      final maxLb = maxKg / 0.453592;
      return '${minLb.toStringAsFixed(1)} – ${maxLb.toStringAsFixed(1)} lbs';
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
            tag: 'tool-icon-BMI Calculator',
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.cyan.withOpacity(0.95),
                    Colors.cyan.withOpacity(0.55),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.monitor_weight_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        title: const Text('BMI Calculator'),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: GestureDetector(
        // ← added
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Unit toggle ---
              Center(
                child: SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(value: true, label: Text('Metric (kg / cm)')),
                    ButtonSegment(
                      value: false,
                      label: Text('Imperial (lbs / ft)'),
                    ),
                  ],
                  selected: {_isMetric},
                  onSelectionChanged: (s) => setState(() {
                    _isMetric = s.first;
                    _bmi = null;
                    _animController.reset();
                  }),
                ),
              ),
              const SizedBox(height: 20),

              // --- Inputs ---
              if (_isMetric) ...[
                _inputField(
                  'Height (cm)',
                  _heightCmController,
                  hint: 'e.g. 170',
                ),
                const SizedBox(height: 12),
                _inputField(
                  'Weight (kg)',
                  _weightKgController,
                  hint: 'e.g. 65',
                ),
              ] else ...[
                Row(
                  children: [
                    Expanded(
                      child: _inputField(
                        'Height (ft)',
                        _heightFtController,
                        hint: '5',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _inputField(
                        'Height (in)',
                        _heightInController,
                        hint: '7',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _inputField(
                  'Weight (lbs)',
                  _weightLbController,
                  hint: 'e.g. 143',
                ),
              ],
              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: _calculate,
                icon: const Icon(Icons.calculate),
                label: const Text('Calculate BMI'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 28),

              // --- Results ---
              if (_bmi != null) ...[
                AnimatedBuilder(
                  animation: _bmiAnim,
                  builder: (_, __) => _BmiGauge(bmi: _bmiAnim.value),
                ),
                const SizedBox(height: 16),

                Center(
                  child: Column(
                    children: [
                      Text(
                        _bmi!.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                          color: _categoryColor(_bmi!),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _categoryColor(_bmi!).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _category(_bmi!),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: _categoryColor(_bmi!),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.withOpacity(0.15),
                      child: const Icon(Icons.thumb_up, color: Colors.green),
                    ),
                    title: const Text('Ideal Weight Range'),
                    subtitle: const Text('BMI 18.5 – 24.9'),
                    trailing: Text(
                      _idealRange(_heightM!),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                _BmiScale(),
              ],
            ],
          ),
        ),
      ), // ← closes GestureDetector
    );
  }

  Widget _inputField(
    String label,
    TextEditingController controller, {
    String hint = '',
  }) {
    return TextField(
      controller: controller,
      onTapOutside: (_) => FocusScope.of(context).unfocus(), // ← added
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Animated arc gauge
// ---------------------------------------------------------------------------
class _BmiGauge extends StatelessWidget {
  final double bmi;
  const _BmiGauge({required this.bmi});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: CustomPaint(
        painter: _GaugePainter(
          bmi: bmi,
          backgroundColor: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest,
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double bmi;
  final Color backgroundColor;
  _GaugePainter({required this.bmi, required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height * 0.85;
    final radius = size.width * 0.38;

    const startAngle = math.pi;
    const sweepAngle = math.pi;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: radius),
      startAngle,
      sweepAngle,
      false,
      bgPaint,
    );

    final segments = [
      (0.0, 18.5, Colors.blue),
      (18.5, 25.0, Colors.green),
      (25.0, 30.0, Colors.orange),
      (30.0, 40.0, Colors.red),
    ];

    const bmiMin = 10.0;
    const bmiMax = 40.0;

    for (final seg in segments) {
      final segStart = seg.$1 as double;
      final segEnd = seg.$2 as double;
      final color = seg.$3 as Color;

      final t1 = ((segStart - bmiMin) / (bmiMax - bmiMin)).clamp(0.0, 1.0);
      final t2 = ((segEnd - bmiMin) / (bmiMax - bmiMin)).clamp(0.0, 1.0);

      final paint = Paint()
        ..color = color.withOpacity(0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 22
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: radius),
        startAngle + sweepAngle * t1,
        sweepAngle * (t2 - t1),
        false,
        paint,
      );
    }

    final t = ((bmi - bmiMin) / (bmiMax - bmiMin)).clamp(0.0, 1.0);
    final needleAngle = startAngle + sweepAngle * t;
    final needleColor = _colorForBmi(bmi);

    final needlePaint = Paint()
      ..color = needleColor
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final needleEnd = Offset(
      cx + (radius) * math.cos(needleAngle),
      cy + (radius) * math.sin(needleAngle),
    );
    canvas.drawLine(Offset(cx, cy), needleEnd, needlePaint);

    canvas.drawCircle(Offset(cx, cy), 6, Paint()..color = needleColor);

    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (final label in ['10', '18.5', '25', '30', '40']) {
      final val = double.parse(label);
      final lt = ((val - bmiMin) / (bmiMax - bmiMin)).clamp(0.0, 1.0);
      final angle = startAngle + sweepAngle * lt;
      final labelR = radius + 20;
      final lx = cx + labelR * math.cos(angle);
      final ly = cy + labelR * math.sin(angle);
      textPainter.text = TextSpan(
        text: label,
        style: TextStyle(fontSize: 10, color: Colors.grey[600]),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(lx - textPainter.width / 2, ly - textPainter.height / 2),
      );
    }
  }

  Color _colorForBmi(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  bool shouldRepaint(_GaugePainter old) => old.bmi != bmi;
}

// ---------------------------------------------------------------------------
// BMI scale reference card
// ---------------------------------------------------------------------------
class _BmiScale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rows = [
      ('< 18.5', 'Underweight', Colors.blue),
      ('18.5 – 24.9', 'Normal', Colors.green),
      ('25 – 29.9', 'Overweight', Colors.orange),
      ('≥ 30', 'Obese', Colors.red),
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BMI Scale',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 10),
            ...rows.map(
              (r) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: r.$3,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 100,
                      child: Text(r.$1, style: const TextStyle(fontSize: 13)),
                    ),
                    Text(
                      r.$2,
                      style: TextStyle(
                        fontSize: 13,
                        color: r.$3,
                        fontWeight: FontWeight.w600,
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
