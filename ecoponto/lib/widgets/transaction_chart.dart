import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/transaction_model_chart/transaction_data';

class TransactionChart extends StatelessWidget {
  final List<TransactionData> transactions;

  const TransactionChart({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: (transactions.length * (20 + 250)), // Largura total do gráfico
        child: BarChart(
          BarChartData(
            barGroups: _buildBarGroups(),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    final int index = value.toInt();
                    if (index < transactions.length) {
                      return Text(transactions[index].material);
                    }
                    return Text('');
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    const double barWidth = 20; // Largura da barra
    const double spaceBetweenBars = 10; // Espaço entre as barras
    return List.generate(transactions.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: transactions[index].quantity, // Quantidade no eixo Y
            width: barWidth,
            color: Colors.blue, // Cor das barras
          ),
        ],
      );
    });
  }
}
