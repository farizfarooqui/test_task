import 'package:flutter/material.dart';
import 'package:test_task/Constant/app_colors.dart';

class AppStyle {
  static InputDecoration inputFieldDecoration(
      {String? labelText, bool hasFocus = false, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: labelText,
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.only(left: 15, bottom: hasFocus ? 15 : 0),
      hintStyle: const TextStyle(fontSize: 15, color: AppColors.darkGrey),
      border: InputBorder.none,
    );
  }
}
