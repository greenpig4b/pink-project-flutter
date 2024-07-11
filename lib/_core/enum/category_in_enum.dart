enum CategoryInEnum {
  SALARY,
  SIDE_INCOME,
  ALLOWANCE,
  BONUS,
  FINANCIAL_INCOME,
  OTHER,
}

const Map<String, CategoryInEnum> categoryInMap = {
  '월급': CategoryInEnum.SALARY,
  '부수입': CategoryInEnum.SIDE_INCOME,
  '용돈': CategoryInEnum.ALLOWANCE,
  '상여': CategoryInEnum.BONUS,
  '금융소득': CategoryInEnum.FINANCIAL_INCOME,
  '기타': CategoryInEnum.OTHER,
};

CategoryInEnum? getCategoryInEnum(String text) {
  return categoryInMap[text];
}
