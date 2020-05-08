import 'ApiProvider.dart';
import 'Prods.dart';

class Repo {
  ApiProvider appApiProvider = ApiProvider();

  Future<Prods> fetchSheetData() => appApiProvider.fetchSheetData();
}