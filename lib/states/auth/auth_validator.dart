import 'package:email_validator/email_validator.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';

class AuthValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return AppStrings.emptyFieldError;
    }
    if (!EmailValidator.validate(email)) {
      return AppStrings.emailFormatError;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppStrings.emptyFieldError;
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return AppStrings.emptyFieldError;
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppStrings.emptyFieldError;
    }
    if (confirmPassword != password) {
      return AppStrings.differentPasswordsError;
    }
    return null;
  }
}