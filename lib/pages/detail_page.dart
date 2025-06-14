import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm/service/database.dart';
import 'package:farm/service/shared_pref.dart';
import 'package:farm/service/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';

import '../service/constant.dart';

class DetailPage extends StatefulWidget {
  String name, image, price;
  DetailPage({required this.name, required this.image, required this.price});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic>? paymentIntent;
  String? name,id, email, address, wallet;
  int quantity = 1, totalPrice = 0;

  TextEditingController addressController = new TextEditingController();

  getthesaredpref() async{
    name=await SharedpreferenceHelper().getUserName();
    id=await SharedpreferenceHelper().getUserId();
    email=await SharedpreferenceHelper().getUserEmail();
    address=await SharedpreferenceHelper().getUserAddress();
    print(name);
    print(id);
    print(email);
    setState(() {

    });
  }

  getUserWallet() async{
    await getthesaredpref();
    QuerySnapshot querySnapshot=
    await DatabaseMethods().getUserWalletbyemail(email!);
    wallet="${querySnapshot.docs[0]["Wallet"]}";
    print(wallet);
    setState(() {

    });
  }

  int getPrice() {
    return int.parse(widget.price.replaceAll("\$", ""));
  }

  @override
  void initState() {
    totalPrice = getPrice();
    getUserWallet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xFFAED581),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                widget.image,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            Center(child: Text(widget.name, style: AppWidget.HeadlineTextFeildStyle())),
            Text(widget.price, style: AppWidget.priceTextFeildStyle()),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                "Cow’s milk from a natural farm is fresh, nutritious, and free from harmful chemicals. "
                    "It provides important nutrients like calcium, protein, vitamin D, and B12, which help keep bones and muscles strong. "
                    "Since the cows are usually grass-fed and well cared for, the milk is often healthier and richer in natural enzymes and good fats like omega-3s. "
                    "This makes it a wholesome choice for overall health.",
              ),
            ),
            SizedBox(height: 10.0),
            Text("Quantity", style: AppWidget.SimpleTextFeildStyle()),
            SizedBox(height: 10.0),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    quantity += 1;
                    totalPrice += getPrice();
                    setState(() {});
                  },
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFAED581),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.1),
                Text(quantity.toString(), style: AppWidget.HeadlineTextFeildStyle()),
                SizedBox(width: 15.1),
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      quantity -= 1;
                      totalPrice -= getPrice();
                      setState(() {});
                    }
                  },
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFAED581),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFFAED581),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "\$$totalPrice",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  GestureDetector(
                    onTap: () async{
                      if(address==null){
                        openBox();
                      } else if(int.parse(wallet!) > totalPrice) {
                        int updatewallet =int.parse(wallet!)-totalPrice;
                        await DatabaseMethods().updateUserWallet(updatewallet.toString(), id!);
                        String orderId=randomAlphaNumeric(10);
                        Map<String, dynamic> userOrderMap={
                          "Name": name,
                          "Id": id,
                          "Quantity":quantity.toString(),
                          "Total":totalPrice.toString(),
                          "Email": email,
                          "ProductName": widget.name,
                          "ProductImage": widget.image,
                          "OrderId": orderId,
                          "Status":"Pending",
                          "Address": address?? addressController.text,
                        };
                        await DatabaseMethods().addUserOrderDetails(userOrderMap, id!, orderId);
                        await DatabaseMethods().addAdminOrderDetails(userOrderMap, orderId);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              "Order Placed Successfully!!!",
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            )
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Add some money to your Wallet",
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            )
                        ));
                      }
                    },
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "ORDER NOW",
                            style: AppWidget.whiteTextFeildStyle(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment(String amount) async{
    try{
      paymentIntent = await createPaymentIntent(amount, 'USD');
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent?['client_secret'],
            style: ThemeMode.dark,
        merchantDisplayName: 'Sumeyye'
      )).then((value){});
      displayPaymentSheet(amount);
    } catch (e, s){
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(String amount) async{
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async{
        String orderId=randomAlphaNumeric(10);
        Map<String, dynamic> userOrderMap={
          "Name": name,
          "Id": id,
          "Quantity":quantity.toString(),
          "Total":totalPrice.toString(),
          "Email": email,
          "ProductName": widget.name,
          "ProductImage": widget.image,
          "OrderId": orderId,
          "Status":"Pending",
          "Address": address?? addressController.text,
        };
        await DatabaseMethods().addUserOrderDetails(userOrderMap, id!, orderId);
        await DatabaseMethods().addAdminOrderDetails(userOrderMap, orderId);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Order Placed Successfully!!!",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            )
        ));

        showDialog(
            context: context,
            builder: (_)=>AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      Text("Payment Successfull")
                    ],
                  )
                ],
              ),
            )
        );
        paymentIntent=null;
      }).onError((error, stackTrace){
        print("Error is:--->$error$stackTrace");
      });
    } on StripeException catch (e) {
      print("Error is:--->$e");
      showDialog(
          context: context,
          builder: (_)=>AlertDialog(
            content: Text("Cancelled"),
          )
      );
    } catch(e){
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async{
    try{
      Map<String, dynamic> body ={
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]':'card'
      };

      var response =await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers:{
          'Authorization':'Bearer $secretKey',
          'Content-Type':'application/x-www-form-urlencoded',
        },
        body:body,
      );
      return jsonDecode(response.body);
    }
    catch (err){
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount){
    final calculateAmount =(int.parse(amount)*100);
    return calculateAmount.toString();
  }

  Future openBox()=> showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.cancel
                      ),
                    ),
                    SizedBox(width: 30.0,),
                    Text(
                      "Add the Address",
                      style: TextStyle(
                        color: Color(0xff12195a),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text("Add Address"),
                SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38,width: 10.0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Address"
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: () async{
                    address=addressController.text;
                    await SharedpreferenceHelper().saveUserAddress(addressController.text);
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xff12195a),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
  );
}
