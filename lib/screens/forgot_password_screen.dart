import 'package:flutter/material.dart';
import 'package:flutter_template/bloc/forgot_password_bloc.dart';
import '../index.dart';

class ForgotPasswordScreen extends BaseView {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseViewState<ForgotPasswordScreen>
    with BasePage {
  final ForgotPasswordBloc _forgotPasswordBloc = ForgotPasswordBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initBaseState() {
    titleScreen = 'reset_your_password';
    rightAppBarButton = RightAppBarButton.Empty;
    leftAppBarButton = LeftAppBarButton.Back;

    _forgotPasswordBloc.errorSubject.listen((error) {
      showErrorMessage(error, scaffoldKey.currentState!);
    });

    _forgotPasswordBloc.isLoading.listen((value) {
      if (value) {
        showIndicator('Loading...', scaffoldKey.currentState!);
      } else {
        hideIndicator(scaffoldKey.currentState!);
      }
    });

    _forgotPasswordBloc.forgotPasswordResponse.listen((response) {
      Navigator.pushReplacementNamed(context, loginScreen);
    });
  }

  @override
  Widget body() {
    final _localizations = AppLocalizations.of(context);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [bluePurple, vividViolet, cadillac],
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
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
                  CustomTextField(
                    label: _localizations!.translate('email') ?? '',
                    controller: _forgotPasswordBloc.emailController,
                    onSubmitted: (value) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _onSendEmailPressed();
                      }
                    },
                    validator: (value) {
                      var result = _forgotPasswordBloc.validator
                          .validateEmail(value ?? '');
                      if (result != '') {
                        return _localizations.translate(result) ?? result;
                      }
                      return null;
                    },
                    // hintText: _localizations!.translate('email'),
                    keyboardType: TextInputType.emailAddress,
                    showPasswordToggleIcon: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CustomRaisedButton(
                      borderRadius: 5,
                      buttonColor: white,
                      text: AppLocalizations.of(context)!.translate('continue'),
                      onCustomButtonPressed: () {
                        _onSendEmailPressed();
                      },
                      textColor: bluePurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Center(
        //   child: Container(
        //     height: 100,
        //     padding: EdgeInsets.all(16),
        //     child: NeuTextField(
        //       controller: _forgotPasswordBloc.emailController,
        //       shape: NeumorphicBoxShape.roundRect(
        //         BorderRadius.circular(12),
        //       ),
        //       depth: 20,
        //       hint: _localizations.translate('email'),
        //       keyboardType: TextInputType.emailAddress,
        //       showPasswordToggleIcon: false,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  void _onSendEmailPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _forgotPasswordBloc.getForgotPasswordCode();
    }
  }
}
