import 'package:flutter_ecommerce/model/product_model.dart';

class Balance {
  final int id;
  final String dateBalance;
  final int userIdOccurrence;
  final double mesure;
  final bool isActive;
  final MaterialModel material;

  Balance({
    required this.id,
    required this.dateBalance,
    required this.userIdOccurrence,
    required this.mesure,
    required this.isActive,
    required this.material,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      id: json['id'],
      dateBalance: json['date_balance'],
      userIdOccurrence: json['user_id_occurrence'],
      mesure: (json['mesure'] as num).toDouble(),
      isActive: json['is_active'],
      material: MaterialModel.fromJson(json['material']),
    );
  }
}
