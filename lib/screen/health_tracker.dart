import 'package:flutter/material.dart';
import 'package:safenest/screen/health_tracker_history.dart';
import 'package:safenest/screen/functions/get_blood_group.dart';
import 'package:safenest/screen/functions/get_height.dart';

class HealthReading {
  final int systolic;
  final int diastolic;
  final double bloodSugar;
  final double weight;
  final DateTime recordedAt;

  const HealthReading({
    required this.systolic,
    required this.diastolic,
    required this.bloodSugar,
    required this.weight,
    required this.recordedAt,
  });
}

class HealthReadingStore {
  HealthReadingStore._();
}

final List<HealthReading> readings = [];

class HealthCenter extends StatefulWidget {
  const HealthCenter({super.key});

  @override
  State<HealthCenter> createState() => _HealthCenterState();
}

class _HealthCenterState extends State<HealthCenter> {
  bool _showAddReading = false;

  int _systolic = 0;
  int _diastolic = 0;
  double _bloodSugar = 0;
  double _weight = 0;

  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _bloodSugarController = TextEditingController();
  final _weightController = TextEditingController();

  static const Color _pink = Color(0xFFE90D59);
  static const Color _red = Color(0xFFEF343B);
  static const Color _green = Color(0xFF5B9B6C);
  static const Color _pageBackground = Color(0xFFF2F5F3);
  static const Color _borderColor = Color(0xFFE1E6E3);
  static const Color _textColor = Color(0xFF202326);
  static const Color _mutedText = Color(0xFF777D80);

  double get bmi {
    if (readings.isEmpty) return 0;
    return readings.last.weight / (getHeight() * getHeight());
  }

  int getOverallHealthScore() {
    if (readings.isEmpty) return 0;

    final lastReading = readings.last;
    int score = 100;

    // Blood Pressure evaluation (Normal is roughly 90-120 systolic, 60-80 diastolic)
    if (lastReading.systolic > 120 || lastReading.systolic < 90) score -= 15;
    if (lastReading.diastolic > 80 || lastReading.diastolic < 60) score -= 15;

    // Blood Sugar evaluation (Normal fasting is roughly 70-100 mg/dL)
    if (lastReading.bloodSugar > 100 || lastReading.bloodSugar < 70) score -= 20;

    // BMI evaluation based on standard ranges
    if (bmi < 18.5) {
      score -= 15;
    } else if (bmi >= 25 && bmi <= 29.9) {
      score -= 15;
    } else if (bmi >= 30 && bmi <= 34.9) {
      score -= 25;
    } else if (bmi >= 35) {
      score -= 35;
    }

    return score;
  }

  String getBmiSuggestion(double bmi) {
    if(bmi==0)
      return "Enter your weight";
    else if (bmi < 18.5) {
      return 'You are underweight. Consider adjusting your diet.';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Your health is good. You have a normal weight.';
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      return 'You are overweight. Regular exercise could help.';
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      return 'You are obese. Please focus on a healthier lifestyle.';
    } else {
      return 'You are extremely obese. It is recommended to seek medical advice.';
    }
  }

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _bloodSugarController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _openAddReading() {
    _systolicController.clear();
    _diastolicController.clear();
    _bloodSugarController.clear();
    _weightController.clear();

    setState(() => _showAddReading = true);
  }

  void _saveReading() {
    setState(() {
      _systolic = int.tryParse(_systolicController.text.trim()) ?? 0;
      _diastolic = int.tryParse(_diastolicController.text.trim()) ?? 0;
      _bloodSugar = double.tryParse(_bloodSugarController.text.trim()) ?? 0;
      _weight = double.tryParse(_weightController.text.trim()) ?? 0;

      readings.add(
        HealthReading(
          systolic: _systolic,
          diastolic: _diastolic,
          bloodSugar: _bloodSugar,
          weight: _weight,
          recordedAt: DateTime.now(),
        ),
      );

      _showAddReading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Health readings saved'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: SafeArea(
        bottom: false,
        child: _showAddReading ? _buildAddReadingPage() : _buildTrackerPage(),
      ),
    );
  }

