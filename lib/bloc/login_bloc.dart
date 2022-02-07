import 'package:flutter_template/Repository/authentication_repository.dart';
import 'package:flutter_template/index.dart';
import 'package:flutter_template/model/login/login/login_request.dart';
import 'package:flutter_template/model/login/login/login_response.dart';
import 'package:flutter_template/model/member/members.dart';
import 'package:flutter_template/repository/login_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Validator validator = Validator();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BehaviorSubject<LoginResponse> loginResponse =
      BehaviorSubject<LoginResponse>();
  BehaviorSubject<MembersResponse> pageSamitiResponse =
      BehaviorSubject<MembersResponse>();

  void login() async {
    isLoading.add(true);

    try {
      var loginRepository = LoginRepository();

      var request = LoginRequest();
      request.rememberMe = true;
      request.clientType = 0;
      request.deviceId = DateTime.now().millisecondsSinceEpoch.toString();
      request.email = emailController.text;
      request.password = passwordController.text;
      request.offset = DateTime.now().timeZoneOffset.inMinutes;

      var response = await loginRepository.login(request);
      isLoading.add(false);
      loginResponse.add(response);
    } catch (e) {
      isLoading.add(false);
      errorSubject.add(e.toString());
    }
  }

  void getPageSamiti() async {
    isLoading.add(true);

    try {
      var dashboardRepository = AuthenticationRepository();
      var response = await dashboardRepository.ssyPageSamiti();
      isLoading.add(false);
      pageSamitiResponse.add(response);
    } catch (e) {
      isLoading.add(false);
      errorSubject.add(e.toString());
    }
  }

  @override
  void dispose() {
    loginResponse.close();
  }
}
