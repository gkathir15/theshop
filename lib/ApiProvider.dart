import 'dart:convert';
import 'package:http/http.dart' show Client;

import 'Prods.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl =
      "https://g-sheet-shop.herokuapp.com/api?id=14RZSN4Wi0Rd6gReSdXT0g6uWW3aU2Ga_UVPZZPaiBGI&sheet=1";

  Future<Prods> fetchSheetData() async {
    final response = await client.get("$_baseUrl");
    print(response.body.toString());

    if (response.statusCode == 200) {
      return Prods.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}