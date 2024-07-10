import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionDetail extends StatelessWidget {

  final category;
  final content;
  final property;
  final price;

  TransactionDetail({required this.category, required this.content, required this.property, required this.price});

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
          Text(price),
        ],
      ),
    );
  }
}