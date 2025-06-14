import 'package:farm/pages/bottomnav.dart';
import 'package:farm/pages/signup.dart';
import 'package:farm/service/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  String name = "";

  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  
  userLogin() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
    }
    on FirebaseException catch (e) {
      if(e.code=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user Found for that Email", style: TextStyle(fontSize: 18.0, color: Colors.black),)));
      } else if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Password Provided by User", style: TextStyle(fontSize: 18.0, color: Colors.black),)));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height/3.1,
              padding: EdgeInsets.only(top: 30.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFF0F4E3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.asset(
                        "assets/pan.png",
                        width: 300,
                        height: 160,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Logo
                  Image.asset(
                    "assets/logo.png",
                    width: 150,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: MediaQuery.of(context).size.height/1.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                              color: Color(0xFF151E6A),
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Text("Email", style: AppWidget.SignUpTextFeildStyle(),),
                      SizedBox(height: 5.0,),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F4E3),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          controller: mailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Email...",
                              prefixIcon: Icon(Icons.mail_outline)
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Text("Password", style: AppWidget.SignUpTextFeildStyle(),),
                      SizedBox(height: 5.0,),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F4E3),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password...",
                              prefixIcon: Icon(Icons.password_outlined)
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30.0,),
                      GestureDetector(
                        onTap: (){
                          if(mailController.text!=""&&passwordController.text!="") {
                            setState(() {
                              email = mailController.text;
                              password = passwordController.text;
                            });
                            userLogin();
                          }
                        },
                        child: Center(
                          child: Container(
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xFFAED581),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(
                              child: Text(
                                "Log In",
                                style: AppWidget.logInSignUpButtonTextFeildStyle()
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Don't have account?",
                                style: AppWidget.AlreadyTextFeildStyle()
                            ),
                            SizedBox(width: 5.0,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                              },
                              child: Text(
                                  "SignUp",
                                  style: AppWidget.logInSignUpTextFeildStyle()
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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
