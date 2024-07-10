class DailyRecordDTO {
  final String date;
  final String dailyIncome;
  final String dailyExpense;
  final String dailyTotalAmount;
  List<DailyTransactionDetailDTO> dailyTransactionDetailDTO;

  DailyRecordDTO(
      this.date,
      this.dailyIncome,
      this.dailyExpense,
      this.dailyTotalAmount,
      this.dailyTransactionDetailDTO,
      );

  factory DailyRecordDTO.fromJson(Map<String, dynamic> json) {
    var list = json['dailyTransactionDetailDTO'] as List;
    List<DailyTransactionDetailDTO> detailList =
    list.map((i) => DailyTransactionDetailDTO.fromJson(i)).toList();

    return DailyRecordDTO(
      json['date'],
      json['dailyIncome'],
      json['dailyExpense'],
      json['dailyTotalAmount'],
      detailList,
    );
  }
}

class DailyTransactionDetailDTO {
  final int id ;
  final String transactionType;
  final String categoryIn;
  final String categoryOut;
  final String description;
  final String time;
  final String assets;
  final String amount;

  DailyTransactionDetailDTO(
      this.id,
      this.transactionType,
      this.categoryIn,
      this.categoryOut,
      this.description,
      this.time,
      this.assets,
      this.amount,
      );

  factory DailyTransactionDetailDTO.fromJson(Map<String, dynamic> json) {
    return DailyTransactionDetailDTO(
      json['id'],
      json['transactionType'],
      json['categoryIn'],
      json['categoryOut'],
      json['description'],
      json['time'],
      json['assets'],
      json['amount']
    );
  }
}
