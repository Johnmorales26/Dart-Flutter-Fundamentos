import 'dart:io';
import 'package:profile_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static late SharedPreferences _preferences;

  static String _name = 'Ingrese un nuevo nombre';
  static String _email = 'Ingrese un nuevo email';
  static String _website = 'Ingrese un nuevo website';
  static String _phone = 'Ingrese un nuevo numero telefonico';
  static dynamic _photoPath = 'assets/images/img_flutter.png';
  static double _latitude = 0.0;
  static double _longitude = 0.0;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String get name {
    return _preferences.getString(KEY_NAME) ?? _name;
  }

  static set name(String name) {
    _name = name;
    _preferences.setString(KEY_NAME, name);
  }

  static String get email {
    return _preferences.getString(KEY_EMAIL) ?? _email;
  }

  static set email(String email) {
    _email = email;
    _preferences.setString(KEY_EMAIL, email);
  }

  static String get webSite {
    return _preferences.getString(KEY_WEB_SITE) ?? _website;
  }

  static set website(String website) {
    _website = website;
    _preferences.setString(KEY_WEB_SITE, website);
  }

  static String get phone {
    return _preferences.getString(KEY_PHONE) ?? _phone;
  }

  static set phone(String phone) {
    _phone = phone;
    _preferences.setString(KEY_PHONE, phone);
  }

  static set photoPath(dynamic photoPath) {
    _photoPath = photoPath;
    _preferences.setString(KEY_PHOTO_PATH, photoPath);
  }

  static dynamic get photoPath {
    var path = _preferences.getString(KEY_PHOTO_PATH);
    if (path != null) {
      return File(path);
    }
    return _photoPath;
  }

  static double get latitude {
    return _preferences.getDouble(KEY_LATITUDE) ?? _latitude;
  }
  
  static set latitude(double latitude) {
    _latitude = latitude;
    _preferences.setDouble(KEY_LATITUDE, latitude);
  }

  static double get longitude {
    return _preferences.getDouble(KEY_LONGITUDE) ?? _longitude;
  }

  static set longitude(double longitude) {
    _longitude = longitude;
    _preferences.setDouble(KEY_LONGITUDE, longitude);
  }

  static removeValues() async {
    _preferences.remove(KEY_NAME);
    _preferences.remove(KEY_EMAIL);
    _preferences.remove(KEY_PHONE);
    _preferences.remove(KEY_WEB_SITE);
    _preferences.remove(KEY_PHOTO_PATH);
    _preferences.remove(KEY_LATITUDE);
    _preferences.remove(KEY_LONGITUDE);
  }

}