class Memo {
  final String title;
  final String content;
  final DateTime createdDate;


  Memo({
    required this.title,
    required this.content,
    required this.createdDate
  });
}
final List<Memo> newMemoList = [
  Memo(title: "새해 목표 설정하기", content: "운동 열심히 하기", createdDate: DateTime.parse('2024-01-03')),
  Memo(title: "집안일", content: "냉장고 청소하기", createdDate: DateTime.parse('2024-01-08')),
  Memo(title: "친구들 만남", content: "주말에 친구들과 만나기", createdDate: DateTime.parse('2024-01-12')),

  Memo(title: "설날 준비", content: "가족 선물 사기", createdDate: DateTime.parse('2024-02-01')),
  Memo(title: "여가 활동", content: "주말에 산책 가기", createdDate: DateTime.parse('2024-02-07')),

  Memo(title: "식물 가꾸기", content: "화분에 물 주기", createdDate: DateTime.parse('2024-03-15')),

  Memo(title: "여행 준비", content: "해외여행 준비물 리스트 작성", createdDate: DateTime.parse('2024-05-28')),

  Memo(title: "에어컨 청소", content: "에어컨 청소", createdDate: DateTime.parse('2024-06-13')),
  Memo(title: "바베큐 파티", content: "주말 바베큐 파티 계획", createdDate: DateTime.parse('2024-06-19')),
  Memo(title: "도서관 방문", content: "도서관 가기: 책 대출", createdDate: DateTime.parse('2024-06-25')),

  Memo(title: "휴가 계획", content: "여름휴가 계획 세우기", createdDate: DateTime.parse('2024-07-01')),
  Memo(title: "가족 여행", content: "가족과 바다 여행", createdDate: DateTime.parse('2024-07-05')),
  ];
