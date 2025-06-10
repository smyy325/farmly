import 'package:farm/model/category_model.dart';
import 'package:farm/model/fruits.dart';
import 'package:farm/model/milk_model.dart';
import 'package:farm/model/vegetables.dart';
import 'package:farm/model/yogurt.dart';
import 'package:farm/pages/detail_page.dart';
import 'package:farm/service/category_data.dart';
import 'package:farm/service/fruits_data.dart';
import 'package:farm/service/milk_data.dart';
import 'package:farm/service/vegetables_data.dart';
import 'package:farm/service/widget_support.dart';
import 'package:farm/service/yogurt_data.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState()=> _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<MilkModel> milk=[];
  List<YogurtModel> yogurt=[];
  List<VegetablesModel> vegetables=[];
  List<FruitsModel> fruits=[];
  String track = "0";

  @override
  void initState(){
    categories = getCategories();
    milk=getMilk();
    yogurt=getYogurt();
    vegetables=getVegetables();
    fruits=getFruits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFBF0),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      height: 80,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Healthy food, happy family!",
                      style: AppWidget.homeTextFeildStyle()
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/boy.jpg",
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFF0F4E3),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search favorites...",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFAED581),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30.0,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index){
                  return CategoryTitle(
                    categories[index].name!,
                    categories[index].image!,
                    index.toString()
                  );
                }
              ),
            ),
            SizedBox(height: 10.0,),
            track=="0"? Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 5.0, left: 5.0),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                    itemCount: milk.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.785,
                        mainAxisSpacing: 25.0,
                        crossAxisSpacing: 3.0
                      ),
                      itemBuilder: (context, index){
                        return ProductTitle(milk[index].name!, milk[index].image!, milk[index].price!);
                      }
                  ),
              ),
            ):track=="1"? Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 5.0, left: 5.0),
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: yogurt.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.785,
                        mainAxisSpacing: 25.0,
                        crossAxisSpacing: 3.0
                    ),
                    itemBuilder: (context, index){
                      return ProductTitle(yogurt[index].name!, yogurt[index].image!, yogurt[index].price!);
                    }
                ),
              ),
            ):track=="2"? Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 5.0, left: 5.0),
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: vegetables.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.785,
                        mainAxisSpacing: 25.0,
                        crossAxisSpacing: 3.0
                    ),
                    itemBuilder: (context, index){
                      return ProductTitle(vegetables[index].name!, vegetables[index].image!, vegetables[index].price!);
                    }
                ),
              ),
            ):track=="3"? Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 5.0, left: 5.0),
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: fruits.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.785,
                        mainAxisSpacing: 25.0,
                        crossAxisSpacing: 3.0
                    ),
                    itemBuilder: (context, index){
                      return ProductTitle(fruits[index].name!, fruits[index].image!, fruits[index].price!);
                    }
                ),
              ),
            ):Container(),
          ],
        ),
      ),
    );
  }

  Widget ProductTitle(String name, String image, String price){
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black38), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            name,
            style: AppWidget.boldTextFeildStyle(),
          ),
          Text(
            price,
            style: AppWidget.priceTextFeildStyle(),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(name: name, image: image, price: price)));
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFFAED581),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(20))
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget CategoryTitle(String name, String image, String categoryindex){
    return GestureDetector(
        onTap: () {
          track = categoryindex.toString();
          setState(() {

          });
        },
        child: track==categoryindex? Container(
          margin: EdgeInsets.only(right: 20.0, bottom: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                  color: Color(0xFFAED581),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    name,
                    style: AppWidget.whiteTextFeildStyle(),
                  )
                ],
              ),
            ),
          ),
        ):
        Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          margin: EdgeInsets.only(right: 20.0, bottom: 10.0),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10.0,),
              Text(
                name,
                style: AppWidget.whiteTextFeildStyle(),
              )
            ],
          ),
        )
    );
  }
}