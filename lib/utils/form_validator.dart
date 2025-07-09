class FormValidation {
  static String? validateData(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter data";
    }
    return null;
  }

  static String? emailValidation(String? input) {
    if (input == null || input.isEmpty) {
      return "Email is required";
    }
    // Regular expression for basic email format validation
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(input)) {
      return "Enter a valid email address";
    }
    return null;
  }
}
