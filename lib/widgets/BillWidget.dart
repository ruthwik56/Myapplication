import 'package:flutter/material.dart';
import 'package:myapp/widgets/cartitem.dart';
import 'package:provider/provider.dart';

class BillWidget extends StatefulWidget {
  const BillWidget({ Key? key }) : super(key: key);

  @override
  State<BillWidget> createState() => _BillWidgetState();
}

class _BillWidgetState extends State<BillWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Container(
              child: Text("Thanks for your order"),      
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset:Offset(0,3)
                  )
                ],
              ),
              child: Padding(padding: EdgeInsets.all(12),
                child: Consumer<CartProvider>(
                  builder: (context, cartitem, child) => Text(cartitem.displayCartBill()),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
