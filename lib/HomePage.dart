
import 'package:flutter/material.dart';
import 'package:myapp/CartPage.dart';
import 'package:myapp/widgets/DrawerWidget.dart';

import 'widgets/AppBarWidget.dart';
import 'widgets/ColumnscrollWidget.dart';
import 'widgets/EndDrawerWidget.dart';
import 'widgets/RowScrollWidget.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(),
          Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
          child: TextField(
            onChanged: (value) {
              setState(() {
                //searchText = value;
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 23),
                  child: Text("CATEGORIES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                ),
                RowScrollWidget(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 23),
                  child: Text("MENU",style: TextStyle(fontWeight: FontWeight.bold,)),
                ),
                ColumnScrollWidget(),
              ],
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      endDrawer: EndDrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.shopping_cart_checkout,
          color: Color.fromARGB(255, 243, 152, 16)
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

// class CategoryItem extends StatelessWidget {
//   final String categoryName;

//   const CategoryItem({Key? key, required this.categoryName}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => CategoryPage(categoryName: "Biryani")),
//         );
//       },
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Stack(
//           children: [
//             Container(
//               height: 100,width: 100,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 3,
//                     blurRadius: 10,
//                     offset:Offset(0,3)
//                   )
//                 ]
//               ),
//               child: Image.asset("/Users/ruthwik/myapp/Assets/Images/Curries.jpeg",fit: BoxFit.cover,)
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 25,
//                 color: Colors.black.withOpacity(0.7),
//                 child: Center(
//                   child: Text(
//                     'Curries',
//                     style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                     ),
//                   ),
//                 ),
//               ),           
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


