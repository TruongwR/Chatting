class Validators {
  static bool isValidPassword(String password) {
    final regex = RegExp(r'^[0-9]+$');
    return password.length == 6 && regex.hasMatch(password);
  }

  static bool isValidEmail(String email) {
    const emailRegExpString = r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
        r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
    return RegExp(emailRegExpString).hasMatch(email);
  }

  static bool isValidPhoneNumber(String phone) {
    final regexPhone = RegExp(r'(0[1|2|3|4|5|6|7|8|9])+([0-9]{8})$');

    return (phone.length > 9 && phone.length < 15) &&
        regexPhone.hasMatch(phone);
  }

  static bool isValidOTP(String otp) {
    final regex = RegExp(r'^[0-9]+$');
    return otp.length == 4 && regex.hasMatch(otp);
  }
}
