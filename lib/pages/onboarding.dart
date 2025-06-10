import 'package:farm/service/widget_support.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFBF0),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        spreadRadius: 12,
                        blurRadius: 30,
                        offset: Offset(0, 15),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset("assets/onboard.png"),
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  "Nature’s Best,\nStraight to You",
                  textAlign: TextAlign.center,
                  style: AppWidget.HeadlineTextFeildStyle(),
                ),
                SizedBox(height: 15,),
                Text("Craving fresh products straight from the farm?\nFarmly is here for you!",
                  textAlign: TextAlign.center,
                  style: AppWidget.SimpleTextFeildStyle(),
                ),
                SizedBox(height: 30.0,),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Color(0xFF33691E),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
