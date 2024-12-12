

  // Regular expressions for validation
  final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  final RegExp passwordRegex = RegExp(r"^(?=.*[a-z])(?=.*[A-Z]).{8,}$");