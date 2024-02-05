// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:bjj/login/login_page.dart';
import 'package:bjj/student/student_dashboard/student_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../trainer/trainer_homescreen/trainer_homescreen.dart';

class SplashServices {
  void isLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    if (FirebaseAuth.instance.currentUser != null) {
      if (GetStorage().read('user_role') == 'teacher') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const TrainerHomescreen()),
          (route) => false,
        );
        return;
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const StudentDashboard()),
        (route) => false,
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
    return;
  }
}
