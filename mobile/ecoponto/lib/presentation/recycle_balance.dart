import 'package:ecoponto/core/bloc/recycle_balance/recycle_balance_bloc.dart';
import 'package:ecoponto/presentation/widgets/recicle_balance_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecycleBalance extends StatefulWidget {
  const RecycleBalance({Key? key}) : super(key: key);

  @override
  State<RecycleBalance> createState() => _RecycleBalanceState();
}

class _RecycleBalanceState extends State<RecycleBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Home'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildRecycleBalance(),
      ),
    );
  }

  Widget _buildRecycleBalance() {
    return BlocBuilder<RecycleBalanceBloc, RecycleBalanceState>(
      builder: (context, state) {
        if (state is RecycleBalanceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecycleBalanceLoaded) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: state.recycleBalanceModel.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final data = state.recycleBalanceModel[index];
                return RecycleBalanceTile(recycleBalanceModel: data);
              });
        }
        return const Center(child: Text('items loading hopefully :)'));
      },
    );
  }
}