class EmailValidator {
  static bool isValid(String email) {
    return (email.isNotEmpty && email.contains('@') && email.contains('.'));
  }
}