import 'package:farm/service/widget_support.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String name, image, price;
  DetailPage({required this.name, required this.image, required this.price});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1, totalPrice = 0;

  // Fiyatı "$3" gibi stringlerden temizleyip int'e çeviren yardımcı fonksiyon
  int getPrice() {
    return int.parse(widget.price.replaceAll("\$", ""));
  }

  @override
  void initState() {
    totalPrice = getPrice();
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
                  Material(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
