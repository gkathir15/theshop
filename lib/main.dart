import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/observables/observable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theshop/CartPage.dart';
import 'package:url_launcher/url_launcher.dart';
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
      initialRoute: "/home",
      routes: {
        '/cart': (context) => CartPage(),
        '/profile': (context) => ProfileOrdersPage(),
        '/home':(context)=>MyHomePage(title: 'Grocery Delivery @Avadi')
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Grocery Delivery @Avadi'),
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
    initSharedPref();
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
                child: InkWell(onTap: () {}, child: Icon(Icons.account_circle))),
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: InkWell(onTap: () {
                  _showMaterialDialog();
                }, child: Icon(Icons.call)))
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
                          return Card(elevation:2,child: ProdWidget(row: snapshot.data.rows[index]),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),);
                        }),
                  );
                }else{
                  return Expanded(
                    child: Container(
                      color: Colors.orange.shade100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width/1.5,
                              height: MediaQuery.of(context).size.height/2.5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/center.png"),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Groccery Delivery in Avadi neighbourhood",textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
                          ),
                          Center(child: CircularProgressIndicator()),
                        ],
                      ),
                    ),
                  );
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
  }
  // This trailing comma makes auto-formatting nicer for build methods.


    initSharedPref()
    async {
      sharedPreferences = await SharedPreferences.getInstance();
    }


  _showMaterialDialog() {

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Call us"),
          content:InkWell(child: Padding(
            padding: const EdgeInsets.only(top: 8,),
            child: Text("Call us at 6385147969 to place an order",style: TextStyle(fontSize: 20.0,
              color: const Color(0xFF000000),
              fontWeight: FontWeight.w500,),),
          ),onTap: (){ _makePhoneCall('tel:6385147969');

          },),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();

       },),FlatButton(
    child: Text('CALL'),
    onPressed: () {

    Navigator.of(context).pop();
    _makePhoneCall('tel:6385147969');
    },
    )
          ],
        ));
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
