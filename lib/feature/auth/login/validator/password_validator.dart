class PasswordValidator{
  static bool isValid(String password){
    return (password.isNotEmpty && password.length > 6);
  }
}