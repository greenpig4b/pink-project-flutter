import 'package:flutter/cupertino.dart';


class TransactionIncome{
  final String amount;
  final String category;
  final DateTime createdAt; // 날짜

  TransactionIncome({
    required this.amount,
    required this.category,
    required this.createdAt
  });

}

final List<TransactionIncome> TransactionIncomeList = [
  TransactionIncome(amount: "7,300", category: "용돈", createdAt: DateTime(2024, 7, 1)),
  TransactionIncome(amount: "200,500", category: "월급", createdAt: DateTime(2024, 7, 5)),
  TransactionIncome(amount: "1,000", category: "이자", createdAt: DateTime(2024, 7, 20)),
  TransactionIncome(amount: "5,000", category: "용돈", createdAt: DateTime(2024, 7, 3)),
  TransactionIncome(amount: "300,000", category: "보너스", createdAt: DateTime(2024, 7, 10)),
  TransactionIncome(amount: "50,000", category: "프리랜서", createdAt: DateTime(2024, 7, 15)),
  TransactionIncome(amount: "20,000", category: "투자수익", createdAt: DateTime(2024, 7, 18)),
  TransactionIncome(amount: "15,000", category: "용돈", createdAt: DateTime(2024, 7, 25)),
  TransactionIncome(amount: "400,000", category: "월급", createdAt: DateTime(2024, 7, 30)),
  TransactionIncome(amount: "10,000", category: "이자", createdAt: DateTime(2024, 7, 7)),
  TransactionIncome(amount: "50,000", category: "용돈", createdAt: DateTime(2024, 7, 8)),
  TransactionIncome(amount: "1,500", category: "이자", createdAt: DateTime(2024, 7, 9)),
  TransactionIncome(amount: "25,000", category: "프리랜서", createdAt: DateTime(2024, 7, 12)),
  TransactionIncome(amount: "5,000", category: "용돈", createdAt: DateTime(2024, 7, 13)),
  TransactionIncome(amount: "150,000", category: "보너스", createdAt: DateTime(2024, 7, 27)),
  TransactionIncome(amount: "10,000", category: "투자수익", createdAt: DateTime(2024, 7, 29)),
  TransactionIncome(amount: "75,000", category: "용돈", createdAt: DateTime(2024, 8, 1)),
  TransactionIncome(amount: "250,000", category: "월급", createdAt: DateTime(2024, 8, 5)),
  TransactionIncome(amount: "3,000", category: "이자", createdAt: DateTime(2024, 8, 8)),
  TransactionIncome(amount: "8,000", category: "용돈", createdAt: DateTime(2024, 8, 9)),
  TransactionIncome(amount: "100,000", category: "보너스", createdAt: DateTime(2024, 8, 11)),
  TransactionIncome(amount: "30,000", category: "프리랜서", createdAt: DateTime(2024, 8, 15)),
  TransactionIncome(amount: "45,000", category: "투자수익", createdAt: DateTime(2024, 8, 17)),
  TransactionIncome(amount: "60,000", category: "용돈", createdAt: DateTime(2024, 8, 20)),
  TransactionIncome(amount: "500,000", category: "월급", createdAt: DateTime(2024, 8, 25)),
  TransactionIncome(amount: "2,000", category: "이자", createdAt: DateTime(2024, 8, 28)),
  TransactionIncome(amount: "55,000", category: "프리랜서", createdAt: DateTime(2024, 8, 30)),
  TransactionIncome(amount: "10,000", category: "용돈", createdAt: DateTime(2024, 8, 2)),
  TransactionIncome(amount: "120,000", category: "보너스", createdAt: DateTime(2024, 8, 4)),
  TransactionIncome(amount: "40,000", category: "투자수익", createdAt: DateTime(2024, 8, 6)),
];

class TransactionOutGoing{
  final String amount;
  final String category;
  final DateTime createdAt; // 날짜

  TransactionOutGoing({
    required this.amount,
    required this.category,
    required this.createdAt
  });

}

