class Medicine
{
  String? name;
  String? strength;
  double? quantity;
  double? dose;
  String? mealTiming;
  List<String>? reminderTime;
  Medicine({
    required this.name,
    required this.strength,
    required this.quantity,
    required this.dose,
    required this.mealTiming,
    required this.reminderTime,
  });
}