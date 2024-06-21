// material_notifier.dart

import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MaterialNotifier extends StateNotifier<List<MaterialModel>> {
  MaterialNotifier(List<MaterialModel> initialMaterials) : super(initialMaterials);

  void setMaterials(List<MaterialModel> materials) {
    state = materials;
  }

  void isSelectItem(int pid, int index) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(isSelected: !state[index].isSelected)
        else
          product,
    ];
  }

  void incrementQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(qty: product.qty + 1)
        else
          product,
    ];
  }

  void decreaseQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid && product.qty > 0)
          product.copyWith(qty: product.qty - 1)
        else
          product,
    ];
  }
}

final materialNotifierProvider = StateNotifierProvider<MaterialNotifier, List<MaterialModel>>((ref) {
  return MaterialNotifier([]);
});
