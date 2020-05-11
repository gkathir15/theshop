import 'package:rxdart/rxdart.dart';
import 'package:theshop/OrderReq.dart';

import 'OrderResp.dart';
import 'Prods.dart';
import 'Repo.dart';

class ProdBloc {
  Repo _repository = Repo();

  final _sheetFetcher = PublishSubject<Prods>();
  final orderResp = PublishSubject<OrderResp>();

  Observable<Prods> get prod => _sheetFetcher.stream;
  Observable<OrderResp> get orderRes => orderResp.stream;

  fetchnetworkData() async {
    Prods weatherResponse = await _repository.fetchSheetData();
    _sheetFetcher.sink.add(weatherResponse);
  }

  placeOrder(OrderReq or) async {
    OrderResp weatherResponse = await _repository.placeOrder(or);
    orderResp.sink.add(weatherResponse);
  }

  dispose() {
    _sheetFetcher.close();
    orderResp.close();
  }
}

final prodBloc = ProdBloc();