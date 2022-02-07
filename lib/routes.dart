import 'package:flutter_template/screens/forgot_password_screen.dart';
import 'package:flutter_template/screens/login_screen.dart';
import 'index.dart';

const String loginScreen = '/login';
const String forgotPasswordScreen = '/forgotPassword';
const String homeScreen = '/home';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case forgotPasswordScreen:
        return CupertinoPageRoute(builder: (_) => ForgotPasswordScreen());
      case homeScreen:
        return CupertinoPageRoute(builder: (_) => MyHomePage());
      default:
        return CupertinoPageRoute(
            builder: (_) => CupertinoPageScaffold(
                  child: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
