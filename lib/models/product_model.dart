class ProductModel {
  final String id;
  final String imageUrl;
  final String categoryName;
  final String productName;
  final double price;
  final String currency;
  final String shortDescription;
  final double discountPercentage;
  final String categoryId;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.categoryName,
    required this.productName,
    required this.price,
    required this.currency,
    required this.shortDescription,
    required this.discountPercentage,
    required this.categoryId,
  });
}
