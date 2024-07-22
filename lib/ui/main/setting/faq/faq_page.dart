import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/ui/main/setting/faq/faq_detail_page.dart';

import 'faq_page_view_model.dart';

class FaqPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FaqModel? model = ref.watch(FaqProvider);

    // model이 null인지 체크
    if (model == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: ListView.builder(
        itemCount: model.faqList.faqList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FaqDetailPage(model.faqList.faqList[index].id)));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${model.faqList.faqList[index].title}"),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
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
