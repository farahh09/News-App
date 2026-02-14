class CategoryModel {
  String label;
  String image;
  String id;

  CategoryModel({required this.id, required this.label, required this.image});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: "general",
        label: "General",
        image: "assets/images/general_dark.png",
      ),
      CategoryModel(
        id: "business",
        label: "Business",
        image: "assets/images/business_dark.png",
      ),
      CategoryModel(
        id: "entertainment",
        label: "Entertainment",
        image: "assets/images/entertainment_dark.png",
      ),
      CategoryModel(
        id: "health",
        label: "Health",
        image: "assets/images/health_dark.png",
      ),
      CategoryModel(
        id: "sports",
        label: "Sports",
        image: "assets/images/sport_dark.png",
      ),
      CategoryModel(
        id: "technology",
        label: "Technology",
        image: "assets/images/technology_dark.png",
      ),
      CategoryModel(
        id: "science",
        label: "Science",
        image: "assets/images/science_dark.png",
      ),
    ];
  }
}