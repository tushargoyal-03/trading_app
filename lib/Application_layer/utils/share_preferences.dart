import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  //pref- value
  static const String IS_LOGGED_IN = 'is_logged_in';
  static const String ACCESS_TOKEN = "access_token";
  static const String SHOW_INTREST = "show_intrest";
  static const String SHOW_GENDER_INTEREST = "show_gender_interest";
  static const String SHOW_ACTIVITY_STATUS = "show_activity_status";
  static const String ALLOW_LIKES = 'allow_likes';
  static const String ALLOW_SUPER_LIKES = 'allow_super_likes';
  static String IS_MATCH = 'is_match';
  static String IS_MESSAGE = 'is_message';
  static String IS_SHOW_PROFILE = 'is_show_profile';
  static String IS_BASIC_INFO_FILLED = 'is_basic_info_filled';
  static String IS_FORM2_FILLED = 'is_form2_filled';
  static String IS_FORM3_FILLED = 'is_form3_filled';
  static String IS_FORM4_FILLED = 'is_form4_filled';
  static String IS_FORM5_FILLED = 'is_form5_filled';
  static String IS_FORM6_FILLED = 'is_form6_filled';
  static String USER_ID = 'userid';
  static String USER_NAME = 'username';
  static String USER_BIO = 'userbio';
  static String USER_MAIL = 'usermail';
  static String USER_PHONE = 'userphone';
  static String USER_PROFILE = 'userprofile';
  static const String USER_INTERESTS = "user_interests";


  //static const String DARK_MODE = "dark";

  static SpUtil? _instance;

  static Future<SpUtil> get instance async {
    return await getInstance();
  }

  static SharedPreferences? _spf;

  SpUtil._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<SpUtil> getInstance() async {
    _instance ??= SpUtil._();
    if (_spf == null) {
      await _instance!._init();
    }
    return _instance!;
  }

  bool hasKey(String key) {
    Set keys = getKeys();
    return keys.contains(key);
  }

  Set<String> getKeys() {
    return _spf!.getKeys();
  }

  get(String key) {
    return _spf!.get(key);
  }

  getString(String key) {
    return _spf!.getString(key);
  }

  Future<bool> putString(String key, String value) {
    return _spf!.setString(key, value);
  }

  bool? getBool(String key) {
    return _spf!.getBool(key);
  }

  Future<bool> putBool(String key, bool value) {
    return _spf!.setBool(key, value);
  }

  int? getInt(String key) {
    return _spf!.getInt(key);
  }

  Future<bool> putInt(String key, int value) {
    return _spf!.setInt(key, value);
  }

  double? getDouble(String key) {
    return _spf!.getDouble(key);
  }

  Future<bool> putDouble(String key, double value) {
    return _spf!.setDouble(key, value);
  }

  List<String>? getStringList(String key) {
    return _spf!.getStringList(key);
  }

  Future<bool> putStringList(String key, List<String> value) {
    return _spf!.setStringList(key, value);
  }

  dynamic getDynamic(String key) {
    return _spf!.get(key);
  }

  Future<bool> remove(String key) {
    return _spf!.remove(key);
  }

  Future<bool> clear() {
    return _spf!.clear();
  }

  clearImportantKeys() {
    remove(ACCESS_TOKEN);
    remove(IS_LOGGED_IN);
    remove(SHOW_INTREST);
    remove(USER_INTERESTS);
  }
}