class NoticeDetail{
  final String? currentDateTime;
  final Notice? notice;

  NoticeDetail({
    this.currentDateTime,
    this.notice
});

  factory NoticeDetail.fromJson(Map<String, dynamic> json) {
    return NoticeDetail(
      currentDateTime: json["currentDateTime"] ?? "",
      notice: json["notice"] != null ? Notice.fromJson(json["notice"]) : null,
    );
  }
//
}

class Notice {
  final int? id;
  final String? title;
  final String? content;
  final String? username;
  final String? createdAt;

  Notice({
    this.id,
    this.title,
    this.content,
    this.username,
    this.createdAt
});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      username: json["username"],
      createdAt: json["createdAt"],
    );
  }
//
}