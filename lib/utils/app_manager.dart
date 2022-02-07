import 'dart:async';

import 'package:flutter_template/model/login/login/login_response.dart';
import 'package:flutter_template/repository/authentication_repository.dart';
import '../index.dart';

//Application level singleton class
class AppManager {
  AppManager._();
  static final AppManager instance = AppManager._();

  static SharedPreferences? sharedPreferences;
  LoginResponse? loginResponseData;
  
  /// Initializes shared preference instance
  Future initSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  final SharedPreferenceRepository sharedPreferenceRepository = SharedPreferenceRepository();
  Timer? timer;
  
  Future renewToken() async {
    var _authenticationRepository =
        AuthenticationRepository();
    try {
      var loginResponse =
          AppManager.instance.sharedPreferenceRepository.getLoginResponse();

      var response =
          await _authenticationRepository.renewToken(loginResponse.data!);
      loginResponseData = response;
      AppManager.instance.sharedPreferenceRepository
          .saveLoginResponse(response);
      await AppManager.instance.callRenewTokenTimer();
    } catch (e) {
      print(e.toString());
    }
  }

  Future callRenewTokenTimer() async {
    timer?.cancel();
    timer = Timer(
        Duration(
            seconds: int.parse(
                loginResponseData?.data?.expiresIn.toString() ?? '1800')), () {
      print('Call renew token after 30 minutes');
      AppManager.instance.renewToken();
    });
  }
}