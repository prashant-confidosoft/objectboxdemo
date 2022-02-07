

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/database/database_provider.dart';
import 'index.dart';

late ObjectBox objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppManager.instance.initSharedPreference();
  objectbox = await ObjectBox.create();
  runApp(MyApp());
  // await Firebase.initializeApp();
  // if (kIsWeb) {
  //   runApp(MyApp());
  // } else {
  //   await initializeFlutterFire();
   
  //   runZonedGuarded(() {
      
  //   }, FirebaseCrashlytics.instance.recordError);
  // }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final botToastBuilder = BotToastInit();
    return CupertinoApp(
      title: 'Template',
      builder: (context, child) {
        child = MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child ?? Container(),
        );
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      supportedLocales: [
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale?.languageCode &&
              supportedLocaleLanguage.countryCode == locale?.countryCode) {
            return supportedLocaleLanguage;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      home: CupertinoTheme(
        data: MaterialBasedCupertinoThemeData(
          materialTheme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Poppins',
          ),
        ),
        child: getDefaultWidget(),
      ),
      onGenerateRoute: Routes.generateRoute,
    );
  }

  Widget getDefaultWidget() {
    Widget _defaultWidget = MyHomePage();
    // if (AppManager.instance.sharedPreferenceRepository.isLoggedIn()) {
    //   _defaultWidget = MyHomePage();
    // } else {
    //   _defaultWidget = LoginScreen();
    // }
    _defaultWidget = MyHomePage();
    return _defaultWidget;
  }
}
