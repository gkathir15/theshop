import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'OrderResp.dart';

import 'OrderReq.dart';
import 'Prods.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl =
      "https://g-sheet-shop.herokuapp.com/api?id=14RZSN4Wi0Rd6gReSdXT0g6uWW3aU2Ga_UVPZZPaiBGI&sheet=1";
  final orderURl = "https://avadi-orders.herokuapp.com/api/placeOrder";

  Future<Prods> fetchSheetData() async {
    final response = await client.get("$_baseUrl");
    print(response.body.toString());

    if (response.statusCode == 200) {
      return Prods.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<OrderResp> placeOrder(OrderReq orderReq) async{
    Map<String,String> header = {'Content-Type':'application/json'};
    print(orderReq.toJson().toString());
    final resp = await client.post(orderURl,headers:header,body: json.encode(orderReq.toJson()).toString());

    if (resp.statusCode == 200) {
      print(resp.body);
      return OrderResp.fromJson(json.decode(resp.body));
    } else {
      print(resp.body);
      throw Exception('Failed to load weather');
    }
  }



}