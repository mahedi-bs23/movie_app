class EmailValidator {
  static String errorMsg = "";
  static bool isValid(String email) {
    if(email.isEmpty){
      return false;
    }
    else {
      if(email.contains('@') && email.contains('.')){
        return true;
      }
      else {
        errorMsg = "Invalid Email";
        return false;
      }
    }
  }

  static String? getError(String email){
    if(isValid(email)){
      return null;
    }
    else {
      return errorMsg;
    }
  }


}

