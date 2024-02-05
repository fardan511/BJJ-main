import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class UtilsLogin {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: "Successfully Login",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}

class UtilsInvalidEmailPassword {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: "Invalid Email or Password",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}

class UtilsForgetPassword {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg:
          "We have sent you an Email to recover password, \nPlease check your Email",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}

class UtilsInvalidEmail {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: "Please Enter Valid Email",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
