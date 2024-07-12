import 'package:flutter/material.dart';

class StartviewSocialButton extends StatelessWidget {
  final String assetName;
  final VoidCallback onPressed;

  const StartviewSocialButton({
    Key? key,
    required this.assetName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            assetName,
            width: 45,
            height: 45,
          ),
        ),
      ),
    );
  }
}
