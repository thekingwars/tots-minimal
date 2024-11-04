class LoginFormValidators {
  static const emailRegex =
      '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}';

  static String? validateEmail(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return 'Email is required';
    }

    if (!value.contains(RegExp(emailRegex))) {
      return 'Invalid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }
}
