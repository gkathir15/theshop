class OrderResp {
  bool ok;
  String message;
  Data data;

  OrderResp({this.ok, this.message, this.data});

  OrderResp.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<String> items;
  int createdDate;
  bool isDelivered;
  bool isDispatched;
  String sId;
  String name;
  String address;
  String phno;
  String landmark;
  String total;
  int iV;

  Data(
      {this.items,
        this.createdDate,
        this.isDelivered,
        this.isDispatched,
        this.sId,
        this.name,
        this.address,
        this.phno,
        this.landmark,
        this.total,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    items = json['items'].cast<String>();
    createdDate = json['createdDate'];
    isDelivered = json['isDelivered'];
    isDispatched = json['isDispatched'];
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    phno = json['phno'];
    landmark = json['landmark'];
    total = json['total'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = this.items;
    data['createdDate'] = this.createdDate;
    data['isDelivered'] = this.isDelivered;
    data['isDispatched'] = this.isDispatched;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phno'] = this.phno;
    data['landmark'] = this.landmark;
    data['total'] = this.total;
    data['__v'] = this.iV;
    return data;
  }
}
