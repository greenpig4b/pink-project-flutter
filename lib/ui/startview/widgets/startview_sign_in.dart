import 'package:flutter/material.dart';
import 'startview_form.dart';

class StartviewSignIn extends StatelessWidget {
  const StartviewSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          StartviewForm(),
        ],
      ),
    );
  }
}
