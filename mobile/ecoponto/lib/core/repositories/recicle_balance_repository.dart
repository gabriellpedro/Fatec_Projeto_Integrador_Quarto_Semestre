import 'package:ecoponto/core/apis/balance_fetcher.dart';
import 'package:ecoponto/pages/recycle_balance.dart';

class RecycleBalanceRepository {
  final _apiProvider = ApiProvider();

  Future<List<RecycleBalanceModel>> getRecycleBalanceItems() async {
    return _apiProvider.getRecycleBalanceItems(3);
  }
}
