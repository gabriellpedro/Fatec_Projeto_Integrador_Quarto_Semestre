import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/transaction_model/transaction.dart';
import 'package:http/http.dart' as http;

Future<List<Transaction>> fetchTransactions() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/materials/recycle_balance/3/operations'));

  if (response.statusCode == 200) {
    List<dynamic> transactionsJson = jsonDecode(response.body);
    return transactionsJson.map((t) => Transaction.fromJson(t)).toList();
  } else {
    throw Exception('Failed to load transactions');
  }
}
