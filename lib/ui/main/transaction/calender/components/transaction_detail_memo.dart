import 'package:flutter/material.dart';

class TransactionDetailMemo extends StatelessWidget {

  final title;

  TransactionDetailMemo({required this.title});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFFFC7C9A), // 테두리 색상
                width: 1, // 테두리 두께
              ),
            ),
          ),
          SizedBox(width: 7,),
          Text(
            title,
            style: TextStyle(
                color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}