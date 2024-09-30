import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/views/home_page.dart';
import 'package:flutter_ecommerce/views/welcome_page.dart';
import 'package:flutter_ecommerce/widgets/transactionlist.dart';
import 'package:flutter_ecommerce/widgets/transactiontile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransactionList(),
    ),
  ));
}
