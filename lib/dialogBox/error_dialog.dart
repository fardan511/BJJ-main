import 'package:bjj/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String message;
  // ignore: use_key_in_widget_constructors
  const ErrorAlertDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          child: Center(
            child: Text(
              'OK',
              style: GoogleFonts.merriweather(), // Apply the desired font
            ),
          ),
        )
      ],
    );
  }
}
