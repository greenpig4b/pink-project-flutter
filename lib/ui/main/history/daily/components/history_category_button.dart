import 'package:flutter/material.dart';

class HistoryTypeButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const HistoryTypeButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 150,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Color(0xFFFC7C9A)),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFFFC7C9A),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
