import 'package:flutter/material.dart';

class HistoryTypeButton extends StatelessWidget {
  final isSelected ;
  final String text;
  final VoidCallback onTap;

  const HistoryTypeButton({
    required this.isSelected,
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
            color: isSelected ? Colors. white : Colors.white12,
            borderRadius: BorderRadius.circular(8.0),
            border: isSelected ? Border.all(color: Color(0xFFFC7C9A)) : Border.all(color: Colors.grey),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Color(0xFFFC7C9A) : Colors.grey,
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
