import 'package:rxdart/rxdart.dart';

import 'Prods.dart';
import 'Repo.dart';

class ProdBloc {
  Repo _repository = Repo();

  final _sheetFetcher = PublishSubject<Prods>();

  Observable<Prods> get prod => _sheetFetcher.stream;

  fetchnetworkData() async {
    Prods weatherResponse = await _repository.fetchSheetData();
    _sheetFetcher.sink.add(weatherResponse);
  }

  dispose() {
    _sheetFetcher.close();
  }
}

final prodBloc = ProdBloc();