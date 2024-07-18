class MonthlyFinancialReport {
  final int userId;
  final String year;
  final String month;
  final String monthlyIncome;
  final String monthlyExpense;
  final String monthlyTotalAmount;
  final String startYearMonthDate;
  final String endYearMonthDate;
  final MonthlyExpenseSummary monthlyExpenseSummary;
  final MonthlyIncomeSummary monthlyIncomeSummary;

  MonthlyFinancialReport({
    required this.userId,
    required this.year,
    required this.month,
    required this.monthlyIncome,
    required this.monthlyExpense,
    required this.monthlyTotalAmount,
    required this.startYearMonthDate,
    required this.endYearMonthDate,
    required this.monthlyExpenseSummary,
    required this.monthlyIncomeSummary,
  });

  factory MonthlyFinancialReport.fromJson(Map<String, dynamic> json) {
    return MonthlyFinancialReport(
      userId: json['userId'],
      year: json['year'],
      month: json['month'],
      monthlyIncome: json['monthlyIncome'],
      monthlyExpense: json['monthlyExpense'],
      monthlyTotalAmount: json['monthlyTotalAmount'],
      startYearMonthDate: json['startYearMonthDate'],
      endYearMonthDate: json['endYearMonthDate'],
      monthlyExpenseSummary: MonthlyExpenseSummary.fromJson(json['monthlyExpenseSummary']),
      monthlyIncomeSummary: MonthlyIncomeSummary.fromJson(json['monthlyIncomeSummary']),
    );
  }

  @override
  String toString() {
    return 'MonthlyFinancialReport(userId: $userId, year: $year, month: $month, monthlyIncome: $monthlyIncome, monthlyExpense: $monthlyExpense, monthlyTotalAmount: $monthlyTotalAmount, startYearMonthDate: $startYearMonthDate, endYearMonthDate: $endYearMonthDate, monthlyExpenseSummary: $monthlyExpenseSummary, monthlyIncomeSummary: $monthlyIncomeSummary)';
  }
}

class MonthlyExpenseSummary {
  final String previousMonthExpenseComparison;
  final String totalMonthlyExpense;
  final String monthlyCardExpense;
  final String monthlyCashExpense;
  final String monthlyBankExpense;

  MonthlyExpenseSummary({
    required this.previousMonthExpenseComparison,
    required this.totalMonthlyExpense,
    required this.monthlyCardExpense,
    required this.monthlyCashExpense,
    required this.monthlyBankExpense,
  });

  factory MonthlyExpenseSummary.fromJson(Map<String, dynamic> json) {
    return MonthlyExpenseSummary(
      previousMonthExpenseComparison: json['previousMonthExpenseComparison'],
      totalMonthlyExpense: json['totalMonthlyExpense'],
      monthlyCardExpense: json['monthlyCardExpense'],
      monthlyCashExpense: json['monthlyCashExpense'],
      monthlyBankExpense: json['monthlyBankExpense'],
    );
  }

  @override
  String toString() {
    return 'MonthlyExpenseSummary(previousMonthExpenseComparison: $previousMonthExpenseComparison, totalMonthlyExpense: $totalMonthlyExpense, monthlyCardExpense: $monthlyCardExpense, monthlyCashExpense: $monthlyCashExpense, monthlyBankExpense: $monthlyBankExpense)';
  }
}

class MonthlyIncomeSummary {
  final String previousMonthIncomeComparison;
  final String totalMonthlyIncome;
  final String monthlyCardIncome;
  final String monthlyCashIncome;
  final String monthlyBankIncome;

  MonthlyIncomeSummary({
    required this.previousMonthIncomeComparison,
    required this.totalMonthlyIncome,
    required this.monthlyCardIncome,
    required this.monthlyCashIncome,
    required this.monthlyBankIncome,
  });

  factory MonthlyIncomeSummary.fromJson(Map<String, dynamic> json) {
    return MonthlyIncomeSummary(
      previousMonthIncomeComparison: json['previousMonthIncomeComparison'],
      totalMonthlyIncome: json['totalMonthlyIncome'],
      monthlyCardIncome: json['monthlyCardIncome'],
      monthlyCashIncome: json['monthlyCashIncome'],
      monthlyBankIncome: json['monthlyBankIncome'],
    );
  }

  @override
  String toString() {
    return 'MonthlyIncomeSummary(previousMonthIncomeComparison: $previousMonthIncomeComparison, totalMonthlyIncome: $totalMonthlyIncome, monthlyCardIncome: $monthlyCardIncome, monthlyCashIncome: $monthlyCashIncome, monthlyBankIncome: $monthlyBankIncome)';
  }
}
