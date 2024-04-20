
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(
        top: 10,right: 10,bottom: 8
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.3),
                  offset: Offset(0,3)
                ),],
              ),
              child: Icon(CupertinoIcons.back,color: Color.fromARGB(255, 243, 152, 16),),
            ),
          ),
        //   InkWell(
        //     onTap: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
        //     },
        //     child: Container(
        //       padding: EdgeInsets.all(10),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(35),
        //         color: Colors.white,
        //         boxShadow: [BoxShadow(
        //           blurRadius: 10,
        //           spreadRadius: 2,
        //           color: Colors.grey.withOpacity(0.3),
        //           offset: Offset(0,3)
        //         ),],
        //       ),
        //       child: Icon(CupertinoIcons.cart,color: Color.fromARGB(255, 243, 152, 16),),
        //     ),
        //   ),
        ],
      ),
    );
  }
}