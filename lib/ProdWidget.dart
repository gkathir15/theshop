import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theshop/Prods.dart';

class ProdWidget extends StatelessWidget {
  Rows row;

  ProdWidget.forDesignTime();

  ProdWidget({this.row});

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Image.network(row.imgurl,
            height: 150,
          ),

          Padding(
            padding: EdgeInsets.only(left: 10),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  textWithPadding(row.product),
                  textWithPadding(row.size),
                  textWithPadding("₹ ${row.price}"),
                  Padding(padding:EdgeInsets.only(left: 15),child: addButton(context, row))
                ]

            ),
          ),


          
        ]

    );
  }
  
  
  Widget addButton(BuildContext context,Rows row)
  {
    if(row.qty>0){
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child:new RaisedButton(shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),),key: null, onPressed: () {
              if(row.qty!=0)
                --row.qty;
              (context as Element).markNeedsBuild();
            },
                child:
                new Text(
                  "-",
                  style: new TextStyle(fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                )
            ),),

          Padding(padding: EdgeInsets.all(10),
            child: new Text(
              row.qty.toString(),
              style: new TextStyle(fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto"),
            ),
          ),

          ButtonTheme(
            minWidth: 20,
            height: 20,
            child:new RaisedButton(shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),),key: null, onPressed: () {
              ++row.qty;
              (context as Element).markNeedsBuild();
            },
                color: Colors.amber,
                child:
                new Text(
                  "+",
                  style: new TextStyle(fontSize: 15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "Roboto"),
                )
            ),),
        ]

    );}
    else{
    return   ButtonTheme(
        minWidth: 20,
        height: 20,
        child:new RaisedButton(shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),),key: null, onPressed: () {
          ++row.qty;
          (context as Element).markNeedsBuild();
        },
            color: Colors.lightGreenAccent.shade200,
            child:
            Padding(padding: EdgeInsets.all(4),
              child: new Text(
                "Add to Cart",
                style: new TextStyle(fontSize: 20.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto"),
              ),
            )
        ));
    }
  }

  Widget textWithPadding(String row)
  {
    return   Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        row,
        style: new TextStyle(fontSize: 20.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w300,
            fontFamily: "Roboto"),
      ),
    );
  }
}
