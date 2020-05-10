class Prods {
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

class Columns {
  List<String> product;
  List<int> price;
  List<String> imgurl;
  List<String> size;
  List<int> maxqty;
  List<int> qty;
  List<int> amt;

  Columns(
      {this.product,
        this.price,
        this.imgurl,
        this.size,
        this.maxqty,
        this.qty,
        this.amt});

  Columns.fromJson(Map<String, dynamic> json) {
    product = json['product'].cast<String>();
    price = json['price'].cast<int>();
    imgurl = json['imgurl'].cast<String>();
    size = json['size'].cast<String>();
    maxqty = json['maxqty'].cast<int>();
    qty = json['qty'].cast<int>();
    amt = json['amt'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['price'] = this.price;
    data['imgurl'] = this.imgurl;
    data['size'] = this.size;
    data['maxqty'] = this.maxqty;
    data['qty'] = this.qty;
    data['amt'] = this.amt;
    return data;
  }
}

class Rows {
  String product;
  int price;
  String imgurl;
  String size;
  int maxqty;
  int qty;
  int amt;

  Rows(
      {this.product,
        this.price,
        this.imgurl,
        this.size,
        this.maxqty,
        this.qty,
        this.amt});

  Rows.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    price = json['price'];
    imgurl = json['imgurl'];
    size = json['size'];
    maxqty = json['maxqty'];
    qty = json['qty'];
    amt = json['amt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['price'] = this.price;
    data['imgurl'] = this.imgurl;
    data['size'] = this.size;
    data['maxqty'] = this.maxqty;
    data['qty'] = this.qty;
    data['amt'] = this.amt;
    return data;
  }
}
