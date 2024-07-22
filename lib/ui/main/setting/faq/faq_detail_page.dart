import 'package:flutter/material.dart';

class FaqDetailPage extends StatelessWidget {
  const FaqDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("가계부 작성 방법",style: TextStyle(fontSize: 25)),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("관리자"),
                SizedBox(width: 20),
                Text("2024-01-15"),
              ],),
          ),
          const Divider(), // 각 아이템 하단에 선을 추가
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("가계부 작성은 \"가계부 작성\" 메뉴에서 가능합니다. 자세한 사항은 사용자 가이드를 참고하세요."),
          )
        ],
      ),
    );
  }
}
AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color(0xFFFC7C9A),
    elevation: 0.0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: const Text(
      "자주 묻는 질문",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: [
      const Padding(
        padding: EdgeInsets.only(right: 10.0),
      ),
    ],
  );
}