import 'package:flutter/material.dart';

import 'transaction_category_button.dart';

class TransactionCategory extends StatelessWidget {
  const TransactionCategory({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TransactionCategoryButton(
          text: "수입",
          onTap: () {
          },
        ),
        TransactionCategoryButton(
          text: "지출",
          onTap: () {
          },
        ),
      ],
    );
  }
}
