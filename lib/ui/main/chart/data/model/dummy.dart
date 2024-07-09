class FoodDetail {
  String title;
  double calories;
  String? imagePath;
  double carbs;
  double protein;
  double fats;

  FoodDetail({
    required this.title,
    required this.calories,
    this.imagePath,
    required this.carbs,
    required this.protein,
    required this.fats,
  });
}

final List<FoodDetail> foodList = [
  FoodDetail(title: "바나나", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "사과", calories: 95.0, carbs: 25.0, protein: 1.3, fats: 0.2),
  FoodDetail(title: "샌드위치", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "오렌지", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "포도", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "호밀빵", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "파스타", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "버거", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "비빔밥", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "우유", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "불고기", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
  FoodDetail(title: "흰쌀밥", calories: 105.0, carbs: 27.0, protein: 1.3, fats: 0.3),
];