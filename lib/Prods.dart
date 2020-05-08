import 'package:equatable/equatable.dart';

class Prods extends Equatable  {
  Columns columns;
  List<Rows> rows;

  Prods({this.columns, this.rows});

  Prods.fromJson(Map<String, dynamic> json) {
    columns =
    json['columns'] != null ? new Columns.fromJson(json['columns']) : null;
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.columns != null) {
      data['columns'] = this.columns.toJson();
    }
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Columns extends Equatable {
  List<String> product;
  List<int> price;
  List<String> imgurl;
  List<String> size;
  List<int> maxqty;
  List<int> qty;

  Columns(
      {this.product,
        this.price,
        this.imgurl,
        this.size,
        this.maxqty,
        this.qty});

  Columns.fromJson(Map<String, dynamic> json) {
    product = json['product'].cast<String>();
    price = json['price'].cast<int>();
    imgurl = json['imgurl'].cast<String>();
    size = json['size'].cast<String>();
    maxqty = json['maxqty'].cast<int>();
    qty = json['qty'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['price'] = this.price;
    data['imgurl'] = this.imgurl;
    data['size'] = this.size;
    data['maxqty'] = this.maxqty;
    data['qty'] = this.qty;
    return data;
  }
}

class Rows extends Equatable {
  String product;
  int price;
  String imgurl;
  String size;
  int maxqty;
  int qty;

  Rows(
      {this.product,
        this.price,
        this.imgurl,
        this.size,
        this.maxqty,
        this.qty});

  Rows.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    price = json['price'];
    imgurl = json['imgurl'];
    size = json['size'];
    maxqty = json['maxqty'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['price'] = this.price;
    data['imgurl'] = this.imgurl;
    data['size'] = this.size;
    data['maxqty'] = this.maxqty;
    data['qty'] = this.qty;
    return data;
  }
}
