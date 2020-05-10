import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/observables/observable.dart';
import 'package:theshop/CartPage.dart';
import 'Repo.dart';
import 'package:theshop/ProdWidget.dart';
import 'package:theshop/ProfileOrdersPage.dart';
import 'Prods.dart';
import 'Constants.dart';
import 'ProdBloc.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Delivery',
      routes: {
        '/cart': (context) => CartPage(),
        '/profile': (context) => ProfileOrdersPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Grocery Delivery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    prodBloc.fetchnetworkData();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 4,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: InkWell(onTap: () {}, child: Icon(Icons.account_circle)))
          ],
          title: Text(widget.title),
        ),
        body: Center(
          child: StreamBuilder(
              stream: prodBloc.prod,
              builder: (BuildContext context, AsyncSnapshot<Prods> snapshot) {
                if(snapshot.data!=null) {
                  return Scrollbar(
                    isAlwaysShown: true,
                    child: ListView.builder(scrollDirection:Axis.vertical ,
                        itemCount: snapshot.data.rows.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          //return ProdWidget(row:snapshot.data.rows[index]);
                          return Card(elevation:5,child: ProdWidget(row: snapshot.data.rows[index]),shape: RoundedRectangleBorder(),);
                        }),
                  );
                }else{
                  return Center(child: Text(snapshot.connectionState.toString()),);
                } }),
        ),
        floatingActionButton: StreamBuilder(
            stream: prodBloc.prod,
            builder: (BuildContext context, AsyncSnapshot<Prods> snapshot) {
              return FloatingActionButton(
                onPressed: () {
                  var prodsData = snapshot.data;
                  //  print("data \n"+snapshot.data.rows.length.toString());
//                    if (prodsData != null &&
//                        prodsData.rows != null &&
//                        prodsData.rows.isNotEmpty) {
//                      Navigator.pushNamed(context, '/cart',
//                          arguments: prodsData.rows);
                  int total = 0;

                  for (Rows row in snapshot.data.rows) {
                    if (row.qty > 0) total = total + row.amt;
                  }
                  totalvalue = total;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CartPage(rows: prodsData.rows)));
//                    } else {
//                      return;
//                    }
                },
                tooltip: 'Cart',
                child: Icon(Icons.shopping_cart),
              );
            }));
  } // This trailing comma makes auto-formatting nicer for build methods.

}
