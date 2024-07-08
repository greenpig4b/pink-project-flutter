import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  final List<Map<String, String>> items;

  const HistoryList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(item["category"]!),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item["description"]!),
                    Row(
                      children: [
                        Text(item["time"]!),
                        SizedBox(width: 10),
                        Text(item["pay"]!)
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  item["amount"]!,
                  style: const TextStyle(color: Colors.red),
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
