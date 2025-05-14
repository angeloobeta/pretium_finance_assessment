
class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    final hasUppercase = value.contains(RegExp(r'[A-Z]'));
    final hasDigits = value.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasDigits || !hasSpecialCharacters) {
      return 'Password must contain uppercase, number, and special character';
    }

    return null;
  }

  // Simple password validation (less strict, for mockups)
  static String? validateSimplePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  // Name validation
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    return null;
  }

  // PIN validation
  static String? validatePin(String? value) {
    if (value == null || value.isEmpty) {
      return 'PIN is required';
    }

    if (value.length != 4 || int.tryParse(value) == null) {
      return 'PIN must be 4 digits';
    }

    return null;
  }

  // Code validation (for verification codes)
  static String? validateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Code is required';
    }

    if (value.length != 4 || int.tryParse(value) == null) {
      return 'Code must be 4 digits';
    }

    return null;
  }

  // Non-empty field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }
}
