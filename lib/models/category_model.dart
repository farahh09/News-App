class CategoryModel {
  String label;
  String lightImage;
  String darkImage;
  String id;

  CategoryModel({
    required this.id,
    required this.label,
    required this.lightImage,
    required this.darkImage,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: "general",
        label: "General",
        lightImage: "assets/images/general_dark.png",
        darkImage: "assets/images/general.png",
      ),
      CategoryModel(
        id: "business",
        label: "Business",
        lightImage: "assets/images/business_dark.png",
        darkImage: "assets/images/business.png",
      ),
      CategoryModel(
        id: "entertainment",
        label: "Entertainment",
        lightImage: "assets/images/entertainment_dark.png",
        darkImage: "assets/images/entertainment.png",
      ),
      CategoryModel(
        id: "health",
        label: "Health",
        lightImage: "assets/images/health_dark.png",
        darkImage: "assets/images/health.png",
      ),
      CategoryModel(
        id: "sports",
        label: "Sports",
        lightImage: "assets/images/sport_dark.png",
        darkImage: "assets/images/sport.png",
      ),
      CategoryModel(
        id: "technology",
        label: "Technology",
        lightImage: "assets/images/technology_dark.png",
        darkImage: "assets/images/technology.png",
      ),
      CategoryModel(
        id: "science",
        label: "Science",
        lightImage: "assets/images/science_dark.png",
        darkImage: "assets/images/science.png",
      ),
    ];
  }
}