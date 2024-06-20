import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:ecoponto/pages/recycle_balance.dart';

class ApiProvider {
  final Dio _dio = Dio();
  static const recycleBalanceUrl = 'http://127.0.0.1:8000/materials/recycle_balance';
  String finalRecycleBalanceUrl = "";

  List<RecycleBalanceModel> _balance = [];

  Future<List<RecycleBalanceModel>> getRecycleBalanceItems(userID) async {
    try {
      finalRecycleBalanceUrl = '$recycleBalanceUrl?user_id_occurrence=$userID';
      print(finalRecycleBalanceUrl);
      Response response = await _dio.get(finalRecycleBalanceUrl);
      _balance.addAll(
          List.from(response.data).map((e) => RecycleBalanceModel.fromJson(e)));
      return _balance;
    } catch (e) {
      developer.log(e.toString());
      return [];
    }
  }
}
