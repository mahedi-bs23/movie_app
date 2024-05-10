class EmailValidator {
  static bool isValid(String email) {
    if(email.isNotEmpty && email.contains('@') && email.contains('.')){
      return true;
    }
    else {
      print(email);
      return false;
    }
  }

  static String? getError(String email){
    if(isValid(email)){
      return null;
    }
    else {
      return "Invalid Email";
    }
  }


}

