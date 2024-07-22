class NoticeList{
  final List<Notices> noticeList;

  NoticeList({
    required this.noticeList
});

  factory NoticeList.fromJson(Map<String, dynamic> json) {
    List<dynamic> noticeListJson = json["notices"] ?? [];
    List<Notices> newNoticeListJson = noticeListJson.map((e) => Notices.fromJson(e)).toList();

    return NoticeList(
      noticeList: newNoticeListJson
    );
  }
//
}

class Notices {
  final int? id;
  final String? title;
  final String? content;
  final String? username;
  final String? createdAt;

  Notices({
    this.id,
    this.title,
    this.content,
    this.username,
    this.createdAt
});

  factory Notices.fromJson(Map<String, dynamic> json) {
    return Notices(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      content: json["content"] ?? "",
      username: json["username"] ?? "",
      createdAt: json["createdAt"] ?? "",
    );
  }
//
}