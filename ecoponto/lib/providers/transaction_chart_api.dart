import 'package:flutter_ecommerce/model/transaction_model_chart/transaction_data';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiService {
  final String apiUrl = 'http://127.0.0.1:8000/materials/recycle_balance/11/operations';

  Future<List<TransactionData>> fetchTransactions() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<TransactionData> transactions = parseTransactionData(data);
      return transactions;
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  List<TransactionData> parseTransactionData(List<dynamic> data) {
    List<TransactionData> transactions = [];

    for (var transaction in data) {
      for (var balance in transaction['balances']) {
        transactions.add(TransactionData.fromJson(balance));
      }
    }

    return transactions;
  }
}
