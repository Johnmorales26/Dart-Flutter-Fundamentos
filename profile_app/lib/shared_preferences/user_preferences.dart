import 'package:profile_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static late SharedPreferences _preferences;

  static String _name = "";
  static String _email = "";
  static String _webSite = "";
  static String _phone = "";
  static String _photoPath = "";
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
    return _preferences.getString(KEY_WEB_SITE) ?? _webSite;
  }

  static set website(String website) {
    _webSite = website;
    _preferences.setString(KEY_WEB_SITE, website);
  }

  static String get phone {
    return _preferences.getString(KEY_PHONE) ?? _phone;
  }

  static set phone(String phone) {
    _phone = phone;
    _preferences.setString(KEY_PHONE, phone);
  }

  static String get photoPath {
    return _preferences.getString(KEY_PHOTO_PATH) ?? _photoPath;
  }

  static set photoPath(String photoPath) {
    _photoPath = photoPath;
    _preferences.setString(KEY_PHOTO_PATH, photoPath);
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

}