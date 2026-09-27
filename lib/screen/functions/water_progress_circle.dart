import 'package:flutter/material.dart';

class WaterProgressCircle extends StatefulWidget
{
   double currentGlasses;
   double goalGlasses;

  WaterProgressCircle({
    required this.currentGlasses,
    required this.goalGlasses,
    super.key,
});
  @override
  State<WaterProgressCircle> createState()=>_WaterProgressCircleState();
}

class _WaterProgressCircleState extends State<WaterProgressCircle>
{
  @override
  Widget build(BuildContext context) {
    double value = widget.goalGlasses > 0
        ? (widget.currentGlasses / widget.goalGlasses).clamp(0.0, 1.0)
        : 0.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 180,
          height: 180,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: 10,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
            strokeCap: StrokeCap.round,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.water_drop,
              color: Color(0xFF2196F3),
              size: 34,
            ),

            SizedBox(
              height: 6,
            ),

            Text(
              "${widget.currentGlasses} / ${widget.goalGlasses}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E88E5),
              ),
            ),

            SizedBox(
              height: 5,
            ),

            Text(
              'glasses',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
