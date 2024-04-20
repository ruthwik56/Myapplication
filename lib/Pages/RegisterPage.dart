import 'package:flutter/material.dart';
import 'package:myapp/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget{
  final void Function()? onTap;
  const RegisterPage({Key? key, required this.onTap});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  final TextEditingController confirmPasswordController= TextEditingController();

  void register() async{
    //Fill out authentication here for register
    //get auth service
    final authService = AuthService();
    //checking if passwords match --> create user
    if (passwordController.text==confirmPasswordController.text){
      //try creating user
      try{
        await authService.signUpWithEmailPassword(emailController.text,passwordController.text);
      }
      //Display any errors
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
    //if passwords doesn't match show error
    else{
      showDialog(
        context: context, 
        builder: (context)=> const AlertDialog(
          title: Text(
            "Password don't match"
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
            
            Text("Create an account",style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 243, 152, 16)),),
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
            Padding(padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
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
              onPressed: register,
              child: Text("Sign Up",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                GestureDetector(onTap:widget.onTap,child: Text("Login here",style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}