import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Prods.dart';
import 'Constants.dart';

class CartWidget extends StatelessWidget {
  Rows row;
 final BuildContext context;
  List<Rows> allRows;

  //CartWidget.forDesignTime(this.context);


  CartWidget(this.row, this.context, this.allRows);

  @override
  Widget build(BuildContext context) {
   // UpdateTotal(allRows,false);
    return new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(
            child: Image.network(row.imgurl,fit: BoxFit.scaleDown,
            ),
            width: MediaQuery.of(context).size.width/3,
            height: MediaQuery.of(context).size.height/4.5,
          ),

          Expanded(
//            width: MediaQuery.of(context).size.width/2,
//            height: MediaQuery.of(context).size.height/5,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    textName(row.product,2),
                    textQuantity(row.size),
                    textPrice("₹ ${row.price}",1),
                    Padding(padding:EdgeInsets.only(left: 15),child: addButton(context, row,allRows))
                  ]

              ),
            ),
          ),


          
        ]

    );



  }

  UpdateTotal(List<Rows> rows,bool needRebuild )
  {
    int total = 0;

    for(row in rows)
      {
        if(row.qty>0)
        total = total+row.amt;
      }
    totalvalue = total;
    if(needRebuild)
    (context as Element).markNeedsBuild();


  }
  
  
  Widget addButton(BuildContext context,Rows row, List<Rows> allRows)
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
              row.amt = (row.price*row.qty);
              UpdateTotal(allRows,true)
              (context as Element).markNeedsBuild();
            },
                child:
                new Text(
                  "-",
                  style: new TextStyle(fontSize: 15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w800,
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
              row.amt = (row.price*row.qty);
              UpdateTotal(allRows,true)
              (context as Element).markNeedsBuild();

            },
                color: Colors.amber,
                child:
                new Text(
                  "+",
                  style: new TextStyle(fontSize: 15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w800,
                      fontFamily: "Roboto"),
                )
            ),),


          Padding(padding:EdgeInsets.only(left: 5),child: Text("Amount ₹${row.amt}"))
        ]

    );}
    else{
    return   ButtonTheme(
        minWidth: 20,
        height: 20,
        child:new RaisedButton(shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),),key: null, onPressed: () {
          ++row.qty;
          row.amt = (row.price*row.qty);
          UpdateTotal(allRows,true)
          (context as Element).markNeedsBuild();
        },
            color: Colors.lightGreenAccent.shade200,
            child:
            Padding(padding: EdgeInsets.all(2),
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

  Widget textPrice(String row, int i)
  {
    return   Padding(
      padding: EdgeInsets.fromLTRB(0,1,0,0),
      child: Text(
        row,
        softWrap: true,
        maxLines: 3,
        textAlign: TextAlign.justify,
        style: new TextStyle(fontSize: 18.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto"),
      ),
    );
  }

  Widget textName(String row, int i)
  {
    return   Padding(
      padding: EdgeInsets.all(2),
      child: Text(
        row,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        maxLines: i,
        textAlign: TextAlign.left,
        style: new TextStyle(fontSize: 20.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto"),
      ),
    );
  }

  Widget textQuantity(String row)
  {
    return   Padding(
      padding: EdgeInsets.only(top: 3,bottom: 3),
      child: Text(
        row,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        maxLines: 1,
        textAlign: TextAlign.justify,
        style: new TextStyle(fontSize: 15.0,
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: "Roboto"),
      ),
    );
  }
}
