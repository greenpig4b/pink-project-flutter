import 'package:flutter/material.dart';
import '../../../../../data/dtos/transaction/transaction_response.dart';

class TransactionList extends StatelessWidget {
  final List<DailyTransactionDetailDTO> dailyTransactionDetailDTO;

  const TransactionList({Key? key, required this.dailyTransactionDetailDTO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dailyTransactionDetailDTO.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  item.transactionType == "EXPENSE"
                      ? item.categoryOut ?? ''
                      : item.categoryIn ?? '',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.description),
                    Row(
                      children: [
                        Text(item.time),
                        SizedBox(width: 10),
                        Text(item.assets),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  item.amount,
                  style:  TextStyle(color: item.transactionType == "EXPENSE" ? Colors.red : Colors.blue),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