final List<TransactionOutGoing> TransactionOutGoingList = [
  TransactionOutGoing(amount: "5,300", category: "전기요금", createdAt: DateTime(2024, 7, 5)),
  TransactionOutGoing(amount: "1,500", category: "합의금", createdAt: DateTime(2024, 7, 18)),
  TransactionOutGoing(amount: "100,500", category: "배달", createdAt: DateTime(2024, 7, 18)),
  TransactionOutGoing(amount: "3,000", category: "식비", createdAt: DateTime(2024, 7, 2)),
  TransactionOutGoing(amount: "12,000", category: "교통비", createdAt: DateTime(2024, 7, 4)),
  TransactionOutGoing(amount: "45,000", category: "쇼핑", createdAt: DateTime(2024, 7, 7)),
  TransactionOutGoing(amount: "7,500", category: "영화관", createdAt: DateTime(2024, 7, 9)),
  TransactionOutGoing(amount: "20,000", category: "외식", createdAt: DateTime(2024, 7, 10)),
  TransactionOutGoing(amount: "25,000", category: "건강관리", createdAt: DateTime(2024, 7, 11)),
  TransactionOutGoing(amount: "8,500", category: "커피", createdAt: DateTime(2024, 7, 12)),
  TransactionOutGoing(amount: "30,000", category: "운동", createdAt: DateTime(2024, 7, 13)),
  TransactionOutGoing(amount: "15,000", category: "여행", createdAt: DateTime(2024, 7, 14)),
  TransactionOutGoing(amount: "50,000", category: "쇼핑", createdAt: DateTime(2024, 7, 16)),
  TransactionOutGoing(amount: "6,000", category: "택시", createdAt: DateTime(2024, 7, 17)),
  TransactionOutGoing(amount: "80,000", category: "보험", createdAt: DateTime(2024, 7, 19)),
  TransactionOutGoing(amount: "15,500", category: "기타", createdAt: DateTime(2024, 7, 20)),
  TransactionOutGoing(amount: "5,000", category: "커피", createdAt: DateTime(2024, 7, 21)),
  TransactionOutGoing(amount: "18,000", category: "식비", createdAt: DateTime(2024, 7, 22)),
  TransactionOutGoing(amount: "90,000", category: "교육비", createdAt: DateTime(2024, 7, 23)),
  TransactionOutGoing(amount: "8,000", category: "교통비", createdAt: DateTime(2024, 7, 24)),
  TransactionOutGoing(amount: "5,500", category: "택시", createdAt: DateTime(2024, 7, 26)),
  TransactionOutGoing(amount: "100,000", category: "렌트", createdAt: DateTime(2024, 7, 27)),
  TransactionOutGoing(amount: "12,500", category: "식비", createdAt: DateTime(2024, 7, 28)),
  TransactionOutGoing(amount: "7,000", category: "영화관", createdAt: DateTime(2024, 7, 29)),
  TransactionOutGoing(amount: "22,000", category: "운동", createdAt: DateTime(2024, 7, 30)),
  TransactionOutGoing(amount: "14,000", category: "여행", createdAt: DateTime(2024, 8, 1)),
  TransactionOutGoing(amount: "35,000", category: "건강관리", createdAt: DateTime(2024, 8, 3)),
  TransactionOutGoing(amount: "40,000", category: "쇼핑", createdAt: DateTime(2024, 8, 5)),
  TransactionOutGoing(amount: "11,000", category: "교통비", createdAt: DateTime(2024, 8, 7)),
  TransactionOutGoing(amount: "3,500", category: "커피", createdAt: DateTime(2024, 8, 8)),
  TransactionOutGoing(amount: "2,000", category: "식비", createdAt: DateTime(2024, 8, 9)),
  TransactionOutGoing(amount: "7,000", category: "택시", createdAt: DateTime(2024, 8, 10)),
  TransactionOutGoing(amount: "5,000", category: "기타", createdAt: DateTime(2024, 8, 12)),
  TransactionOutGoing(amount: "60,000", category: "교육비", createdAt: DateTime(2024, 8, 14)),
  TransactionOutGoing(amount: "15,000", category: "렌트", createdAt: DateTime(2024, 8, 15)),
  TransactionOutGoing(amount: "18,500", category: "식비", createdAt: DateTime(2024, 8, 17)),
  TransactionOutGoing(amount: "13,000", category: "영화관", createdAt: DateTime(2024, 8, 18)),
  TransactionOutGoing(amount: "20,000", category: "운동", createdAt: DateTime(2024, 8, 20)),
];