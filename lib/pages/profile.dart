import 'package:farm/pages/onboard.dart';
import 'package:farm/service/shared_pref.dart';
import 'package:flutter/material.dart';
import '../service/widget_support.dart';
import '../service/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name, email;

  getthesharedpref() async {
    name = await SharedpreferenceHelper().getUserName();
    email = await SharedpreferenceHelper().getUserEmail();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getthesharedpref();
  }

  Widget profileCard(IconData icon, String title, String value) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFAED581),),
          SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 5.0),
              Text(value,
                  style: AppWidget.boldTextFeildStyle().copyWith(fontSize: 16))
            ],
          )
        ],
      ),
    );
  }

  Widget actionButton(String text, IconData icon, VoidCallback onTap,
      {Color color = Colors.redAccent}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 26),
            SizedBox(width: 18.0),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: text == "Delete Account" ? 18.0 : 16.0,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF0F4E3),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                child: Text(
                  "Profile",
                  style: AppWidget.HeadlineTextFeildStyle(),
                ),
              ),
            ),

            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/boy.jpg"),
            ),
            SizedBox(height: 20.0),
            profileCard(Icons.person, "Name", name ?? "Loading..."),
            profileCard(Icons.email, "Email", email ?? "Loading..."),
            actionButton("LogOut", Icons.logout, () async {
              await AuthMethods().SignOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Onboard()),
              );
            }),
            actionButton("Delete Account", Icons.delete,  () async {
              await AuthMethods().deleteuser();
              Navigator.pushReplacementNamed(context, "/signin");
            }, color: Color(0xFFAED581),),
          ],
        ),
      ),
    );
  }
}
