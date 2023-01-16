import 'package:intl/intl.dart';
import 'package:trop_prof_itfaq/core/extensions/string_extensions.dart';

class CustomValidator {
  // check if is input empty or not
  static String? isRequired(String? inputValue) =>
      (inputValue == null || inputValue.isEmpty)
          ? "This Filed is Required"
          : null;

  // check Email address
  static String? validateEmail(String? email) {
    if (isRequired(email) != null) return "E-Mail is invalid";
    bool isValidEmail =
        RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email!);
    if (!isValidEmail) {
      return "E-Mail is invalid";
    }
    return null;
  }

  // check if is password match with confirm password
  static String? matchPassword(String? password, String? confirmPassword) =>
      (password == null ||
              password.isEmpty ||
              confirmPassword == null ||
              confirmPassword.isEmpty ||
              password != confirmPassword)
          ? "Password doesn't match"
          : null;

  // check if phone number length is not valid.
  static String? validatePhoneNumberLength(String? phoneNumber) {
    if (isRequired(phoneNumber) != null || phoneNumber!.length != 9) {
      return "Phone number is invalid";
    }
    return null;
  }

  // check if phone number is valid or not.
  static String? validatePhoneNumber(String? phoneNumber) {
    if (isRequired(phoneNumber) != null) return "Phone number is invalid";
    String pattern = r'(^(?:[+0][0-9])?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(phoneNumber!)) {
      return "Phone number is invalid";
    }
    return null;
  }

  // check if num of char equals specific num or not
  static String? validateNumOfChar(String? text, {int num = 0}) {
    if (isRequired(text) != null || text!.length < num) {
      return 'Number of char is less than $num';
    }
    return null;
  }

  // check Password Strength
  static String? validatePassword(String? password) {
    if (isRequired(password) != null) {
      return "Password must contain one capital letter and on special character and at leaset 12 characters";
    }
    bool isValidEmail =
        RegExp(r"^(?=.*[A-Z])(?=.*[!@#$&*]).{12,}$").hasMatch(password!);
    if (!isValidEmail) {
      return "Password must contain one capital letter and on special character and at leaset 12 characters";
    }
    return null;
  }

  // check if input value is only contain numbers
  static String? validateOnlyNumber(String text, {int num = 0}) {
    if (isRequired(text) != null || !text.isNumeric) {
      return "The value isn't correct";
    }
    return null;
  }

  static bool validDate(String date) {
    try {
      DateTime dateTime = DateTime.parse(date);
      if (dateTime.year > DateTime.now().year - 100 &&
          dateTime.year < DateTime.now().year - 18) {
        DateFormat('yyyy-MM-dd').format(dateTime);
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }
}
