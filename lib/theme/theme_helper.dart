import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../utils/pref_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData getThemeData() {
    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder( borderRadius:BorderRadius.circular(10)),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        checkColor: MaterialStateColor.resolveWith((states) {
          return Colors.white; // Default color (if not selected)
        }),
        side: BorderSide(
          color: Color(0xFF999999),
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colorScheme.onSurface,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => getThemeData();
}
/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyMedium: TextStyle(
      color: appTheme.gray800,
      fontSize: 14.0,
      fontFamily: 'Hiragino Sans',
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      color: appTheme.gray500,
      fontSize: 10.0,
      fontFamily: 'Hiragino Sans',
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      color: colorScheme.primary,
      fontSize: 32.0,
      fontFamily: 'Hiragino Sans',
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      color: appTheme.gray50,
      fontSize: 24.0,
      fontFamily: 'Hiragino Sans',
      fontWeight: FontWeight.w600,
    ),
    labelLarge: TextStyle(
      color: appTheme.gray800,
      fontSize: 12.0,
      fontFamily: 'Hiragino Sans',
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: appTheme.gray50,
      fontSize: 10.0,
      fontFamily: 'Hiragino Sans',
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: appTheme.gray800,
      fontSize: 20.0,
      fontFamily: 'Hiragino Sans',
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: appTheme.gray800,
      fontSize: 16.0,
      fontFamily: 'Hiragino Sans',
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: appTheme.gray500,
      fontSize: 14.0,
      fontFamily: 'Hiragino Sans',
      fontWeight: FontWeight.w600,
    ),
  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF76AD94),
    secondaryContainer: Color(0XFF62927C),
    onPrimary: Color(0XFF252525),
    onPrimaryContainer: Color(0XFFBBD6CA),
  );
}

/// Class containing custom colors for a primary theme.
class LightCodeColors {
  // Black
  Color get black900 => Color(0xFF000000);
  // Blue
  Color get blue400 => Color(0xFF4F9DDB);

  // BlueGray
  Color get blueGray100 => Color(0xFFD9D9D9);
  Color get blueGray600 => Color(0xFF537968);

  // DeepOrange
  Color get deepOrange50 => Color(0xFFF0E9E0);

  // Gray
  Color get gray300=> Color(0xFFDADADA);
  Color get gray200 => Color(0xFFF0F0F0);
  Color get gray400 => Color(0xFFBBBBBB);
  Color get gray50 => Color(0xFFFAF9F5);
  Color get gray500 => Color(0xFF999999);
  Color get gray600 => Color(0xFF808080);
  Color get gray800 => Color(0xFF4D4D4D);
  Color get gray80001 => Color(0xFF474747);

  // Green
  Color get green200 => Color(0xFF9FC6B4);
  Color get green400 => Color(0xFF71C074);
  Color get green50 => Color(0xFFE4EFEA);
  Color get green5001 => Color(0xFFE3F3E3);

  // Indigo
  Color get indigo400 => Color(0xFF7472B7);
  Color get indigo50 => Color(0xFFE3E3F1);

  // LightGreen
  Color get lightGreen50 => Color(0xFFF6F3EA);
  Color get lightGreen5001 => Color(0xFFF3F4DE);

  // Lime
  Color get lime400 => Color(0xFFC5C75A);
  Color get lime4001 => Color(0xFFC5C75B);

  // Orange
  Color get orange300 => Color(0xFFF3C460);
  Color get orange50 => Color(0xFFF7ECDB);
  Color get orangeA200 => Color(0xFFD79E48);

  // Pink
  Color get pink200 => Color(0xFFE182A4);
  Color get pink2001 => Color(0xFFE183A4);
  Color get pink50 => Color(0xFFF9E6ED);
  Color get pinkCoral => Color(0xFFDF6868);

  // Red
  Color get red300 => Color(0xFFB69166);
  Color get red30001 => Color(0xFFDF6867);
  Color get red600 => Color(0xFFE74235);

  // Teal
  Color get teal200 => Color(0xFF65B1CA);
  Color get teal300 => Color(0xFF50A1C7);
  Color get teal400 => Color(0xFF3BA896);
  Color get teal50 => Color(0xFFE0F0F4);
  Color get teal5001 => Color(0xFFD8EEEA);

  // White
  Color get whiteA700 => Color(0xFFFFFFFF);

  Color get brandColorBackground => Color(0xFFF6F4EA);




}

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
