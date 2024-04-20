import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Pages/PaymentPage.dart';
import 'package:myapp/widgets/cartitem.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<CartItem> Items = Provider.of<CartProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 152, 16),
        title: Text('Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon:  Icon(CupertinoIcons.back,color: Colors.white,), onPressed: () {Navigator.pop(context); },
        ),
      ),
      body: ListView.builder(
        itemCount: Items.length,
        itemBuilder: (context, index) {
          CartItem item = Items[index];
          return Container(
            margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 5),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
            child: ListTile(
              
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
              title: Text(item.name),
              subtitle: Text('Price: \₹ ${item.price}', style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 243, 152, 16),),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove,color:Color.fromARGB(255, 243, 152, 16),),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).decrementQuantity(index);
                    }
                  ),
                  Text(item.quantity.toString(),style: TextStyle(fontSize: 16),),
                  IconButton(
                    icon: Icon(Icons.add,color: Color.fromARGB(255, 243, 152, 16),),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).incrementQuantity(index);
                    },
                  ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
                      child:IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false).removeItem(index);
                        } , 
                        icon: Icon(Icons.close,color: Colors.black,size: 15,),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color:Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                "Total:",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              SizedBox(width: 15,),
              Text(
                '\₹ ${Provider.of<CartProvider>(context).totalAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 243, 152, 16)
                ),
              ),
                ],
              ),
              
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 243, 152, 16))
                ),
                child: Text("Order Now",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'widgets/AppBarWidget2.dart';
// import 'widgets/CartBottomNavigationBar.dart';

// class CartPage extends StatelessWidget {
//   @override
//   Widget build (BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           SingleChildScrollView(
//             child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
//               child:Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppBarWidget2(),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 20,
//                       left: 10,
//                       bottom: 10
//                     ),
//                     child: Text(
//                       "Cart List",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     child: Container(
//                       width: double.infinity,
//                       height: 110,
//                       clipBehavior: Clip.antiAlias,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 3,
//                             blurRadius: 10,
//                             offset:Offset(0,3)
//                           )
//                         ]
//                       ),
//                       child: Row(
//                         children: [ 
//                           Image.asset("images/Pizzas.jpeg"),
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.symmetric(vertical:15,horizontal: 15),
//                               width: 190,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "Hot Pizza",
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   SizedBox(height: 8,),
//                                   Text(
//                                     "Taste our Hot Pizza",
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   SizedBox(height: 9,),
//                                   Text(
//                                     "\$15",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color.fromARGB(255, 243, 152, 16)
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin:EdgeInsets.all(4),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children:[ 
//                                   IconButton(
//                         alignment: Alignment.topRight,
//                         icon: Icon(Icons.add,size: 17,),
//                         onPressed: () {
//                         },
//                       ),
//                       Container(
//                         height: 15, width:14 ,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.white),
//                         child: Text("0", style: TextStyle(fontSize: 15),textAlign: TextAlign.right),
//                       ),
//                       IconButton(
//                         alignment: Alignment.bottomRight,
//                       icon: Icon(CupertinoIcons.minus,size: 17,),
//                         onPressed: () {
//                         },
//                       ),
//                                 ],
//                               ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     child: Container(
//                       width: double.infinity,
//                       height: 110,
//                       clipBehavior: Clip.antiAlias,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 3,
//                             blurRadius: 10,
//                             offset:Offset(0,3)
//                           )
//                         ]
//                       ),
//                       child: Row(
//                         children: [ 
//                           Image.asset("images/Sprite1.jpeg"),
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.symmetric(vertical:15,horizontal: 15),
//                               width: 190,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "Sprite",
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   SizedBox(height: 8,),
//                                   Text(
//                                     "Taste our Sprite",
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   SizedBox(height: 9,),
//                                   Text(
//                                     "\$2",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color.fromARGB(255, 243, 152, 16)
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin:EdgeInsets.all(4),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children:[ 
//                                   IconButton(
//                         alignment: Alignment.topRight,
//                         icon: Icon(Icons.add,size: 17,),
//                         onPressed: () {
//                         },
//                       ),
//                       Container(
//                         height: 14, width:14 ,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.white),
//                         child: Text("0", style: TextStyle(fontSize: 15),textAlign: TextAlign.right),
//                       ),
//                       IconButton(
//                         alignment: Alignment.bottomRight,
//                       icon: Icon(CupertinoIcons.minus,size: 17,),
//                         onPressed: () {
//                         },
//                       ),
//                                 ],
//                               ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     child: Container(
//                       width: double.infinity,
//                       height: 110,
//                       clipBehavior: Clip.antiAlias,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 3,
//                             blurRadius: 10,
//                             offset:Offset(0,3)
//                           )
//                         ]
//                       ),
//                       child: Row(
//                         children: [ 
//                           Image.asset("images/Biryani1.jpeg"),
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.symmetric(vertical:15,horizontal: 15),
//                               width: 190,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "Spicy Biryani",
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   SizedBox(height: 8,),
//                                   Text(
//                                     "Taste our Spicy Biryani",
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   SizedBox(height: 9,),
//                                   Text(
//                                     "\$20",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color.fromARGB(255, 243, 152, 16)
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin:EdgeInsets.all(4),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children:[ 
//                                   IconButton(
//                         alignment: Alignment.topRight,
//                         icon: Icon(Icons.add,size: 17,),
//                         onPressed: () {
//                         },
//                       ),
//                       Container(
//                         height: 14, width:14 ,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.white),
//                         child: Text("0", style: TextStyle(fontSize: 15),textAlign: TextAlign.right),
//                       ),
//                       IconButton(
//                         alignment: Alignment.bottomRight,
//                       icon: Icon(CupertinoIcons.minus,size: 17,),
//                         onPressed: () {
//                         },
//                       ),
//                                 ],
//                               ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color:Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 3,
//                             blurRadius: 10,
//                             offset: Offset(0,3)
//                           )
//                         ]
//                       ),
//                       child: Column(children: [
//                         Padding(padding: EdgeInsets.symmetric(vertical: 10),
//                         child: Row(
//                           mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Items:",style: TextStyle(fontSize: 20),),
//                             Text("12",style: TextStyle(fontSize: 20),)
//                           ],
//                           ),
//                         ),
//                         Divider(
//                           color: Colors.black,
//                         ),
//                         Padding(padding: EdgeInsets.symmetric(vertical: 10),
//                         child: Row(
//                           mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Sub-Total:",style: TextStyle(fontSize: 20),),
//                             Text("\$112",style: TextStyle(fontSize: 20),)
//                           ],
//                           ),
//                         ),
//                         Divider(
//                           color: Colors.black,
//                         ),
//                         Padding(padding: EdgeInsets.symmetric(vertical: 10),
//                         child: Row(
//                           mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Delivery:",style: TextStyle(fontSize: 20),),
//                             Text("\$8",style: TextStyle(fontSize: 20),)
//                           ],
//                           ),
//                         ),
//                         Divider(
//                           color: Colors.black,
//                         ),
//                         Padding(padding: EdgeInsets.symmetric(vertical: 10),
//                         child: Row(
//                           mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Total:",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//                             Text("\$120",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Color.fromARGB(255, 243, 152, 16)))
//                           ],
//                           ),
//                         ),
//                       ],)
//                     ),
//                   )
//               ]) ,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CartBottomNavigationBar(),
//     );
//   }
// }