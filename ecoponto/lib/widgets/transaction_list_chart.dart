import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/transaction_model/transaction.dart';

class MaterialBarChart extends StatelessWidget {
  final List<Transaction> transactions;

  MaterialBarChart({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barGroups: _buildBarGroups(),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: true),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (double value) {
              // Exibir o nome do material como label no eixo X
              return transactions[value.toInt()].balances.first.material.name;
            },
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return transactions.asMap().entries.map((entry) {
      int index = entry.key;
      Transaction transaction = entry.value;

      return BarChartGroupData(
        x: index,
        barRods: transaction.balances.map((balance) {
          return BarChartRodData(
            y: balance.mesure,
            colors: [Colors.blue],
          );
        }).toList(),
      );
    }).toList();
  }
}
