import 'package:ecoponto/pages/recycle_balance.dart';
import 'package:ecoponto/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';


class RecycleBalanceTile extends StatelessWidget {
  final RecycleBalanceModel recycleBalanceModel;
  const RecycleBalanceTile({Key? key, required this.recycleBalanceModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 0.02)),
      height: size.height,
      width: size.width,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ImageWidget(imageUrl: recycleBalanceModel.image!),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('\$ ${recycleBalanceModel.price!.toString()}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(recycleBalanceModel.name!,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}