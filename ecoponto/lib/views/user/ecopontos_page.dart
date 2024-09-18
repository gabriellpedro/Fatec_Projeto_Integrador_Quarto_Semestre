// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/providers/ecoponto_api.dart';
import 'package:flutter_ecommerce/widgets/card_ecoponto_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EcoPontoLocation extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ecopontoAsyncValue = ref.watch(ecopontoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locais de EcoPontos'),
      ),
      body: ecopontoAsyncValue.when(
        data: (ecopontos) => ListView.builder(
          itemCount: ecopontos.length,
          itemBuilder: (context, index) {
            final ecoponto = ecopontos[index];
            return CardConstructor(
              double.infinity,
              200,
              true,
              'imageURL',
              Colors.lime,
              ecoponto,
            );
          },
        ),
        error: (error, stackTrace) => Center(
          child: Text('Failed to load EcoPonto locations: $error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
