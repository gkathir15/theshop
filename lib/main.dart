import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theshop/ProdBloc.dart';
import 'package:theshop/ProdWidget.dart';
import 'package:theshop/SheetData.dart';
import 'package:http/http.dart' as http;
import 'Repo.dart';
import 'package:theshop/ProdBloc.dart';

import 'Prods.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  var url = "https://g-sheet-shop.herokuapp.com/api?id=14RZSN4Wi0Rd6gReSdXT0g6uWW3aU2Ga_UVPZZPaiBGI&sheet=1";
//  Future<Prods> data;

//   Future<Prods>fetchAlbum() async {
//    final response = await http.get(url);
//
//    if (response.statusCode == 200) {
//      // If the server did return a 200 OK response,
//      // then parse the JSON.
//      print(response.body);
//
//      return  Prods.fromJson(json.decode(response.body));
//
//
//
//
//    } else {
//      // If the server did not return a 200 OK response,
//      // then throw an exception.
//      throw Exception('Failed to load album');
//    }
//  }

  void  moveToCart()
  {

  }

  @override
  void initState() {
    super.initState();
    //data = fetchAlbum();
  }


  @override
  void dispose() {

  }

  @override
  Widget build(BuildContext context) {
    prodBloc.fetchLondonWeather();
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        elevation: 4,
        actions: <Widget>[Padding(padding:EdgeInsets.only(left: 3,right: 3),child: InkWell(onTap: (){},child: Icon(Icons.account_circle)))],
        title: Text(widget.title),
      ),
      body: Center(
        child:StreamBuilder(stream:prodBloc.prod,builder: (BuildContext context, AsyncSnapshot<Prods> snapshot) {
          if(snapshot.data!=null)
            {
              return ListView.separated(separatorBuilder: (context, index) => Divider(
                color: Colors.black,endIndent: 2,
              ),itemCount:snapshot.data.rows.length,itemBuilder: (BuildContext ctxt, int index) {
                //return ProdWidget(row:snapshot.data.rows[index]);
                return ProdWidget(row:snapshot.data.rows[index]);
              });
            }
          else
            {
              return CircularProgressIndicator();
            }
        },), ),

      floatingActionButton: FloatingActionButton(
        onPressed: moveToCart,
        tooltip: 'Cart',
        child: Icon(Icons.shopping_cart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

//  ListView.builder(itemCount:data.rows.length,itemBuilder: (BuildContext ctxt, int index) {
//  return itemV(data.rows[index]);
//  })


  Widget itemV(Rows row)
  {
  return  ListTile(title: Text(row.product),leading: Image.network(row.imgurl,height: 800,scale: 2.0,),subtitle:Text(row.size),
      trailing: Text("&#8377 ${row.price}"),isThreeLine: true,
    );
  }
}
