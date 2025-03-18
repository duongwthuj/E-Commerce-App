import 'package:flutter/material.dart';
import 'package:thuctapcoso/utlis/theme/custom_themes/appbar_theme.dart';
import 'package:thuctapcoso/utlis/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:thuctapcoso/utlis/theme/custom_themes/checkbox_theme.dart';
import 'package:thuctapcoso/utlis/theme/custom_themes/chip_theme.dart';
import 'package:thuctapcoso/utlis/theme/custom_themes/outlined_button_theme.dart';
import 'package:thuctapcoso/utlis/theme/custom_themes/text_field.dart';
import 'package:thuctapcoso/utlis/theme/custom_themes/text_theme.dart';
import 'package:thuctapcoso/utlis/theme/custom_themes/elevated_button_theme.dart';


class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextThem.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBar,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevateButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextThem.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBar,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevateButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );

}