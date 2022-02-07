import 'package:flutter_template/model/forgotpassword/forgot_password_code_response.dart';
import 'package:flutter_template/model/forgotpassword/forgot_password_request.dart';
import 'package:flutter_template/model/forgotpassword/forgot_password_response.dart';

import '../index.dart';

class ForgotPasswordRepository {
  final baseApiProvider = ApiProvider();

  Future<ForgotPasswordCodeResponse> getForgotPasswordCode(
      {required String email}) async {
    final response = await baseApiProvider.call(
      url: '/api/v1/Account/mobile-forgot-password-code/$email',
      method: HTTPMethod.GET,
    );
    return ForgotPasswordCodeResponse.fromJson(response);
  }

  Future<ForgotPasswordResponse> getForgotPassword(
      ForgotPasswordRequest request) async {
    final response = await baseApiProvider.call(
        url: '/api/v1/Account/mobile-forgot-password',
        method: HTTPMethod.POST,
        request: request.toJson());
    return ForgotPasswordResponse.fromJson(response);
  }
}
