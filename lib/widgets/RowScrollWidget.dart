
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/BeveragesPage.dart';
import 'package:myapp/BiryaniPage.dart';
import 'package:myapp/CurriesPage.dart';
import 'package:myapp/DessertPage.dart';
import 'package:myapp/PizzaPAge.dart';
import 'package:myapp/RotiPage.dart';

class RowScrollWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical:15,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 13), 
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Container(
                      height: 100,width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset:Offset(0,3)
                          )
                        ]
                      ),
                      child: InkWell(
                        onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => BiryaniPage()),);},
                        child: Image.asset("/Users/ruthwik/myapp/Assets/Images/Biryani.jpeg",fit: BoxFit.cover,)
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 25,
                        color: Colors.black.withOpacity(0.7),
                        child: Center(
                          child: Text(
                            'Biryanis',
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            ),
                          ),
                        ),
                      ),           
                    )
                  ],
                ),
              ),
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset:Offset(0,3)
                        )
                      ]
                    ),
                    child: InkWell(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CurriesPage()),);},
                      child: Image.asset("/Users/ruthwik/myapp/Assets/Images/Curries.jpeg",fit: BoxFit.cover,)
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 25,
                      color: Colors.black.withOpacity(0.7),
                      child: Center(
                        child: Text(
                          'Curries',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          ),
                        ),
                      ),
                    ),           
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset:Offset(0,3)
                        )
                      ]
                    ),
                    child: InkWell(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => RotiPage()),);},
                      child: Image.asset("/Users/ruthwik/myapp/Assets/Images/Rotis.jpeg",fit: BoxFit.cover,)
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 25,
                      color: Colors.black.withOpacity(0.7),
                      child: Center(
                        child: Text(
                          'Rotis',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          ),
                        ),
                      ),
                    ),           
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset:Offset(0,3)
                        )
                      ]
                    ),
                    child: InkWell(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => PizzaPage()),);},
                      child: Image.asset("/Users/ruthwik/myapp/Assets/Images/Pizzas.jpeg",fit: BoxFit.cover,)
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 25,
                      color: Colors.black.withOpacity(0.7),
                      child: Center(
                        child: Text(
                          'Pizzas',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          ),
                        ),
                      ),
                    ),           
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset:Offset(0,3)
                        )
                      ]
                    ),
                    child: InkWell(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => DessertPage()),);},
                      child: Image.asset("/Users/ruthwik/myapp/Assets/Images/dessert.jpeg",fit: BoxFit.cover,)
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 25,
                      color: Colors.black.withOpacity(0.7),
                      child: Center(
                        child: Text(
                          'Desserts',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          ),
                        ),
                      ),
                    ),           
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset:Offset(0,3)
                        )
                      ]
                    ),
                    child: InkWell(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => BeveragesPage()),);},
                      child: Image.asset("/Users/ruthwik/myapp/Assets/Images/Beverages.jpeg",fit: BoxFit.cover,)
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 25,
                      color: Colors.black.withOpacity(0.7),
                      child: Center(
                        child: Text(
                          'Soft Drinks',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          ),
                        ),
                      ),
                    ),           
                  )
                ],
              ),
            ),
            SizedBox(width: 13),
          ],
        ),
      ),
    );
  }
}