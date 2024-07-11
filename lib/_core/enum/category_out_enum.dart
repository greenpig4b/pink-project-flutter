enum CategoryOutEnum {
  FOOD,
  TRANSPORTATION,
  CULTURE,
  MART,
  FASHION,
  HOUSEHOLD,
  HOUSING,
  HEALTH,
  EDUCATION,
  EVENTS,
  PARENTS,
  OTHER,
}

const Map<String, CategoryOutEnum> categoryOutMap = {
  '식비': CategoryOutEnum.FOOD,
  '교통/차량': CategoryOutEnum.TRANSPORTATION,
  '문화생활': CategoryOutEnum.CULTURE,
  '마트/편의점': CategoryOutEnum.MART,
  '패션/미용': CategoryOutEnum.FASHION,
  '생활용품': CategoryOutEnum.HOUSEHOLD,
  '주거/통신': CategoryOutEnum.HOUSING,
  '건강': CategoryOutEnum.HEALTH,
  '교육': CategoryOutEnum.EDUCATION,
  '경조사/회비': CategoryOutEnum.EVENTS,
  '부모님': CategoryOutEnum.PARENTS,
  '기타': CategoryOutEnum.OTHER,
};

CategoryOutEnum? getCategoryOutEnum(String text) {
  return categoryOutMap[text];
}
