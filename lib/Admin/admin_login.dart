import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm/Admin/home_admin.dart';
import 'package:farm/pages/login.dart';
import 'package:farm/pages/onboard.dart';
import 'package:flutter/material.dart';

import '../service/widget_support.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  height: MediaQuery.of(context).size.height/2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Admin",
                          style: TextStyle(
                              color: Color(0xFF151E6A),
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("Username", style: AppWidget.SignUpTextFeildStyle(),),
                      SizedBox(height: 5.0,),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F4E3),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Username...",
                              prefixIcon: Icon(Icons.person_outline)
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
                      SizedBox(height: 30.0,),
                      GestureDetector(
                        onTap: (){
                          loginAdmin();
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
                                  "LogIn",
                                  style: AppWidget.logInSignUpButtonTextFeildStyle()
                              ),
                            ),

                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Aren't you an admin?",
                                style: AppWidget.AlreadyTextFeildStyle()
                            ),
                            SizedBox(height: 5.0,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                              },
                              child: Text(
                                  "CustomerLogin",
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

  loginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result){
        if(result.data()['username']!=usernameController.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Your username is not correct",
                style: TextStyle(fontSize: 18.0),
              )
          ));
        } else if(result.data()['password']!=passwordController.text){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Your password is not correct",
                style: TextStyle(fontSize: 18.0),
              )
          ));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeAdmin()));
        }
      });
    });
  }
}
