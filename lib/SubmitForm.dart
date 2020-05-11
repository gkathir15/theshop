import 'package:flutter/material.dart';
import 'package:theshop/Constants.dart';
import 'package:theshop/OrderReq.dart';
import 'package:theshop/ProdBloc.dart';
import 'package:theshop/Repo.dart';
import 'OrderResp.dart';
import 'UserModel.dart';
import 'package:url_launcher/url_launcher.dart';

class SubmitForm extends StatefulWidget {

  final String OrderObj;
  final String total;


  SubmitForm(this.OrderObj, this.total);

  @override
  _SubmitFormState createState() => _SubmitFormState(OrderObj,total);
}

class _SubmitFormState extends State {
  final String OrderObj;
  final String total;

  _SubmitFormState(this.OrderObj, this.total);

  final _formKey = GlobalKey<FormState>();
  final _user = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Place Order')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                              child: Text("Placing an order for ₹ $total",textScaleFactor:1,style: TextStyle(fontSize: 20.0,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w500,),),
                            ),
                            Text("Delivery is subject to Product availablity & Home delivery available only in Avadi, Other nearby locations are subject to Delivery charges."),

                            TextFormField(
                              initialValue: _user.firstName,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'Name',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.firstName = val),
                            ),
                            TextFormField(
                                initialValue: _user.phone,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(labelText: 'Ph No'),
                                validator: (value) {
                                  if (value.isEmpty&&value.length==10) {
                                    return 'Please enter your phone No.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.phone = val)),
                            TextFormField(
                                initialValue: _user.address,
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Address',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Address.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.address = val)),
                            TextFormField(
                                initialValue: _user.Landmark,
                                keyboardType: TextInputType.multiline,
                                decoration:
                                    InputDecoration(labelText: 'landmark'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a landmark.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.Landmark = val)),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: RaisedButton(
                                    onPressed: () {
                                    final form = _formKey.currentState;
                                    if (form.validate()) {
                                      form.save();
                                      _user.save();
                                      _showMaterialDialog(_user,total,OrderObj);
                                    }
                                    },
                                    child: Text('Save'))),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("OR"),
                            ),

                            InkWell(child: Padding(
                              padding: const EdgeInsets.only(top: 8,),
                              child: Text("Call us at 6385147969 to place an order",style: TextStyle(fontSize: 20.0,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w500,),),
                            ),onTap: (){ _makePhoneCall('tel:6385147969');

                            },),
                          ]),
                    )))));
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Placing Order'))

    );
  }

  _showMaterialDialog(UserModel user, String total, String orderObj) {
    Repo().placeOrder(OrderReq(name: user.firstName,
    address: user.address,
    phno: user.phone,
    landmark: user.Landmark,
    items: [orderObj],
    total: total));
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Placing Order"),
          content: StreamBuilder(
            stream: prodBloc.orderResp,
            builder:(
                BuildContext context,AsyncSnapshot<OrderResp> orderResp)
              {
                if(orderResp.data==null||orderResp.data.message!="ok")
                return Text("Order Placed");
                else{
                  return Text("Order Placed for ₹ ${orderResp.data.data.total} ");
                }
              }),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
              },
            )
          ],
        ));
  }
}
