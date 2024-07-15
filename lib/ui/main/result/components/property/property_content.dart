import 'package:flutter/material.dart';

class PropertyContent extends StatelessWidget {
  const PropertyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(8.0), // 모서리를 둥글게 설정
        ),
        padding: const EdgeInsets.all(16.0), // 내용물과 경계선 사이의 패딩
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("전월대비 지출 (당월/전월)"),
                Text("0%")
              ],
            ),
            SizedBox(height: 8.0), // Row 사이에 간격 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("지출 (현금,은행,카드)"),
                Text("0원"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
