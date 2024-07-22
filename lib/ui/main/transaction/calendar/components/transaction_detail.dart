import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/dtos/calendar/calendar.dart';

class TransactionDetail extends StatelessWidget {
  final TransactionDetails transactionDetails;

  // final category;
  // final content;
  // final property;
  // final price;
  // final isIncome; // true : 수입 false : 지출

  TransactionDetail({required this.transactionDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      transactionDetails.category!,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactionDetails.description!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          transactionDetails.assets!,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Text(
            transactionDetails.amount!,
            style: TextStyle(color: transactionDetails.transactionType == "EXPENSE" ? Colors.redAccent : Colors.blue),
          ),
        ],
      ),
    );
  }
}
