enum TransactionType {
  income('수입'),
  expense('지출');

  final String korean;

  const TransactionType(this.korean);

  String getKorean() {
    return korean;
  }
}
