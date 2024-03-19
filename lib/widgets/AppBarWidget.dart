
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(
        top: 10,left: 10,right: 10,bottom: 8
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
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
              child: Icon(CupertinoIcons.bars),
            ),
          ),
          Text(
            "PARADISE",
            style: TextStyle(
              color: Color.fromARGB(255, 243, 152, 16),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
          ),
          InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
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
              child: Icon(CupertinoIcons.location),
            ),
          ),
        ],
      ),
    );
  }
}