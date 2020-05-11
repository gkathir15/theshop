import 'package:theshop/OrderReq.dart';
import 'package:theshop/OrderResp.dart';

import 'ApiProvider.dart';
import 'Prods.dart';

class Repo {
  ApiProvider appApiProvider = ApiProvider();

  Future<Prods> fetchSheetData() => appApiProvider.fetchSheetData();

  Future<OrderResp> placeOrder(OrderReq orderReq) => appApiProvider.placeOrder(orderReq);
}