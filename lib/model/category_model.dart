class ModelCategory {
  ModelCategory({
    required this.id,
    required this.name,
    required this.categoryType,
  });

  String id;
  String name;
  String categoryType;

  factory ModelCategory.fromJson(Map<String, dynamic> json) {
    return ModelCategory(
        id: json['_id'],
        name: json['name'],
        categoryType: json['categoryType']);
  }
}