  Widget _buildTrackerPage() {
    return Column(
      children: [
        _buildTrackerHeader(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildBmiSuggestion(),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _readingCard(
                        icon: Icons.favorite,
                        iconColor: const Color(0xFFE65B86),
                        title: 'Blood Pressure',
                        value:
                        '${_systolic.toStringAsFixed(0)}/${_diastolic.toStringAsFixed(0)}',
                        unit: 'mmHg',
                        status: 'Normal',
                        statusColor: const Color(0xFF5A9D70),
                        updated: 'Updated just now',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _readingCard(
                        icon: Icons.water_drop,
                        iconColor: _pink,
                        title: 'Blood Sugar',
                        value: _bloodSugar.toStringAsFixed(0),
                        unit: 'mg/dL',
                        status: 'Normal',
                        statusColor: const Color(0xFF5A9D70),
                        updated: 'Updated just now',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _readingCard(
                        icon: Icons.monitor_weight_outlined,
                        iconColor: const Color(0xFFB5A35A),
                        title: 'Weight',
                        value: _weight.toStringAsFixed(1),
                        unit: 'kg',
                        status: 'Healthy',
                        statusColor: const Color(0xFF4785A4),
                        updated: 'Updated just now',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _readingCard(
                        icon: Icons.bar_chart,
                        iconColor: const Color(0xFF65A6B8),
                        title: 'BMI',
                        value: bmi.toStringAsFixed(2),
                        unit: 'kg/m²',
                        status: 'Overweight',
                        statusColor: const Color(0xFFB39142),
                        updated: 'Updated just now',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                _gradientButton(
                  label: '＋  Add New Reading',
                  onTap: _openAddReading,
                  height: 50,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrackerHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 26, 20, 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [_red, _pink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(22),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Health Tracker',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Your vitals at a glance',
                      style: TextStyle(
                        color: Color(0xFFFFDCE6),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HealthHistory(),
                    ),
                  );
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Health History',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 13),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.12),
              ),
            ),
            child: Row(
              children: [
                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overall Health Score',
                        style: TextStyle(
                          color: Color(0xFFFFE8EE),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        '${getOverallHealthScore()} / 100',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          height: 1.15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                      width: 1.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    getBloodGroup(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBmiSuggestion() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E7),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFFD8B85F), width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.warning_amber_rounded,
              color: Color(0xFFB28B39), size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getBmiSuggestion(bmi),
                  style: TextStyle(
                    color: _textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _readingCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required String unit,
    required String status,
    required Color statusColor,
    required String updated,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 125),
      padding: const EdgeInsets.fromLTRB(12, 12, 10, 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: _borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 20),
              const Spacer(),
              Flexible(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    status,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _textColor,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: _textColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  unit,
                  style: const TextStyle(
                    color: _mutedText,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            updated,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _mutedText,
              fontSize: 9.5,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddReadingPage() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => setState(() => _showAddReading = false),
                      icon: const Icon(Icons.arrow_back,
                          color: _textColor, size: 28),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Add New Reading',
                          style: TextStyle(
                            color: _textColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 44),
                  ],
                ),
                const SizedBox(height: 24),
                _inputSection(
                  icon: Icons.favorite,
                  iconColor: const Color(0xFFE65B86),
                  title: 'Enter Blood Pressure',
                  child: Row(
                    children: [
                      Expanded(
                        child: _numberInput(
                          controller: _systolicController,
                          label: 'Systolic',
                          hint: '120',
                          decimal: false,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _numberInput(
                          controller: _diastolicController,
                          label: 'Diastolic',
                          hint: '80',
                          decimal: false,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                _inputSection(
                  icon: Icons.water_drop,
                  iconColor: _pink,
                  title: 'Enter Blood Sugar',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _numberInput(
                        controller: _bloodSugarController,
                        hint: '105',
                        decimal: true,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'mg/dL',
                        style: TextStyle(
                          color: _textColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                _inputSection(
                  icon: Icons.monitor_weight_outlined,
                  iconColor: const Color(0xFFB5A35A),
                  title: 'Enter Weight',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _numberInput(
                        controller: _weightController,
                        hint: '72.5',
                        decimal: true,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'kg',
                        style: TextStyle(
                          color: _textColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                _gradientButton(
                  label: 'SAVE INFORMATION',
                  onTap: _saveReading,
                  height: 58,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputSection({
    required IconData icon,
    required Color iconColor,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 26),
              const SizedBox(width: 13),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _numberInput({
    required TextEditingController controller,
    required String hint,
    required bool decimal,
    String? label,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: decimal),
      style: const TextStyle(
        color: _textColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF9DA2A4),
          fontSize: 20,
        ),
        floatingLabelBehavior:
        label == null ? FloatingLabelBehavior.never : FloatingLabelBehavior.auto,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFB7BCBE), width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: _green, width: 1.5),
        ),
      ),
    );
  }

  Widget _gradientButton({
    required String label,
    required VoidCallback onTap,
    required double height,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          height: height,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [_red, _pink],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}