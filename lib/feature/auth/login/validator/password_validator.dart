class PasswordValidator {
  static String errorMsg = "";

  static bool isValid(String password) {
    return getError(password) == null;
  }

  static String? getError(String password) {
    if (password.isEmpty) {
      return "Password can't be empty";
    } else if (password.length <= 8) {
      return "Password can't  be less than 8";
    }
  }
}
