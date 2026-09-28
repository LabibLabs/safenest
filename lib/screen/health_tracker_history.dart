import 'package:flutter/material.dart';
import 'package:safenest/screen/health_tracker.dart';
import 'package:safenest/screen/functions/get_height.dart';
class HealthHistory extends StatefulWidget
{
  const HealthHistory({super.key});

  @override
  State<HealthHistory> createState() => _HealthHistoryState();
}
class _HealthHistoryState extends State<HealthHistory>
{

  Widget _buildTrackerHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 26, 20, 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEF343B),
            Color(0xFFE90D59)],
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },

                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 19,
                              fontWeight: FontWeight.bold,
                            ),

                        SizedBox(
                          width: 4,
                        ),

                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                          ],
                        )
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    Text(
                      'Health Tracker History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Track yor health',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildTrackerHeader(),

          Column(
            children: readings.length==0?
            [
              SizedBox(
                height: 300,
              ),
              Text(
                "Add your Medical Reading",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              )
            ]:
            List.generate(
                readings.length,
              (index){
                return buildHealthRecordCard(
                  systolic: readings[index].systolic,
                  diastolic: readings[index].diastolic,
                  bloodSugar: readings[index].bloodSugar,
                  weight: readings[index].weight,
                  dateTime: readings[index].recordedAt,
                );
              }),
          )
        ],
      ),
    );
  }
}

Widget buildHealthRecordCard({
  required int systolic,
  required int diastolic,
  required double bloodSugar,
  required double weight,
  required DateTime dateTime,
}) {
  double bmi=(weight/(getHeight()*getHeight()));

  String formatDate(DateTime dt) {
     List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    String hour = dt.hour.toString().padLeft(2, '0');
    String minute = dt.minute.toString().padLeft(2, '0');
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year} • $hour:$minute';
  }

  return Container(
    margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8
    ),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.5),
          blurRadius: 12,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Date & Time Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  size: 16,
                  color: Color(0xFFEF343B),
                ),
                SizedBox(width: 6),
                Text(
                  formatDate(dateTime),
                  style:  TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4
              ),

              decoration: BoxDecoration(
                color: Color(0xFFEF343B).withValues(alpha:  0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Record',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEF343B),
                ),
              ),
            ),
          ],
        ),
        Divider(height: 24, thickness: 0.8),

        // health info
        Row(
          children: [
            Expanded(
              child: _buildMetricTile(
                icon: Icons.favorite_rounded,
                iconColor: Color(0xFFE90D59),
                label: 'Blood Pressure',
                value: '$systolic/$diastolic',
                unit: 'mmHg',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMetricTile(
                icon: Icons.water_drop_rounded,
                iconColor: Colors.deepOrange,
                label: 'Blood Sugar',
                value: bloodSugar.toStringAsFixed(1),
                unit: 'mg/dL',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildMetricTile(
                icon: Icons.monitor_weight_rounded,
                iconColor: Colors.teal,
                label: 'Weight',
                value: weight.toStringAsFixed(1),
                unit: 'kg',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMetricTile(
                icon: Icons.speed_rounded,
                iconColor: Colors.indigo,
                label: 'BMI',
                value: bmi.toStringAsFixed(2),
                unit: 'kg/m²',
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMetricTile({
  required IconData icon,
  required Color iconColor,
  required String label,
  required String value,
  required String unit,
}) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: iconColor.withValues(alpha:  0.12),
          child: Icon(
              icon,
              color: iconColor,
              size: 20
          ),
        ),

        SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),

              SizedBox(
                  height: 2
              ),

              Row(
                children: [
                  Text("$value",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    ),
                  ),
                  Text("  $unit",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}