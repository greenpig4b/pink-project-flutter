class TransactionDetails{
  final id;
  final transactionType;
  final category;
  final description;
  final assets;
  final amount;

  TransactionDetails({
    required this.id,
    required this.transactionType,
    required this.category,
    required this.description,
    required this.assets,
    required this.amount
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return TransactionDetails(
      id: json["id"],
      transactionType: json["transactionType"],
      category: json["category"],
      description: json["description"],
      assets: json["assets"],
      amount: json["amount"],
    );
  }
//
}