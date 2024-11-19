// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/providers/transaction_list_api.dart';
import 'package:flutter_ecommerce/views/ajude_o_planeta_page.dart';
import 'package:flutter_ecommerce/views/home_page.dart';
import 'package:flutter_ecommerce/views/saldo_page.dart';
import 'package:flutter_ecommerce/views/welcome_page.dart';
import 'package:flutter_ecommerce/widgets/transaction_chart.dart';
import 'package:flutter_ecommerce/widgets/transaction_chart_widget.dart';
import 'package:flutter_ecommerce/widgets/transaction_list_widget.dart';
import 'package:flutter_ecommerce/widgets/transaction_tile_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SaldoPage(),
      ),
    ),
  );
}
