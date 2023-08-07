import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/joke_logo.png',
      height: 180.0,
      fit: BoxFit.fitHeight,
    );
  }
}
