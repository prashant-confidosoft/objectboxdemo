import 'package:flutter/material.dart';
import 'package:flutter_template/bloc/login_bloc.dart';
import '../index.dart';

class LoginScreen extends BaseView {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseViewState<LoginScreen> with BasePage {
  final LoginBloc _loginBloc = LoginBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initBaseState() {
    isHiddenNavigationBar = true;
    // titleScreen = 'key_title_login';
    leftAppBarButton = LeftAppBarButton.Empty;
    rightAppBarButton = RightAppBarButton.Empty;
    isSafeAreaRequire = false;

    _loginBloc.errorSubject.listen((error) {
      showErrorMessage(error, scaffoldKey.currentState!);
    });

    _loginBloc.isLoading.listen((value) {
      if (value) {
        showIndicator('Loading...', scaffoldKey.currentState!);
      } else {
        hideIndicator(scaffoldKey.currentState!);
      }
    });

    _loginBloc.loginResponse.listen((response) async {
      if (response.data?.id != null) {
        AppManager.instance.sharedPreferenceRepository
            .saveLoginResponse(response);
        AppManager.instance.loginResponseData = response;
        AppManager.instance.sharedPreferenceRepository.saveLoggedIn(true);
        await Navigator.pushReplacementNamed(context, homeScreen);
      }
    });
  }

  @override
  Widget body() {
    final _localizations = AppLocalizations.of(context);

    return ResponsiveWidget(
      smallScreen: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [bluePurple, vividViolet, cadillac],
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Image.asset(
                          ImagePath.logo,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(height: 50),
                      Column(
                        children: <Widget>[
                          CustomTextField(
                            label: _localizations!.translate('email') ?? '',
                            controller: _loginBloc.emailController,
                            // hintText: _localizations.translate('email') ?? '',
                            keyboardType: TextInputType.emailAddress,
                            showPasswordToggleIcon: false,
                            onSubmitted: (value) {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _onSignInPressed();
                              }
                            },
                            validator: (value) {
                              var result = _loginBloc.validator
                                  .validateEmail(value ?? '');
                              if (result != '') {
                                return _localizations.translate(result) ??
                                    result;
                              }
                              return null;
                            },
                          ),
                          verticalSizedBox16,
                          CustomTextField(
                            label:
                                _localizations.translate('key_password') ?? '',
                            controller: _loginBloc.passwordController,
                            // hintText:
                            //     _localizations.translate('key_password') ?? '',
                            onSubmitted: (value) {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _onSignInPressed();
                              }
                            },
                            validator: (value) {
                              if ((value ?? '').isEmpty || value == '') {
                                return _localizations
                                        .translate('password_is_required') ??
                                    'password_is_required';
                              }
                              return null;
                            },
                            showPasswordToggleIcon: true,
                          ),
                          verticalSizedBox24,
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: CustomRaisedButton(
                              borderRadius: 5,
                              buttonColor: white,
                              text: 'Login',
                              onCustomButtonPressed: () {
                                _onSignInPressed();
                              },
                              textColor: bluePurple,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, forgotPasswordScreen);
                            },
                            child: Text(
                              _localizations.translate('forgot_password') ?? '',
                              style: TextStyle(color: white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSignInPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _loginBloc.login();
    }
  }
}
