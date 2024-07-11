enum AssetsEnum {
  CASH,
  BANK,
  CARD,
}

const Map<String, AssetsEnum> assetsMap = {
  '현금': AssetsEnum.CASH,
  '은행': AssetsEnum.BANK,
  '카드': AssetsEnum.CARD,
};

AssetsEnum? getAssetsEnum(String text) {
  return assetsMap[text];
}
