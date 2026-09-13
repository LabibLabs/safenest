String getGreeting() {
  DateTime now = DateTime.now();

  if (now.hour < 12) {
    return "Good Morning,";
  } else if (now.hour < 17) {
    return "Good Afternoon,";
  } else if (now.hour < 21) {
    return "Good Evening,";
  } else {
    return "Good Night,";
  }
}