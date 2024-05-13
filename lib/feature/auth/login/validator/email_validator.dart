class EmailValidator {
  static String errorMsg = "ok";
  static bool isValid(String email) {
    return getError(email) == null;
  }

  static String? getError(String email){
    if(email.isEmpty){
      errorMsg = "Email can't be empty";
      return errorMsg;
    }
    else if(!email.contains('@') && !email.contains('.')){
      errorMsg = "Email is not valid ";
      return errorMsg;
    }
    return null;
  }


}

