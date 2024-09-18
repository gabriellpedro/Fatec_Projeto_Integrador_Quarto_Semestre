class UserOperationModel {
  final double currentTotal;
  final double totalEarned;

  UserOperationModel({
    required this.currentTotal,
    required this.totalEarned,
  });

  UserOperationModel copyWith({
    double? currentTotal,
    double? totalEarned,
  }) {
    return UserOperationModel(
      currentTotal: currentTotal ?? this.currentTotal,
      totalEarned: totalEarned ?? this.totalEarned,
    );
  }

  factory UserOperationModel.fromJson(Map<String, dynamic> json) {
    return UserOperationModel(
      currentTotal: json['current_total'],
      totalEarned: json['total_earned'],
    );
  }
}
