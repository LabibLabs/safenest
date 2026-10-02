import 'package:safenest/screen/my_medicine_screen.dart';

int getRefillSoonCount() {
  int count = 0;
  for (var item in medicine) {
     var quantity = item.quantity ?? 0;
    if (quantity < 12) {
      count++;
    }
  }
  return count;
}