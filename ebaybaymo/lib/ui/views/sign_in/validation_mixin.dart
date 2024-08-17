mixin ValidationMixin {
  String? validateEmail(String value) {
    // Check if the email is empty
    if (value.isEmpty) {
      return 'Email cannot be empty';
    }

    // Regex pattern for validating email
    String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(pattern);

    // Check if the email is valid
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? validatePassword(String value) {
    // Check if the password is empty
    if (value.isEmpty) {
      return 'Password cannot be empty';
    }

    // Check if the password length is at least 8 characters
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }
}
