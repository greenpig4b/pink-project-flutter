import 'package:flutter/material.dart';

class UnderLineWidget extends StatelessWidget {
  const UnderLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      height: 0.3,
      color: Colors.grey,
    );
  }
}
