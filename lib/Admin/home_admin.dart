import 'package:farm/Admin/all_order.dart';
import 'package:farm/Admin/manage_users.dart';
import 'package:flutter/material.dart';

import '../service/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color:  Color(0xFFAED581),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/6,),
                  Text(
                    "Home Admin",
                    style: AppWidget.HeadlineTextFeildStyle(),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.0,),
            Expanded(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color: Color(0xFFF0F4E3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 80.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AllOrder()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                              Image.asset(
                                "assets/delivery-man.png",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                                  SizedBox(width: 20.0,),
                                  Text(
                                    "Manage\nOrders",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(color: Color(0xFFAED581), borderRadius: BorderRadius.circular(30)),
                                      child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30.0,))
                            ]
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageUsers()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/team.png",
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 20.0,),
                                  Text(
                                    "Manager\nUsers",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(color: Color(0xFFAED581), borderRadius: BorderRadius.circular(30)),
                                      child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30.0,))
                                ]
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
