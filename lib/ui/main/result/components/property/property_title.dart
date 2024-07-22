import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../viewmodel/result_list_view_model.dart';

class PropertyTitle extends StatelessWidget {
  final ResultListModel? model;

  const PropertyTitle({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // Row 내 아이템들 사이에 여백 추가
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                FontAwesomeIcons.coins,
                size: 25,
              ),
              SizedBox(width: 8), // 아이콘과 텍스트 사이에 여백 추가
              Text(
                "자산",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    '${model?.monthlyFinancialReport?.startYearMonthDate}~${model?.monthlyFinancialReport?.endYearMonthDate}'), // 날짜 범위 텍스트 추가
              ],
            ),
          ),
        ],
      ),
    );
  }
}
