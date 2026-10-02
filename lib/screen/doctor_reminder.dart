import 'package:flutter/material.dart';
import 'package:safenest/screen/doctor.dart';
import 'package:safenest/screen/doctor_info_input.dart';

class DoctorReminder extends StatefulWidget {
  const DoctorReminder({super.key});

  @override
  State<DoctorReminder> createState() => _DoctorReminderState();
}

class _DoctorReminderState extends State<DoctorReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDoctorScreen()),
          );

          if(result)
            setState(() {

            });
        },
        backgroundColor: const Color(0xFFFF8C00),
        icon:  Icon(
            Icons.add,
            color: Colors.white
        ),
        label: Text(
          "Add Appointment",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        children: [
          // Header
          Container(
            width: double.infinity,
            height: 110,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFFF8C00),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
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
                      Icon(Icons.arrow_back_ios, size: 17, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        "Back",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Doctor Reminder',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: List.generate(doctor.length, (index) {
              return GestureDetector(

                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          title: Text(
                              "Delete medicine"
                          ),
                          content: Text(
                            "Are you sure you want to delete this medicine?",
                          ),
                          actions: [

                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                )
                            ),

                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    doctor.removeAt(index);
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                            ),
                          ],
                        );
                      }
                      )
                  );
                },

                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .04),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Doctor logo
                          Container(
                            width: 60,
                            height: 60,
                            decoration:  BoxDecoration(
                              color: Color(0xFFE8F2FF),
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/doctor_logo.png",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                  Icons.person,
                                  size: 38,
                                  color: Color(0xFF2C5687),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 14),

                          // Doctor details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor[index].name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  doctor[index].specialist,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.apartment_rounded,
                                      size: 16,
                                      color: Color(0xFF475569),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        doctor[index].hospitalName,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF475569),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Upcoming logo
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE7F7ED),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Upcoming',
                              style: TextStyle(
                                color: Color(0xFF16A34A),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14),

                      // Date and Time Row
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            size: 18,
                            color: Color(0xFF475569),
                          ),
                           SizedBox(width: 6),
                          Text(
                            '${doctor[index].date} ${doctor[index].month} ${doctor[index].year} ',
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF334155),
                            ),
                          ),
                          SizedBox(width: 14),
                          Container(
                            width: 1.2,
                            height: 14,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(width: 14),
                          Icon(
                            Icons.access_time_rounded,
                            size: 18,
                            color: Color(0xFF475569),
                          ),
                          SizedBox(width: 6),
                          Text(
                            doctor[index].time,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF334155),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),

                      // Reason Box
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F6FB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.description_outlined,
                              size: 16,
                              color: Color(0xFF4B6B94),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Reason: ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF334155),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: doctor[index].reason,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF475569),
                                      ),
                                    ),
                                  ],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

List<Doctor> doctor = [];
