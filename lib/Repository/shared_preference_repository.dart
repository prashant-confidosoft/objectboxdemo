import 'package:flutter_template/model/login/login/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../index.dart';

final _preferenceKeyLoggedIn = 'keyLoggedIn';
final _preferenceKeyLoginResponse = 'keyLoginResponse';
// final _preferenceKeyPropertyId = 'keyPropertyId';
// final _preferenceKeyUserResponse = 'keyUserResponse';
// final _preferenceKeyUserDeviceResponse = 'keyUserDeviceResponse';

class SharedPreferenceRepository {

  Future<SharedPreferences> getSharedPrefInstance() async {
    var sharedPreferences =
        await SharedPreferences.getInstance().then((value) => value);
    return sharedPreferences;
  }

  /// Saves LoggedIn status in shared preference
  void saveLoggedIn(bool value) {
    AppManager.sharedPreferences!.setBool(_preferenceKeyLoggedIn, value);
  }

  /// Gets LoggedIn status from shared preference
  bool isLoggedIn() {
    return AppManager.sharedPreferences!.getBool(_preferenceKeyLoggedIn) ??
        false;
  }

  void saveLoginResponse(LoginResponse value) {
    AppManager.sharedPreferences!
        .setString(_preferenceKeyLoginResponse, json.encode(value));
  }
  
  LoginResponse getLoginResponse() {
    return LoginResponse.fromJson(json.decode(
        AppManager.sharedPreferences!.getString(_preferenceKeyLoginResponse)!));
  }

  // void saveUserResponse(UserResponse value) {
  //   var sharedPreferences = await getSharedPrefInstance();
  //   AppManager.sharedPreferences
  //       .setString(_preferenceKeyUserResponse, json.encode(value));
  // }

  // UserResponse getUserResponse() {
  //   var sharedPreferences = await getSharedPrefInstance();
  //   return UserResponse.fromJson(json.decode(
  //       AppManager.sharedPreferences.getString(_preferenceKeyUserResponse)));
  // }

  // void saveUserDeviceResponse(UserDeviceResponse value) {
  //   var sharedPreferences = await getSharedPrefInstance();
  //   AppManager.sharedPreferences
  //       .setString(_preferenceKeyUserDeviceResponse, json.encode(value));
  // }

  // UserDeviceResponse getUserDeviceResponse() {
  //   return UserDeviceResponse.fromJson(json.decode(
  //       AppManager.sharedPreferences.getString(_preferenceKeyUserDeviceResponse)));
  // }

  /// Save Int Data
  void setInt(String key, int value) {
    AppManager.sharedPreferences!.setInt(key, value);
  }

  /// Get Int Data
  int? getInt(String key) {
    return AppManager.sharedPreferences!.getInt(key);
  }

  void clearAllData() {
    var _prefs = AppManager.sharedPreferences;
    _prefs!.clear();
  }
}
