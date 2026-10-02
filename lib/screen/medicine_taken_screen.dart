import 'package:flutter/material.dart';
import 'package:safenest/screen/functions/get_taken_medicine.dart';

class UpcomingMedicines extends StatefulWidget {
  const UpcomingMedicines({super.key});

  @override
  State<UpcomingMedicines> createState() => _UpcomingMedicinesState();
}

class _UpcomingMedicinesState extends State<UpcomingMedicines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(28),
                  bottomLeft: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/medicine.png",
                        width: 36,
                        height: 36,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.medication,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Upcoming Medicines',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Medicine List
            Expanded(
              child: upcomingMedicine.isEmpty
                  ? Center(
                      child: Text(
                        "No upcoming medicines",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      itemCount: upcomingMedicine.length,
                      itemBuilder: (context, index) {
                        final item = upcomingMedicine[index];
                        final List<dynamic>? times = item.reminderTime;
                        final String displayTime =
                            (times != null && times.isNotEmpty)
                            ? times.last.toString()
                            : "--:--";

                        final int timesPerDay = times?.length ?? 0;

                        return _medicineCard(
                          name: item.name ?? "Unnamed",
                          strength: item.strength ?? "",
                          mealTiming: item.mealTiming ?? "",
                          time: displayTime,
                          reminderFrequencyCount: timesPerDay,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _medicineCard({
    required String name,
    required String strength,
    required String mealTiming,
    required String time,
    required int reminderFrequencyCount,
  }) {
    String frequencyText;
    if (reminderFrequencyCount == 0) {
      frequencyText = "Not scheduled";
    } else if (reminderFrequencyCount == 1) {
      frequencyText = "Once daily";
    } else if (reminderFrequencyCount == 2) {
      frequencyText = "Twice daily";
    } else {
      frequencyText = "$reminderFrequencyCount times daily";
    }

    return Card(
      elevation: 1,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green[50],
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/medicine.png",
                  width: 38,
                  height: 38,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.medication,
                    color: Colors.green[700],
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name $strength".trim(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        frequencyText,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      if (mealTiming.isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Icon(
                            Icons.circle,
                            size: 5,
                            color: Colors.black38,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            mealTiming,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Text(
              time,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
