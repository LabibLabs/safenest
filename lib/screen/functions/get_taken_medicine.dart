import 'package:safenest/screen/medicine.dart';
import 'package:safenest/screen/my_medicine_screen.dart';

List<Medicine> upcomingMedicine=[];

int getTakenMedicine() {
  final DateTime now = DateTime.now();
  final int currentMinutes = now.hour * 60 + now.minute;

  int count = 0;

  for (final Medicine med in medicine) {
    final List<String>? reminderTimes = med.reminderTime;
    if (reminderTimes == null || reminderTimes.isEmpty) {
      continue;
    }

    for (final String time in reminderTimes) {
      final List<String> parts = time.trim().split(':');
      if (parts.length < 2) continue;

      final int? hour = int.tryParse(parts[0].trim());
      final int? minute = int.tryParse(parts[1].trim());

      if (hour == null || minute == null) continue;

      final int reminderMinutes = hour * 60 + minute;

      if (reminderMinutes <= currentMinutes) {
        upcomingMedicine.add(med);
        count++;
      }
    }
  }

  return count;
}