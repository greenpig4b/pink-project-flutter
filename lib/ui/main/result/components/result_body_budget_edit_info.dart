import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_body_budget_app_bar.dart';

class ResultBodyBudgetEditInfo extends StatelessWidget {
  const ResultBodyBudgetEditInfo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1), // 검정색 테두리 설정
            ),
            child: Center(
              child: Icon(Icons.edit_note, size: 30, color: Colors.black),
            ),
          ),
          SizedBox(width: 20),
          Text(
            "추가된 예산은",
            style: TextStyle(color: Colors.black45),
          ),
          SizedBox(width: 5),
          Text(
            "결산탭",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(width: 5),
          Text(
            "에서 확인하실 수 있습니다.",
            style: TextStyle(color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
