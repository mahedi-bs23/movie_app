class PasswordValidator{
  static bool isValid(String password){
    return (password.isNotEmpty && password.length > 6);
  }


  static String? getError(String password){
    if(isValid(password)){
      return null;
    }
    else {
      return "Invalid Password";
    }
  }

}