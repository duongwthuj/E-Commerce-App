import 'package:flutter/src/widgets/framework.dart';

class TValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    // if (password.length < 6) {
    //   return 'Password must be at least 6 characters';
    // }
    // if (!password.contains(RegExp(r'[0-9]'))) {
    //   return 'Password must contain at least one number';
    // }
    // if (!password.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain at least one uppercase letter';
    // }
    // if (!password.contains(RegExp(r'{!@#%^&*()}'))) {
    //   return 'Password must contain at least one lowercase letter';
    // }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegExp = RegExp(r'(84|0[3|5|7|8|9])+([0-9]{8})\b');
    if (!phoneRegExp.hasMatch(phoneNumber)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateEmpty(String? fielName, String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateEmptyText(String s, String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
