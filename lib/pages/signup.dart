import 'package:farm/pages/bottomnav.dart';
import 'package:farm/pages/login.dart';
import 'package:farm/service/database.dart';
import 'package:farm/service/shared_pref.dart';
import 'package:farm/service/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "";
  String password = "";
  String name = "";

  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();

  registration() async {
    if(password != null && nameController.text != "" && mailController.text != ""){
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        String Id = randomAlphaNumeric(10);
        Map<String, dynamic> userInfoMap = {
          "Name": nameController.text,
          "Email": mailController.text,
          "Id": Id,
          "Wallet":"0",
        };
        await SharedpreferenceHelper().saveUserEmail(email);
        await SharedpreferenceHelper().saveUserName(nameController.text);
        await SharedpreferenceHelper().saveUserId(Id);
        await DatabaseMethods().addUserDetails(userInfoMap, Id);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            )
        ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
      } on FirebaseException catch (e){
        if (e.code == 'weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Password Provided is too Weak",
              style: TextStyle(fontSize: 18.0),
            )
          ));
        } else if (e.code == "email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Account Already exists",
              style: TextStyle(fontSize: 18.0),
            )
          ));
        }
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
                  height: MediaQuery.of(context).size.height/1.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            color: Color(0xFF151E6A),
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("Name", style: AppWidget.SignUpTextFeildStyle(),),
                      SizedBox(height: 5.0,),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F4E3),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Name...",
                              prefixIcon: Icon(Icons.person_outline)
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
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
                      SizedBox(height: 10.0,),
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
                          if(nameController.text != "" && mailController.text != "" && passwordController.text !=""){
                            setState(() {
                              name=nameController.text;
                              email=mailController.text;
                              password=passwordController.text;
                            });
                            registration();
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
                                "Sign Up",
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
                              "Already have an account?",
                              style: AppWidget.AlreadyTextFeildStyle()
                            ),
                            SizedBox(width: 5.0,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                              },
                              child: Text(
                                  "LogIn",
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
