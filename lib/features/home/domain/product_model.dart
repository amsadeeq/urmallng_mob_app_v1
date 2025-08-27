class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    this.isFavorite = false,
  });
}
