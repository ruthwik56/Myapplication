// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:myapp/Pages/OrdersPage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({ Key? key }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  String cardNumber ='';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTappedPay(){
    if(formKey.currentState!.validate()){
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          title: Text('Confirm Payment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card Number: $cardNumber'),
                Text('Expiry Date: $expiryDate'),
                Text('Card Holder Name: $cardHolderName'),
                Text('Cvv: $cvvCode'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () =>
                Navigator.pop(context),
              child: Text('Cancel')
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersPage()));
              }, 
              child: Text('Yes')
            )
          ],
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Color.fromARGB(255, 243, 152, 16),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, 
            onCreditCardWidgetChange: (p0){}
          ),
          CreditCardForm(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode,  
            onCreditCardModelChange: (data){
              setState(() {
                cardNumber=data.cardNumber;
                expiryDate=data.expiryDate;
                cardHolderName=data.cardHolderName;
                cvvCode=data.cvvCode;
              });
            },
            themeColor: Colors.green,
            formKey: formKey
          ),
          const Spacer(),
          ElevatedButton(
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color.fromARGB(255, 243, 152, 16))),
            onPressed: userTappedPay, 
            child: Text('Pay now',style: TextStyle(color: Colors.white),)
          ),
          SizedBox(height: 25,)
        ]
      ),
    );
  }
}