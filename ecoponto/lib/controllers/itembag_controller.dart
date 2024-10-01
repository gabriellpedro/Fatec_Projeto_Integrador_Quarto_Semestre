import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_ecommerce/providers/balance_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemBagNotifier extends StateNotifier<List<MaterialModel>> {
  ItemBagNotifier(List<MaterialModel> initialMaterials)
      : super(initialMaterials);

  void setMaterials(List<MaterialModel> materials) {
    state = materials;
  }

  void addNewItemBag(MaterialModel materialModel) {
    state = [...state, materialModel];
  }

  // Remove item

  void removeItem(int pid) {
    state = [
      for (final product in state)
        if (product.pid != pid) product,
    ];
  }
}

final itemBagProvider =
    StateNotifierProvider<ItemBagNotifier, List<MaterialModel>>((ref) {
  return ItemBagNotifier([]);
});

final priceCalcProvider = Provider<double>((ref) {
  final asyncValue = ref.watch(balanceProvider);

  final materials = asyncValue.when<List<MaterialModel>>(
    data: (materials) => materials,
    loading: () => [],
    error: (error, stackTrace) => [],
  );

  double sum = 0;

  for (var element in materials) {
    print(element.name);
    sum += element.price;
    }

  // print('teste + $sum');
  return sum;
});
