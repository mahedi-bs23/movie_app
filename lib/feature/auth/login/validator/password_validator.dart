class PasswordValidator {
  static String errorMsg = "";

  static bool isValid(String password) {
    return getError(password) == null;
  }

  static String? getError(String password) {
    if (password.isEmpty) {
      errorMsg = "Password can't be empty";
      return errorMsg;
    } else if (password.length < 8) {
      errorMsg = "Password can't  be less than 8";
      return errorMsg;
    }
    return null;
  }
}
