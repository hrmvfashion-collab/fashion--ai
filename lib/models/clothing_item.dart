class ClothingItem {
  final int? id;
  final String imagePath;
  final String category;
  final String color;

  ClothingItem({
    this.id,
    required this.imagePath,
    required this.category,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'category': category,
      'color': color,
    };
  }
}
