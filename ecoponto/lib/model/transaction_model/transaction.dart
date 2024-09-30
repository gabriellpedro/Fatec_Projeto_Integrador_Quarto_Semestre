import 'package:flutter_ecommerce/model/transaction_model/balance.dart';

class Transaction {
  final int id;
  final String createdAt;
  final int userId;
  final double total;
  final int operationType;
  final List<Balance> balances;

  Transaction({
    required this.id,
    required this.createdAt,
    required this.userId,
    required this.total,
    required this.operationType,
    required this.balances,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    var balancesJson = json['balances'] as List;
    List<Balance> balanceList = balancesJson.map((i) => Balance.fromJson(i)).toList();

    return Transaction(
      id: json['id'],
      createdAt: json['created_at'],
      userId: json['user_id'],
      total: (json['total'] as num).toDouble(),
      operationType: json['operation_type'],
      balances: balanceList,
    );
  }
}
