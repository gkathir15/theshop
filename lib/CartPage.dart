import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'CartWidget.dart';
import 'HomeMaterial.dart';
import 'Prods.dart';
import 'Constants.dart';

class CartPage extends StatelessWidget {
  final List<Rows> rows;
  const CartPage({ this.rows});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Center(
        child:
                  Column(mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            itemCount: rows.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              if(rows[index].qty>0)
                              return CartWidget(rows[index],context,rows);
                              else{
                                return Container();
                              }
                            }),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width,
                      height: 70,child:Center(child:RaisedButton(child: Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 5.0,bottom: 5.0),
                        child: Column(
                          children: <Widget>[
                            Text("Order Now Total $totalvalue"),
                          ],
                        ),
                      ),elevation: 5,color: Colors.amber,onPressed: (){

                        var jsonArr = json.encoder.convert(rows);
                        print("jsonarray= $jsonArr");

                          Navigator.push(
                              context,MaterialPageRoute(builder: (context) => HomeMaterial(jsonArr,totalvalue.toString())));
                        },)),)
                    ],
                  )


    ));
  }
}
