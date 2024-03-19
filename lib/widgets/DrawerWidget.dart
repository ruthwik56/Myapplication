
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,          
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadiusDirectional.only(Radius.zero),
                  color: Color.fromARGB(255, 243, 152, 16),
                ),
                accountEmail: Text("ruthwik@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),),
                accountName: Text("Ruthwik",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,color: Colors.black)),
                currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("/Users/ruthwik/myapp/Assets/Images/Profile.jpeg"),),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bag,
                color: Color.fromARGB(255, 243, 152, 16),
              ),
              title: Text("Orders",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(255, 243, 152, 16),
              ),
              title: Text("Logout",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      
    );
  }
}