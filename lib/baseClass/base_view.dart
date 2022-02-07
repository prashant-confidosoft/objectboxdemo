import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import '../index.dart';

enum LeftAppBarButton {
  Logout,
  Back,
  Empty,
  Custom,
}

enum RightAppBarButton {
  Logout,
  Back,
  Empty,
  Custom,
}

abstract class BaseView<Bloc extends BaseBloc> extends StatefulWidget {
  // final Bloc bloc;
  BaseView({Key? key}) : super(key: key);
}

abstract class BaseViewState<Page extends BaseView> extends State<Page> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  void initBaseState();
}

mixin BasePage<Page extends BaseView> on BaseViewState<Page> {
  bool isSafeAreaRequire = true;
  bool isHiddenNavigationBar = false;
  String titleScreen = '';
  LeftAppBarButton leftAppBarButton = LeftAppBarButton.Back;
  RightAppBarButton rightAppBarButton = RightAppBarButton.Empty;
  late Builder leftBuilder;
  late List<CustomAppBarIconButton> rightBuilder;

  @override
  void initState() {
    super.initState();
    initBaseState();
  }

  void showErrorMessage(String event, ScaffoldState context) {
    var message = AppLocalizations.instance?.translate(event);
    showToast(message ?? event);
  }

  void showIndicator(String event, ScaffoldState sContext) {
    if (event.isNotEmpty) {
      showProgressDialog(event, sContext.context);
    } else {
      showProgressDialog(
          AppLocalizations.of(context)!.translate('please_wait')!,
          sContext.context);
    }
  }

  void hideIndicator(ScaffoldState sContext) {
    hideProgressDialog(sContext.context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: !isHiddenNavigationBar ? buildAppBar(context) : null,
        body: isSafeAreaRequire
            ? SafeArea(
                child: Container(
                  color: Colors.white,
                  child: body(),
                ),
              )
            : Container(
                color: Colors.white,
                child: body(),
              ),
      ),
    );
  }

  Text buildTitleText(BuildContext context, String title) {
    return Text(
      title,
      style: appBarTitleText(),
    );
  }

  Widget body();

  PreferredSizeWidget buildAppBar(BuildContext context) {
    if (ResponsiveWidget.isSmallScreen(context) ||
        ResponsiveWidget.isMediumScreen(context)) {
      return AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: darkBlue, //change your color here
        ),
        leading: leftAppBarButton == LeftAppBarButton.Empty
            ? null
            : buildLeftBuilder(),
        backgroundColor: Colors.white,
        title: buildTitleText(context, titleScreen),
        actions: rightAppBarButton == RightAppBarButton.Empty
            ? null
            : buildRightBuilder(),
      );
    } else {
      //#TODO: Implement web NAvigation Bar Code
      var screenSize = MediaQuery.of(context).size;
      return PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(),
      );
    }
  }

  List<CustomAppBarIconButton> buildRightBuilder() {
    if (rightAppBarButton == RightAppBarButton.Custom) {
      return rightBuilder;
    } else if (rightAppBarButton == RightAppBarButton.Logout) {
      return [
        CustomAppBarIconButton(
          icon: Icons.exit_to_app,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(loginScreen);
          },
        )
      ];
    } else {
      return [
        CustomAppBarIconButton(
          icon: Icons.exit_to_app,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(loginScreen);
          },
        )
      ];
    }
  }

  Builder buildLeftBuilder() {
    if (leftAppBarButton == LeftAppBarButton.Custom) {
      return leftBuilder;
    } else {
      return Builder(
        builder: (BuildContext context) {
          if (leftAppBarButton == LeftAppBarButton.Back) {
            return CustomAppBarIconButton(
              icon: Icons.arrow_back_ios,
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          } else {
            return CustomAppBarIconButton(
              icon: Icons.arrow_back_ios,
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          }
        },
      );
    }
  }
}
