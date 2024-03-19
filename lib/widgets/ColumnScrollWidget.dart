import 'package:flutter/material.dart';
import 'package:myapp/widgets/cartitem.dart';
import 'package:provider/provider.dart';

class ColumnScrollWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
    padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return FoodItemBottomSheet(price:20,quantity: 2,name: 'Chicken biryani',description: 'Taste our chicken biryani it is very tasty');
              },
            );
          },
          child: FoodItem(image: 'assets/images/Biryani.jpeg',item: 'Chicken biryani',description: 'Taste our chicken biryani it is very tasty',price: '\₹ 20',),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return FoodItemBottomSheet(price:24,quantity: 2,name: 'Paneer butter masala',description: 'Taste our paneer butter masala it is very spicy',);
              },
            );
          },
          child: FoodItem(image: 'assets/images/Paneer1.jpeg',item: 'Paneer butter masala',description: 'Taste our paneer butter masala it is very spicy',price: '\₹ 24',),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(context: context, builder: (BuildContext context){
              return FoodItemBottomSheet(quantity: 0, name:'Roti', price: 2,description: 'Taste our roti it is very soft');
            },);
          },
          child: FoodItem(image: 'assets/images/Rotis1.jpeg',item: 'Rotis',description: 'Taste our roti it is very soft',price: '\₹ 2',),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(context: context, builder: (BuildContext context){
              return FoodItemBottomSheet(quantity: 0, name: 'Pizza', price: 15,description: 'Taste our pizza it is so cheesy');
            });
          },
          child: FoodItem(image: 'assets/images/Pizzas.jpeg',item: 'Pizza',description: 'Taste our pizza it is so cheesy ',price: '\₹ 15',),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(context: context, builder: (BuildContext context){
              return FoodItemBottomSheet(quantity: 0, name: 'Cake', price: 7,description: 'Taste our cake it is very delicious');
            });
          },
          child: FoodItem(image: 'assets/images/Cake1.jpeg',item: 'Cake',description: 'Taste our cake it is very delicious',price: '\₹ 7',),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(context: context, builder: (BuildContext context){
              return FoodItemBottomSheet(quantity: 0, name: 'Sprite', price: 2,description: 'Drink the sprite and chill');
            });
          },
          child: FoodItem(image: 'assets/images/Sprite1.jpeg',item: 'Sprite',description: 'Drink the sprite and chill',price: '\₹ 2',),
        ),
      ],
    ),
  );
  }
}

class FoodItem extends StatefulWidget{
  final String image;
  final String item;
  final String description;
  final String price;
  const FoodItem({Key? key, required this.description,required this.item, required this.image, required this.price,}): super(key: key);

  @override 
  FoodItemState createState() => FoodItemState();
}

class FoodItemState extends State<FoodItem>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 10, left: 3,right: 3),
      height: 190,
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset:Offset(0,5)
                      )
                    ] 
      ),
      child: Row(
        children: [
          Image.asset(widget.image, width: 220, height: 190, fit: BoxFit.cover,),
          Expanded(
            child: Padding(padding: EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top: 30,left: 10),
                        child: Text(widget.item,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 243, 152, 16)),),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top:10,bottom: 5,left:11,right: 10),
                        child: Text(widget.description,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                      ),
                    ]
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(bottom:10,left: 10,right: 10,top: 5),
                        child: Text(widget.price,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 243, 152, 16)),)
                      ),
                      
                    ]
                  ),   
                ],
              ),
            ),
          ),
        ],
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
                child: Text("Add to cart"),
              ),
            ],
          ), 
        ],
      ),
    );
  }
}


