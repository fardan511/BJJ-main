import 'package:bjj/trainer/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputCurrencyField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  // ignore: use_key_in_widget_constructors
  const InputCurrencyField({
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return TextContainer(
        child: Row(
      children: [
        const Text("\$"),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(fontSize: 0.028 * width),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ],
    ));
  }
}
