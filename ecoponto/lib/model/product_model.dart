// material_model.dart

class MaterialModel {
  final int pid;
  final String name;
  final String mesureUnity;
  final double price;
  bool isSelected;
  int qty;

  MaterialModel({
    required this.pid,
    required this.name,
    required this.mesureUnity,
    required this.price,
    this.isSelected = false,
    this.qty = 1,
  });

  MaterialModel copyWith({
    int? pid,
    String? name,
    String? mesureUnity,
    double? price,
    bool? isSelected,
    int? qty,
  }) {
    return MaterialModel(
      pid: pid ?? this.pid,
      name: name ?? this.name,
      mesureUnity: mesureUnity ?? this.mesureUnity,
      price: price ?? this.price,
      isSelected: isSelected ?? this.isSelected,
      qty: qty ?? this.qty,
    );
  }

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    return MaterialModel(
      pid: json['id'],
      name: json['name'],
      mesureUnity: json['mesure_unity'],
      price: json['price'].toDouble(),
    );
  }
}
