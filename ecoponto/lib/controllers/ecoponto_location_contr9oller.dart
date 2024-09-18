import 'package:flutter_ecommerce/model/ecoponto_model.dart';
import 'package:flutter_ecommerce/providers/material_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EcoPontoLocationNotifier extends StateNotifier<List<EcopontoModel>> {
  EcoPontoLocationNotifier(super.initialEcoPontos);

  void setEcoPontos(List<EcopontoModel> ecopontos) {
    state = ecopontos;
  }
}

final ecoPontoLocationNotifierProvider =
    StateNotifierProvider<EcoPontoLocationNotifier, List<EcopontoModel>>((ref) {
  return EcoPontoLocationNotifier([]);
});
