class MaterialModel {
  final int id;
  final String createdAt;
  final String lastUpdated;
  final double price;
  final String name;
  final String mesureUnity;
  final bool isActive;

  MaterialModel({
    required this.id,
    required this.createdAt,
    required this.lastUpdated,
    required this.price,
    required this.name,
    required this.mesureUnity,
    required this.isActive,
  });

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    return MaterialModel(
      id: json['id'],
      createdAt: json['created_at'],
      lastUpdated: json['last_updated'],
      price: (json['price'] as num).toDouble(),
      name: json['name'],
      mesureUnity: json['mesure_unity'],
      isActive: json['is_active'],
    );
  }
}
