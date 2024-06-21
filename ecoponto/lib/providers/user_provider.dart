import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = Provider<User>((ref) {
  return User(
    id: '1',
    name: 'John Doe',
    email: 'john.doe@example.com',
    avatarUrl: 'https://example.com/avatar.jpg',
  );
});

final transactionsProvider = Provider<List<Transaction>>((ref) {
  return [
    Transaction(
      id: '1',
      description: 'Grocery Shopping',
      amount: -50.0,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: '2',
      description: 'Salary',
      amount: 1500.0,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: '3',
      description: 'Gym Membership',
      amount: -40.0,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
  ];
});
