class my_validation {
  String? emailValidate(String? input) {
    if (input == null || input == input.isEmpty) {
      return 'Invalid name';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp EmailToRegex = RegExp(pattern);
    if (EmailToRegex.hasMatch(input)) {
      return null;
    }
    return 'Invalid email';
  }

  String? nameValidate(String? input) {
    if (input == null || input == input.isEmpty) {
      return 'Invalid name';
    }
    String pattern = r'^[a-zA-Z0-9_]+$';
    RegExp UsernameToRegex = RegExp(pattern);
    if (UsernameToRegex.hasMatch(input)) {
      return null;
    }
    return 'Invalid name';
  }

  String? passwordValidate (String? input){
    if (input == null ||input == input.isEmpty){
      return 'Invalid name';
    }
    if (input.length>=6) {
      return null;
    }
    return 'Invalid password';
  }

  String? phoneValidate(String? input) {
    if (input == null || input == input.isEmpty) {
      return 'Invalid name';
    }
    if (input.length>=11) {
      return null;
    }
    return 'Invalid phone';
  }

   String? codeValidate(String? input) {
    if (input == null || input == input.isEmpty) {
      return 'Please enter the verification code';
    }
    if (input.length!= 6) {
      return 'Verification code should be 6 digits';
    }
    return null;
  }
}
