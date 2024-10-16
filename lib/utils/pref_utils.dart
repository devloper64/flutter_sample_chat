//ignore: unused_import    
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setAccessToken(String value) {
    return _sharedPreferences!.setString('accessToken', value);
  }

  String getAccessToken() {
    try {
      return _sharedPreferences!.getString('accessToken')!;
    } catch (e) {
      return '';
    }
  }

  Future<void> setUserId(String value) {
    return _sharedPreferences!.setString('userId', value);
  }

  String getUserId() {
    try {
      return _sharedPreferences!.getString('userId')!;
    } catch (e) {
      return '';
    }
  }

}
    