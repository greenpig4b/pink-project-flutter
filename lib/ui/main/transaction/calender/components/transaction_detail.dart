import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionDetail extends StatelessWidget {

  final category;
  final content;
  final property;
  final price;
  final isIncome; // true : 수입 false : 지출

  TransactionDetail({required this.category, required this.content, required this.property, required this.price, required this.isIncome});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
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
                      category,
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(width: 70,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            content,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          property,
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ],
            ),
          ),

          Text(
            price,
            style: TextStyle(
              color: isIncome
                  ? Colors.blue
                  : Colors.redAccent
            ),
          ),
        ],
      ),
    );
  }
}