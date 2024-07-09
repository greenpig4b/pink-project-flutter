import 'package:flutter/material.dart';

class TransactionTotalAccount extends StatelessWidget {
  const TransactionTotalAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("수입"),
              Text("지출"),
              Text("합계"),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("10,000원", style: TextStyle(color: Colors.blue),
            ),
            Text("1,000원", style: TextStyle(color: Colors.redAccent),
            ),
            Text("9,000원"),
          ],
        ),
      ],
    );
  }
}