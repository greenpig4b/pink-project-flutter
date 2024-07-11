import 'package:flutter/material.dart';
import 'startview_form.dart';

class StartviewSignIn extends StatelessWidget {
  const StartviewSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        children: [
          StartviewForm(),
        ],
      ),
    );
  }
}
