import 'package:flutter/material.dart';

import 'history_category_button.dart';

class HistoryTypeSection extends StatelessWidget {
  const HistoryTypeSection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
       HistoryTypeButton(
          text: "수입",
          onTap: () {
          },
        ),
        HistoryTypeButton(
          text: "지출",
          onTap: () {
          },
        ),
      ],
    );
  }
}
