import 'package:farm/Admin/admin_login.dart';
import 'package:farm/Admin/all_order.dart';
import 'package:farm/Admin/home_admin.dart';
import 'package:farm/Admin/manage_users.dart';
import 'package:farm/pages/bottomnav.dart';
import 'package:farm/pages/detail_page.dart';
import 'package:farm/pages/home.dart';
import 'package:farm/pages/login.dart';
import 'package:farm/pages/onboarding.dart';
import 'package:farm/pages/profile.dart';
import 'package:farm/pages/signup.dart';
import 'package:farm/service/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=publishedKey;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Onboarding()
    );
  }
}
