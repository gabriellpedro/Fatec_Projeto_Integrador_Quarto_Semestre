import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/itembag_controller.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/themes.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(materialNotifierProvider);
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2),
        ],
      ),
      margin: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              color: kLightBackground,
              child: Image.asset("general/generic_product.png"),
            ),
          ),
          const Gap(4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product[productIndex].name,
                style: AppTheme.kCardTitle,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                product[productIndex].name,
                style: AppTheme.kBodyText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product[productIndex].price}',
                    style: AppTheme.kCardTitle,
                  ),
                  IconButton(
                      onPressed: () {
                        ref
                            .read(materialNotifierProvider.notifier)
                            .isSelectItem(
                                product[productIndex].pid, productIndex);
                        if (product[productIndex].isSelected == false) {
                          ref
                              .read(itemBagProvider.notifier)
                              .addNewItemBag(MaterialModel(
                                pid: product[productIndex].pid,
                                name: product[productIndex].name,
                                price: product[productIndex].price,
                                mesureUnity: product[productIndex].mesureUnity,
                              ));
                        } else {
                          ref
                              .read(itemBagProvider.notifier)
                              .removeItem(product[productIndex].pid);
                        }
                      },
                      icon: Icon(
                        product[productIndex].isSelected
                            ? Icons.check_circle
                            : Icons.add_circle,
                        size: 30,
                      ))
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
