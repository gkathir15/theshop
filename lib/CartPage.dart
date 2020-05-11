import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CartWidget.dart';
import 'SubmitForm.dart';
import 'Prods.dart';
import 'Constants.dart';

class CartPage extends StatelessWidget {
  final List<Rows> rows;

  const CartPage({this.rows});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text('Items on Cart'),
        ),
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: rows.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        if (rows[index].qty > 0)
                          return CartWidget(rows[index], context, rows);
                        else {
                          return Container();
                        }
                      }),
                ),
                bottomButton(context, totalvalue)
              ],
            )));
  }

  Widget bottomButton(BuildContext context, int totalvalue,) {
    if (totalvalue >= 999) {
      return Center(
          child: ButtonTheme(
            minWidth: MediaQuery
                .of(context)
                .size
                .width,
            height: 50,
            child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                child: Column(
                  children: <Widget>[
                    Text("Order Now Total ₹ $totalvalue",
                      style: TextStyle(fontSize: 15.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w500,),),
                  ],
                ),
              ),
              elevation: 5,
              color: Colors.amber,
              onPressed: () {
                var orderRows = List<Rows>();
                var r = Rows();
                for(r in rows)
                  {
                    if(r.qty>0)
                      orderRows.add(r);
                  }

                var jsonArr = json.encoder.convert(orderRows);
                print("jsonarray= $jsonArr");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SubmitForm(jsonArr, totalvalue.toString())));
              },
            ),
          ));
    } else {
      return Center(
          child: ButtonTheme(
            minWidth: MediaQuery
                .of(context)
                .size
                .width,
            height: 50,
            child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Minimum Order amount is ₹ 999 ,Yours is ₹ $totalvalue "
                          " \n Add More for ₹ ${999-totalvalue}",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(fontSize: 15.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w500,),),
                  ],
                ),
              ),
              elevation: 5,
              color: Colors.amber,
              onPressed: () {

              },
            ),
          ));
    }
  }
}


