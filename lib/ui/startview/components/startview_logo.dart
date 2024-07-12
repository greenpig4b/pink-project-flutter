import 'package:flutter/material.dart';

class StartviewLogo extends StatelessWidget {
  const StartviewLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Center(
        child: Image.asset(
          'assets/images/main.png',
          fit: BoxFit.contain,
          height: 250,
        ),
      ),
    );
  }
}
