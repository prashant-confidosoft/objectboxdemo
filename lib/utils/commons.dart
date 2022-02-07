import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import '../index.dart';

/// Shows DatePicker
Future<DateTime> showDatePickerView(
    BuildContext context, DateTime initialDate) async {
  var selectedDateTime = (await showDatePicker(
      //we wait for the dialog to return
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2120)))!;
  return selectedDateTime;
}

void showToast(String message) {
  BotToast.cleanAll();

  BotToast.showAnimationWidget(
    backgroundColor: Colors.transparent,
    duration: Duration(seconds: 10),
    animationDuration: Duration(milliseconds: 100),
    toastBuilder: (_) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 16, right: 16, top: 32),
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.black),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            MaterialButton(
                minWidth: 0.0,
                padding: EdgeInsets.zero,
                onPressed: () {
                  BotToast.cleanAll();
                },
                child: Icon(
                  Icons.cancel,
                  color: black,
                )),
          ],
        )),
  );
}

/// Shows TimePicker
Future<TimeOfDay> showTimePickerView(
    BuildContext context, TimeOfDay initialTime) async {
  var selectedTime = (await showTimePicker(
    initialTime: TimeOfDay.now(),
    context: context,
  )) as Future<TimeOfDay>;

  return selectedTime;
}

/// Converts Base64 to String
String convertBase64ToString(String strBase64) {
  var decodedText = utf8.decode(base64.decode(strBase64));
  print('text: $decodedText');
  return decodedText;
}

/// Shows Toast message
// void showToast(BuildContext context, String message) {
// Fluttertoast.showToast(
//     msg: message, toastLength: Toast.LENGTH_SHORT, backgroundColor: black);
// }

/// Show Progress Dialog
void showProgressDialog(String text, BuildContext context) {
  try {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: Stack(children: <Widget>[
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(component_padding),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: const Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.all(margin),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: margin,
                              ),
                              Text(
                                text,
                                style: black16TextFieldStyle(),
                              )
                            ]),
                      )),
                )
              ]));
        });
  } catch (e) {
    print(e.toString());
  }
}

// Check Internet Connection
// ConnectivityResult? connectivityResult;

// Future<bool> checkConnection() async {
//   connectivityResult = await (Connectivity().checkConnectivity());
//   bool isConnected;
//   if ((connectivityResult == ConnectivityResult.mobile) ||
//       (connectivityResult == ConnectivityResult.wifi)) {
//     isConnected = true;
//   } else {
//     isConnected = false;
//   }
//   return isConnected;
// }

/// Hides Progress dialog
void hideProgressDialog(BuildContext context) {
  Navigator.pop(context);
}
