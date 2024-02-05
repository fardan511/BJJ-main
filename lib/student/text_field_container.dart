import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final Widget child;

  const TextContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: child,
    );
  }
}
