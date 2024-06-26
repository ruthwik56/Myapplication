// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_escapes, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:myapp/widgets/AppBarWidget1.dart';
import 'package:myapp/widgets/cartitem.dart';
import 'package:provider/provider.dart';

class BiryaniPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(backgroundColor: Color.fromARGB(255, 230, 227, 227),
      body: Column(
        children: [
          AppBarWidget1(),
          Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
          child: TextField(
            onChanged: (value) {
              setState(() {

              });
            },
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25)),),
              
            ),
          ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector( onTap: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context){
                      return FoodItemBottomSheet(quantity: 0, name: 'Chicken biryani', price: 20,description:"Chicken biryani is very tasty");
                    }
                  );
                },
                  child: FoodItem(item:'Chicken biryani',description: 'Taste our Chicken biryani it is very delicious',price:'\₹ 20',image: 'assets/images/Biryani.jpeg',)),
                GestureDetector(onTap: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context){
                    return FoodItemBottomSheet(quantity: 0, name: "Mutton Biryani", price: 30,description:"Mutton Biryani is very tasty");
                  });
                },
                  child: FoodItem(item:'Mutton biryani',description: 'Taste our Mutton biryani it is very delicious',price:'\₹ 30',image: 'assets/images/Biryani1.jpeg',)),
                GestureDetector(onTap: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context){
                    return FoodItemBottomSheet(quantity: 0, name: "Fish Biryani", price: 40,description:"Fish Biryani is very tasty");
                  });
                },
                  child: FoodItem(item:'Fish biryani',description: 'Taste our Fish biryani it is very delicious',price:'\₹ 40',image: 'assets/images/Cake1.jpeg',)),
                GestureDetector(onTap: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context){
                    return FoodItemBottomSheet(quantity: 0, name: "Prawns Biryani", price: 50,description:"Prawns Biryani is very tasty");
                  });
                },
                  child: FoodItem(item:'Prawns biryani',description: 'Taste our Prawns biryani it is very delicious',price:'\₹ 50',image: 'assets/images/Sprite1.jpeg',)),
                GestureDetector(onTap: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context){
                    return FoodItemBottomSheet(quantity: 0, name: "Egg Biryani", price: 20,description:"Egg Biryani is very tasty");
                  });
                },
                  child: FoodItem(item:'Egg biryani',description: 'Taste our Egg biryani it is very delicious',price:'\₹ 20',image: 'assets/images/Paneer1.jpeg',)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class FoodItem extends StatefulWidget {
  final String item;
  final String description;
  final String price;
  final String image;
  const FoodItem({ Key? key, required this.item, required this.image, required this.description, required this.price}) : super(key: key);

  @override
  FoodItemState createState() => FoodItemState();
}

class FoodItemState extends State<FoodItem> {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset(
                    widget.image,
                    width: 220,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(left:8,right: 8,bottom: 5,top:15),
                            child: Text(widget.item,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding:EdgeInsets.only(left: 8,right: 8,bottom: 8,top: 5),
                            child: Text(widget.description,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding:EdgeInsets.all(8),
                            child: Text(widget.price,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 243, 152, 16)),)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),                  
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                color: Colors.black.withOpacity(0.6),
                child: Center(
                  child: Text(
                    widget.item,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodItemBottomSheet extends StatefulWidget {
  final String name;
  final double price;
  final int quantity;
  final String description;
  const FoodItemBottomSheet({Key? key,required this.description,required this.quantity,  required this.name , required this.price}):super(key: key);

  @override
  _FoodItemBottomSheetState createState() => _FoodItemBottomSheetState();
}

class _FoodItemBottomSheetState extends State<FoodItemBottomSheet> {
  int quantity = 0;


  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 243, 152, 16)),
          ),
          SizedBox(height: 10),
          Text(widget.description),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:[ Text(
                'Price:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  '\₹ ${widget.price}',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 243, 152, 16)),
                ),
                ]
              ),
              Row(
                children: [
                  IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: decrementQuantity,
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: incrementQuantity,
                  ),
                ] 
              ),
              ElevatedButton(onPressed: () {
                if (quantity > 0) {
                  Provider.of<CartProvider>(context, listen: false).addItem(
                    name: widget.name,
                    price: widget.price,
                    quantity: quantity,
                );
                Navigator.pop(context);
              }
                },
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 243, 152, 16)),
                ), 
                child: Text("Add to cart",style: TextStyle(color: Colors.white),),
              ),
            ],
          ), 
        ],
      ),
    );
  }
}

