// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_ecommerce/model/transaction_model_chart/transaction_data';
import 'package:flutter_ecommerce/providers/transaction_chart_api.dart';
import 'package:flutter_ecommerce/widgets/transaction_chart.dart';

class TransactionChartPage extends StatefulWidget {
  const TransactionChartPage({super.key});

  @override
  _TransactionChartPageState createState() => _TransactionChartPageState();
}

class _TransactionChartPageState extends State<TransactionChartPage> {
  final ApiService apiService = ApiService();
  late Future<List<TransactionData>> futureTransactions;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    futureTransactions = apiService.fetchTransactions();
  }

  void nextPage() {
    setState(() {
      currentPage++;
    });
  }

  void previousPage() {
    setState(() {
      if (currentPage > 0) currentPage--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gráfico de Transações')),
      body: FutureBuilder<List<TransactionData>>(
        future: futureTransactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar os dados'));
          } else if (snapshot.hasData) {
            List<TransactionData> transactions = snapshot.data!;
            // Limitando a dois materiais por página
            int itemsPerPage = 2;
            int totalPages = (transactions.length / itemsPerPage).ceil();
            int startIndex = currentPage * itemsPerPage;
            int endIndex = (startIndex + itemsPerPage) > transactions.length
                ? transactions.length
                : startIndex + itemsPerPage;

            return Column(
              children: [
                Expanded(
                  child: TransactionChart(
                      transactions: transactions.sublist(startIndex, endIndex)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: previousPage,
                      child: Text('Anterior'),
                    ),
                    Text('Página ${currentPage + 1} de $totalPages'),
                    ElevatedButton(
                      onPressed: nextPage,
                      child: Text('Próximo'),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Center(child: Text('Nenhum dado encontrado'));
          }
        },
      ),
    );
  }
}
