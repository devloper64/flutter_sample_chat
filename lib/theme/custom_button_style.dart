import 'package:flutter/material.dart';
import 'package:sample_chat_app_with_graphql/theme/theme_helper.dart';
import 'package:sample_chat_app_with_graphql/utils/size_utils.dart';

/// A class that offers pre-defined button styles for customizing button appearance
class CustomButtonStyles {
  // Filled button styles
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
  );

  static ButtonStyle get fillBlueGrayTL20 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.h),
    ),
  );

  static ButtonStyle get fillBlueGray1 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray100,
  );

  static ButtonStyle get fillGreen => ElevatedButton.styleFrom(
    backgroundColor: appTheme.green200,
  );

  static ButtonStyle get fillLime => ElevatedButton.styleFrom(
    backgroundColor: appTheme.lime400,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.h),
    ),
  );

  static ButtonStyle get fillLimeTL12 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.lime400,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
  );

  static ButtonStyle get fillPink => ElevatedButton.styleFrom(
    backgroundColor: appTheme.pink200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.h),
    ),
  );

  static ButtonStyle get fillPinkTL12 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.pink200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
  );

  static ButtonStyle get fillPrimaryTL20 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.h),
    ),
  );

  static ButtonStyle get fillPrimary1 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
  );

  static ButtonStyle get fillSecondaryContainer => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.secondaryContainer,
  );

  static ButtonStyle get fillTeal => ElevatedButton.styleFrom(
    backgroundColor: appTheme.teal400,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
  );

  static ButtonStyle get fillTeall => ElevatedButton.styleFrom(
    backgroundColor: appTheme.teal300,
  );

  // Outline button styles
  static ButtonStyle get outlineGray => OutlinedButton.styleFrom(
    backgroundColor: appTheme.gray50,
    side: BorderSide(
      color: appTheme.gray500,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
  );

  static ButtonStyle get outlineGrayTL10 => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: appTheme.gray500,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
  );

  static ButtonStyle get outlinePrimary => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.h),
    ),
  );

  // Text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
    side: MaterialStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent),
    ),
  );
}
