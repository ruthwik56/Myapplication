
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:myapp/Pages/OrdersPage.dart';
import 'package:myapp/services/auth/auth_service.dart';

class DrawerWidget extends StatelessWidget{
  void logout(){
    final authService = AuthService();
    authService.signOut();
  }
  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Colors.white,
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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersPage()));
            },
            leading: Icon(
              CupertinoIcons.bag,
              color: Color.fromARGB(255, 243, 152, 16),
            ),
            title: Text("Orders",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          ListTile(
            onTap: () {
              logout();
              Navigator.pop(context);
            },
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