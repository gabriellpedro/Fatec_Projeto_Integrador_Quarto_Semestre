// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/model/transaction_model/transaction.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID Transação: ${transaction.id}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Total: ${transaction.total.toStringAsFixed(2)}',
            ),
            Text(
              'Operação: ${transaction.operationType}',
            ),
            SizedBox(height: 10),
            Text('Balanços:'),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transaction.balances.length,
              itemBuilder: (context, balanceIndex) {
                final balance = transaction.balances[balanceIndex];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Material: ${balance.material.name}, Medida: ${balance.mesure}, Preço: ${balance.material.price}',
                    style: TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
