// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final double currentTotal;
  final double totalEarned;

  const ProfileCard({
    required this.currentTotal,
    required this.totalEarned,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Elevação para dar uma sombra ao card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumo dos Custos',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Total Atual: \$${currentTotal.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'Total Recebido: \$${totalEarned.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
