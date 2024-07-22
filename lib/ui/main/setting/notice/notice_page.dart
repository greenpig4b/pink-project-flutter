import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/ui/main/setting/notice/notice_detail_page.dart';
import 'package:pinkpig_project_flutter/ui/main/setting/notice/notice_page_view_model.dart';

class NoticePage extends ConsumerWidget {
  NoticePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NoticeModel? model = ref.watch(NoticeProvider);

    // model이 null인지 체크
    if (model == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body:
      ListView.builder(
        itemCount: model.noticeList.noticeList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoticeDetailPage(model.noticeList.noticeList[index].id)));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${model.noticeList.noticeList[index].title}"),
                      Text("${model.noticeList.noticeList[index].createdAt}"),
                    ],
                  ),
                ),
                Divider(), // 각 아이템 하단에 선을 추가
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
      "공지사항",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 10.0),
      ),
    ],
  );
}
