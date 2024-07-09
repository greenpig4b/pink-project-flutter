import 'package:flutter/material.dart';

class TransactionCategoryButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  TransactionCategoryButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
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
