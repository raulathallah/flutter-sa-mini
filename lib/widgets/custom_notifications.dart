import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showNotificationToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

void showNotificationSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg, style: TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ),
  );
}
