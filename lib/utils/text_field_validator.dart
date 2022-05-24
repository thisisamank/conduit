class TextFieldValidator {
  const TextFieldValidator._();

  static String? passwordValidate(String? password) {
    if (password != null && password.length < 8) {
      return 'Your password is too weak.';
    }
    return null;
  }

  static String? emailValidate(String? email) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final RegExp regex = RegExp(pattern);
    if (email!.isEmpty) {
      return "Email Required";
    } else if (!regex.hasMatch(email.trim())) {
      return "Invalid Email";
    } else {
      return null;
    }
  }
}
