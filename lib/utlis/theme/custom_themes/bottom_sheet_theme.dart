import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
      backgroundColor: Colors.white,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      modalBackgroundColor: Colors.white,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ));

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
      backgroundColor: Colors.black,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      modalBackgroundColor: Colors.black,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ));
}
