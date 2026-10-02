import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> setName(String phone, String newName) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(phone)
      .update({
    'name': newName,
  });
}