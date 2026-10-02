import 'package:flutter/material.dart';
import 'package:safenest/screen/functions/get_refill_soon_count.dart';
import 'package:safenest/screen/my_medicine_screen.dart';

class RefillReminderScreen extends StatefulWidget {
  const RefillReminderScreen({super.key});

  @override
  State<RefillReminderScreen> createState() => _RefillReminderScreenState();
}

class _RefillReminderScreenState extends State<RefillReminderScreen> {
  final Map<int, int> _selectedQuantities = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
          padding: EdgeInsets.zero,
          children: [

            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16, 48, 16, 22),
              decoration: BoxDecoration(
                color: Color(0xFFFF8C00),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
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
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/medicine.png",
                        width: 46,
                        height: 46,
                        errorBuilder: (context, error, stackTrace) =>
                          Icon(
                          Icons.medication,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Refill Reminder",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Text(
                      "${getRefillSoonCount()} medicines need refill soon",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Medicine Refill List Items
            Column(
              children: List.generate(medicine.length, (index) {
                return showBox(
                  name: medicine[index].name ?? '',
                  strength: medicine[index].strength ?? '',
                  quantity: (medicine[index].quantity ?? 0).toDouble(),
                  index: index,
                );
              }),
            ),

            SizedBox(height: 20),
          ],
        ),
    );
  }

  Widget showBox({
    required String name,
    required String strength,
    required double quantity,
    required int index,
  }) {
     int? selectedAmount = _selectedQuantities[index];
     bool isOneSelected = selectedAmount == 1;
     bool isTenSelected = selectedAmount == 10;

     Color statusColor = quantity > 15
        ? Colors.green
        : quantity > 5
        ? Colors.orange
        : Colors.red;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(14),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
            ),
          ],
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
                      Text(
                        "$name $strength".trim(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "${quantity.toInt()} tablets remaining",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                ),
                quantity < 12
                    ? Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning,
                        size: 16,
                        color: Colors.red,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Low Stock",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
                    : Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Stock OK",
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                // "1" Button
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedQuantities[index] =
                          isOneSelected ? 0 : 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        backgroundColor:
                        isOneSelected ? statusColor : Colors.white,
                        side: BorderSide(
                          color: isOneSelected
                              ? statusColor
                              : Colors.grey.shade400,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color:
                          isOneSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                // 10 Button
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedQuantities[index] =
                          isTenSelected ? 0 : 10;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        backgroundColor:
                        isTenSelected ? statusColor : Colors.white,
                        side: BorderSide(
                          color: isTenSelected
                              ? statusColor
                              : Colors.grey.shade400,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        "10",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color:
                          isTenSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                // Mark as Refilled Button
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: (selectedAmount == null || selectedAmount == 0)
                          ? null
                          : () {
                        setState(() {
                          medicine[index].quantity =
                              (medicine[index].quantity ?? 0) +
                                  selectedAmount;
                          _selectedQuantities.remove(index);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: statusColor,
                        disabledBackgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        "Mark as Refilled",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: (selectedAmount != null && selectedAmount > 0)
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}