import 'package:flutter/material.dart';
import 'package:sample_chat_app_with_graphql/theme/theme_helper.dart';
import 'package:sample_chat_app_with_graphql/utils/size_utils.dart';


class AppDecoration {
  // B decorations
  static BoxDecoration get bW10 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get bW20 => BoxDecoration(
        color: appTheme.blueGray100,
      );

  // Brandcolor decorations
  static BoxDecoration get brandcolorBackground => BoxDecoration(
        color: appTheme.gray50,
      );

  static BoxDecoration get brandcolorBackgroundBW20 => BoxDecoration(
        color: appTheme.blueGray100,
        border: Border(
          left: BorderSide(
            color: appTheme.gray50,
            width: 1.h,
          ),
          right: BorderSide(
            color: appTheme.gray50,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get brandcolorMainDark => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );

  static BoxDecoration get brandcolorMainDark2 => BoxDecoration(
        color: appTheme.blueGray600,
      );

  static BoxDecoration get brandcolorMainLight => BoxDecoration(
        border: Border(
          left: BorderSide(
            color: theme.colorScheme.onPrimaryContainer,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get brandcolorMainLight2 => BoxDecoration(
        color: appTheme.green50,
      );

  static BoxDecoration get brandcolorMainLight2BW20 => BoxDecoration(
        color: appTheme.blueGray100,
        border: Border(
          right: BorderSide(
            color: appTheme.green50,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get brandcolorMainMiddle => BoxDecoration(
        color: appTheme.green200,
      );

  static BoxDecoration get brandcolorMainPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Fill decorations
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );

  // Outline decorations
  static BoxDecoration get outlineBlue => BoxDecoration(
        border: Border.all(
          color: appTheme.blue400,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineBlueGray => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray100,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineBlueGray100 => BoxDecoration();

  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.blueGray100,
        border: Border(
          left: BorderSide(
            color: appTheme.gray50,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineGray200 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.gray200,
            width: 1.h,
          ),
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineGray2001 => BoxDecoration();

  static BoxDecoration get outlineGray2002 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.gray200,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineGreen => BoxDecoration();

  static BoxDecoration get outlineGreen50 => BoxDecoration(
        color: appTheme.blueGray100,
        border: Border(
          left: BorderSide(
            color: appTheme.green50,
            width: 1.h,
          ),
          right: BorderSide(
            color: appTheme.green50,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineGreen501 => BoxDecoration(
        color: appTheme.blueGray100,
        border: Border(
          left: BorderSide(
            color: appTheme.green50,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlinePrimary => BoxDecoration();

  static BoxDecoration get outlineRed => BoxDecoration(
        border: Border.all(
          color: appTheme.red30001,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlinePinkCoral => BoxDecoration(
    borderRadius: BorderRadiusStyle.roundedBorder5,
        border: Border.all(
          color: appTheme.pinkCoral,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineSecondaryContainer => BoxDecoration();

// Fs decorations
  static BoxDecoration get fs8typescolorMedicineLight => BoxDecoration(
        color: appTheme.lightGreen5001,
      );

  static BoxDecoration get fs8typescolorNeck => BoxDecoration(
        color: appTheme.teal400,
      );

  static BoxDecoration get fs8typescolorNeckLight => BoxDecoration(
        color: appTheme.teal5001,
      );

  static BoxDecoration get fs8typescolorPeriodLight => BoxDecoration(
        color: appTheme.pink50,
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL10 => BorderRadius.horizontal(
        left: Radius.circular(10.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );

  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );

  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );

  static BorderRadius get roundedBorder6 => BorderRadius.circular(
        6.h,
      );

  static BorderRadius get roundedBorder5 => BorderRadius.circular(5.h);
  static BorderRadius get roundedBorder4 => BorderRadius.circular(4.h);
}
