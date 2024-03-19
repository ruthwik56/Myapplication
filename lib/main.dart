import 'package:flutter/material.dart';
import 'package:myapp/Homepage.dart';
import 'package:myapp/widgets/cartitem.dart';
import 'package:provider/provider.dart';


void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "food app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 230, 227, 227)
      ),
      routes: {
        "/" :(context)=> HomePage(),
      },
    );
  }
}