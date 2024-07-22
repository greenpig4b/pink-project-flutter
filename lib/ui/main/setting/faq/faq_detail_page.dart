import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'faq_detail_page_view_model.dart';

class FaqDetailPage extends ConsumerWidget {

  final id;
  FaqDetailPage(this.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FaqDetailModel? model = ref.watch(FaqDetailProvider(id));

    // model이 null인지 체크
    if (model == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("${model?.faqDetail.faq?.title}",style: TextStyle(fontSize: 25)),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("관리자"),
                SizedBox(width: 20),
                Text("${model?.faqDetail.faq?.createdAt}"),
              ],),
          ),
          const Divider(), // 각 아이템 하단에 선을 추가
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${model?.faqDetail.faq?.content}"),
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