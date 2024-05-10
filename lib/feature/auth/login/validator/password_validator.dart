class PasswordValidator{
  static String errorMsg = "";
  static bool isValid(String password){
    if(password.isEmpty) {
      return false;
    }
    else{
      if(password.length < 6){
        errorMsg = "Invalid Password";
        return false;
      }
      else{
        return true;
      }
    }
   /// return (password.isNotEmpty && password.length > 6);
  }


  static String? getError(String password){
    if(isValid(password)){
      return null;
    }
    else {
      return errorMsg;
    }
  }

}