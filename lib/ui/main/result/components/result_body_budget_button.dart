import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_body_budget_edit.dart';

class ResultBodyBudgetButton extends StatelessWidget {
  const ResultBodyBudgetButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 25.0, right: 10),
      child: Row(
        children: [
          Row(
            children: [
              Icon(Icons.edit_note, size: 30),
              Text("예산", style: TextStyle(fontSize: 20)),
            ],
          ),
          Expanded(
            // Expanded 추가
            child: Align(
              alignment: Alignment.centerRight, // 오른쪽 정렬
              child: TextButton(
                onPressed: () {
                  // Navigator를 통해 새로운 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultBodyBudgetEdit(), // ResultBodyBudgetEdit 페이지로 이동
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
                  children: [
                    Text(
                      "예산설정",
                      style: TextStyle(color: Colors.black45),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Icon(Icons.arrow_forward_ios,
                          size: 15.0, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
