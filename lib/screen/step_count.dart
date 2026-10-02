import 'package:flutter/material.dart';
import 'package:safenest/screen/functions/get_step_count.dart';

class StepCount extends StatefulWidget {
  const StepCount({super.key});

  @override
  State<StepCount> createState() => _StepCountState();
}

class _StepCountState extends State<StepCount> {
  double? currentSteps = double.tryParse(getStepCount());
  double goalSteps = 5000;

  int? selectedAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8F3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                decoration: const BoxDecoration(
                  color: Color(0xFFFF8C00),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pop(context,true);
                    },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),

                          Icon(
                            Icons.arrow_back_ios,
                            size: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ),

                    SizedBox(
                      height: 6,
                    ),

                    Row(
                      children: const [
                        Text(
                          '🚶',
                          style: TextStyle(fontSize: 28),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Step Counter ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Padding(
                      padding: EdgeInsets.only(left: 38),
                      child: Text(
                        'Stay active, stay strong',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Main Circular Progress Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 36),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: WalkingProgressCircle(
                      currentSteps: currentSteps ?? 0,
                      goalSteps: goalSteps,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Custom Goal Action Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add Custom Goal',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: _goalActionButton(
                              text: '−',
                              onPressed: () {
                                setState(() {
                                  if (selectedAmount == null) return;
                                  goalSteps -= selectedAmount!;
                                  if (goalSteps < 100) goalSteps = 100;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 2,
                            child: _amountButton(
                              amount: 100,
                              selected: selectedAmount == 100,
                              onPressed: () {
                                setState(() {
                                  selectedAmount = 100;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 2,
                            child: _amountButton(
                              amount: 500,
                              selected: selectedAmount == 500,
                              onPressed: () {
                                setState(() {
                                  selectedAmount = 500;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: _goalActionButton(
                              text: '+',
                              onPressed: () {
                                setState(() {
                                  if (selectedAmount == null) return;
                                  goalSteps += selectedAmount!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _amountButton({
    required int amount,
    required bool selected,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor:
          selected ? const Color(0xFFFF8C00) : Colors.white,
          foregroundColor:
          selected ? Colors.white : const Color(0xFF8B6B3E),
          elevation: 0,
          side: BorderSide(
            color: selected
                ? const Color(0xFFFF8C00)
                : const Color(0xFFB9955C),
            width: selected ? 2.0 : 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          '$amount',
          style: TextStyle(
            fontSize: 17,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _goalActionButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: const Color(0xFFFFF8E8),
          foregroundColor: const Color(0xFF9A712E),
          elevation: 0,
          side: const BorderSide(
            color: Color(0xFFB9955C),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            height: 1.1,
          ),
        ),
      ),
    );
  }
}

class WalkingProgressCircle extends StatefulWidget {
  final double currentSteps;
  final double goalSteps;

  const WalkingProgressCircle({
    required this.currentSteps,
    required this.goalSteps,
    super.key,
  });

  @override
  State<WalkingProgressCircle> createState() => _WalkingProgressCircleState();
}

class _WalkingProgressCircleState extends State<WalkingProgressCircle> {
  @override
  Widget build(BuildContext context) {
    double value = widget.goalSteps > 0
        ? (widget.currentSteps / widget.goalSteps).clamp(0.0, 1.0)
        : 0.0;

    int percentage = (value * 100).round();

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 240,
          height: 240,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: 18,
            backgroundColor: Color(0xFFE8F2EC),
            valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xFFFF9500),
            ),
            strokeCap: StrokeCap.round,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.currentSteps.toInt()}',
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w800,
                color: Color(0xFFC57A20),
                height: 1.0,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'of ${widget.goalSteps.toInt()} steps',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF777777),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF2DC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFFC57A20),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}