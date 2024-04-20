import 'package:flutter/material.dart';
import 'package:myapp/services/auth/auth_service.dart';


class LoginPage extends StatefulWidget{
  final void Function()? onTap;
  LoginPage({Key? key,required this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  
  void login() async{
    //Fill out authentication here for login
    //get instance of auth service
    final authService = AuthService(); 
    //try sign in
    try{
      await authService.signInWithEmailPassword(emailController.text,passwordController.text);
    }
    //display any errors
    catch(e){
      showDialog(
        context: context, 
        builder: (context)=> AlertDialog(
          title: Text(
            e.toString()
          ),
        )
      );
    }
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/Applogo.jpeg",
              height: 140,
              width: 140,
              
            ),
            
            Text("food delivery app",style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 243, 152, 16)),),
            SizedBox(height: 25,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 243, 152, 16)),),
              onPressed: login,
              child: Text("Sign In",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?"),
                GestureDetector(onTap:widget.onTap,child: Text("Register now",style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}