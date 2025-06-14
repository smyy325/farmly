import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm/service/database.dart';
import 'package:farm/service/widget_support.dart';
import 'package:flutter/material.dart';

class AllOrder extends StatefulWidget {
  const AllOrder({super.key});

  @override
  State<AllOrder> createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {

  getontheload() async{
    orderStream = await DatabaseMethods().getAdminOrders();
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Stream? orderStream;

  Widget allOrders(){
    return StreamBuilder(stream: orderStream, builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index){
            DocumentSnapshot ds = snapshot.data.docs[index];
            return Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFFAED581),
                          ),
                          SizedBox(width: 10.0,),
                          Text(ds["Address"], style: AppWidget.SimpleTextFeildStyle(),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Image.asset(
                            ds["ProductImage"],
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 20.0,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(ds["ProductName"], style: AppWidget.boldTextFeildStyle(),),
                              SizedBox(height: 5.0,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.format_list_numbered, color: Color(0xFFAED581),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Text(ds["Quantity"], style: AppWidget.boldTextFeildStyle(),),
                                  SizedBox(width: 30.0,),
                                  Icon(Icons.monetization_on, color: Color(0xFFAED581),),
                                  SizedBox(width: 10.0,),
                                  Text("\$"+ds["Total"], style: AppWidget.boldTextFeildStyle(),),
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Row(
                                children: [
                                  Icon(Icons.person, color: Color(0xFFAED581),),
                                  SizedBox(width: 10.0,),
                                  Text(ds["Name"], style: AppWidget.SimpleTextFeildStyle(),)
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Row(
                                children: [
                                  Icon(Icons.mail, color: Color(0xFFAED581),),
                                  SizedBox(width: 10.0,),
                                  Text(ds["Email"], style: AppWidget.SimpleTextFeildStyle(),)
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(ds["Status"]+"!", style: TextStyle(color: Color(0xFFAED581), fontSize: 23.0, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5.0,),
                              GestureDetector(
                                onTap: () async{
                                  await DatabaseMethods().updateAdminOrder(ds.id);
                                  await DatabaseMethods().updateUserOrder(ds['Id'], ds.id);
                                },
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Delivered",
                                      style: AppWidget.whiteTextFeildStyle(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }):Container();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
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
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/6,),
                  Text(
                      "All Orders",
                    style: AppWidget.HeadlineTextFeildStyle(),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0,),
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
                    SizedBox(height: 20.0,),
                    Container(
                      height: MediaQuery.of(context).size.height/1.5,
                        child: allOrders()
                    ),
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
