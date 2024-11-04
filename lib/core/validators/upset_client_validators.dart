class UpsetClientValidators {
  static const emailRegex =
      '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}';

  static const nameRegex = r'^[a-zA-Z]+';

  static String? validateEmail(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Invalid email';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return 'Name is required';
    }

    if (!RegExp(nameRegex).hasMatch(value)) {
      return 'Invalid name';
    }

    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return 'Last name is required';
    }

    if (!RegExp(nameRegex).hasMatch(value)) {
      return 'Invalid last name';
    }

    return null;
  }
}
