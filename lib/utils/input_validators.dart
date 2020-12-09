class InputValidators {
  static bool validateEmail(String value) {
    if (value.isEmpty) return false;

    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value) ? true : false;
  }
}
