class OrderReq {
  String name;
  String address;
  String phno;
  String landmark;
  List<String> items;
  String total;

  OrderReq(
      {this.name,
        this.address,
        this.phno,
        this.landmark,
        this.items,
        this.total});

  OrderReq.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phno = json['phno'];
    landmark = json['landmark'];
    items = json['items'].cast<String>();
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['phno'] = this.phno;
    data['landmark'] = this.landmark;
    data['items'] = this.items;
    data['total'] = this.total;
    return data;
  }
}
