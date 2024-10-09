import 'package:flutter/material.dart';
import 'package:sample_chat_app_with_graphql/theme/theme_helper.dart';
import 'package:sample_chat_app_with_graphql/utils/size_utils.dart';

// Extension for TextStyle
extension TextStyleExtension on TextStyle {
  TextStyle get helveticaNeue => copyWith(fontFamily: 'Helvetica Neue');
}

// Collection of pre-defined text styles
class CustomTextStyles {
  // Body text styles


  static TextStyle get bodyLargeGray800 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.gray800,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get bodyMediumBlue400 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.blue400,
    fontSize: 13.fSize,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodyMediumGray400 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray400,
  );

  static TextStyle get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray500,
  );

  static TextStyle get bodyMediumGray500_1 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray500,
  );

  static TextStyle get bodyMediumGray80001 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray80001,
  );

  static TextStyle get bodyMediumGray8002 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray800,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get bodyMediumGray800 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray800,
    fontSize: 14.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodyMediumPink200 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.pink200,
  );

  static TextStyle get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.black900,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallBlue400 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blue400,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallBlue400Light => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blue400,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallBlue400Light12 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blue400,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallBluegray100 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blueGray100,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray400,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallGray50 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray50,
    fontSize: 8.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallGray50Light => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray50,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallGray800 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray800,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallGray800Light => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray800,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallGray800Light12 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray800,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallLight => theme.textTheme.bodySmall!.copyWith(
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallLight_1 => theme.textTheme.bodySmall!.copyWith(
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodyMediumPrimary => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blue400,
    fontSize: 13.fSize,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodyLargePrimary_1 => theme.textTheme.bodyLarge!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 14.fSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get bodySmallPrimaryLight => theme.textTheme.bodySmall!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get bodySmallPrimary_1 => theme.textTheme.bodySmall!.copyWith(
    color: theme.colorScheme.primary,
  );

  static TextStyle get bodySmallRed30001 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.red30001,
    fontSize: 8.fSize,
    fontWeight: FontWeight.w300,
  );

  // Headline styles
  static TextStyle get headlineLarge_1 => theme.textTheme.headlineLarge!;

  static TextStyle get headlineSmallGreen400 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.green400,
  );

  static TextStyle get headlineSmallIndigo400 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.indigo400,
  );

  static TextStyle get headlineSmallLime400 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.lime400,
  );

  static TextStyle get headlineSmallOrangeA200 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.orangeA200,
  );

  static TextStyle get headlineSmallPink200 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.pink200,
  );

  static TextStyle get headlineSmallRed300 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.red300,
  );

  static TextStyle get headlineSmallRed30001 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.red30001,
  );

  static TextStyle get headlineSmallTeal200 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.teal200,
  );

  static TextStyle get headlineSmallTeal400 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.teal400,
  );

  // Label text styles
  static TextStyle get labelLarge13 => theme.textTheme.labelLarge!.copyWith(
    fontSize: 13.fSize,
  );

  static TextStyle get labelLargeGray50 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray50,
  );

  static TextStyle get labelLargeGray500 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray500,
    fontSize: 13.fSize,
  );

  static TextStyle get labelLargeGray500_1 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray500,
  );

  static TextStyle get labelMediumBlue400 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.blue400,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get labelMediumGray500 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.gray500,
  );

  static TextStyle get labelMediumGray500_1 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.gray500,
  );

  static TextStyle get labelMediumGray800 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.gray800,
  );

  static TextStyle get labelMediumGray80001 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.gray800,
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
    height: 1.6
  );

  static TextStyle get labelMediumGray80002 => theme.textTheme.labelMedium!.copyWith(
      color: appTheme.gray800,
      fontSize: 14.fSize,
      fontWeight: FontWeight.w300,
      height: 1.6
  );

  static TextStyle get labelMediumRed30001 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.red30001,
  );

  static TextStyle get labelSmall10PinkCoral600 => theme.textTheme.labelSmall!.copyWith(
    color: appTheme.pinkCoral,
    fontWeight: FontWeight.w600,
    fontSize: 10.fSize,
  );

  static TextStyle get labelMedium16Gray800 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.gray800,
    fontWeight: FontWeight.w500,
    fontSize: 16.fSize,
  );

  // Title text styles
  static TextStyle get titleLargeHelveticaNeueWhiteA700 => theme.textTheme.titleLarge!.helveticaNeue.copyWith(
    color: appTheme.whiteA700,
    fontSize: 22.fSize,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get titleLargeLime400 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.lime400,
  );

  static TextStyle get titleLargePink200 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.pink200,
  );

  static TextStyle get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.primary,
  );

  static TextStyle get titleLargePrimary_1 => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleLargeTeal400 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.teal400,
  );

  static TextStyle get titleMediumBluegray600 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.blueGray600,
  );

  static TextStyle get titleMediumGray50 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray50,
  );

  static TextStyle get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray500,
  );

  static TextStyle get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.primary,
  );

  static TextStyle get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.primary,
  );

  static TextStyle get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.whiteA700,
  );

  static TextStyle get titleSmallBluegray600 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray600,
  );

  static TextStyle get titleSmallGray50 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray50,
  );

  static TextStyle get titleSmallGray50_1 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray50,
  );

  static TextStyle get titleSmallGray800 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray800,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get titleSmallGray800_1 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray800,
  );

  static TextStyle get titleSmallGray800_2 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray800,
  );

  static TextStyle get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onPrimary,
    fontSize: 15.fSize,
    fontWeight: FontWeight.w500,
  );

  static get tittleSmallPink200=>theme.textTheme.titleSmall!.copyWith(
    color: appTheme.pink200
  );

  static get tittleSmallPrimary=>theme.textTheme.titleSmall!.copyWith(
      color: theme.colorScheme.primary
  );
  static get tittleSmallWhiteA700=>theme.textTheme.titleSmall!.copyWith(
      color: appTheme.whiteA700
  );

}
