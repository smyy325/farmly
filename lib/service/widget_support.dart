import 'dart:ui';
import 'package:flutter/material.dart';

class AppWidget{
  static TextStyle HeadlineTextFeildStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 35.0,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle SimpleTextFeildStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    );
  }

  static TextStyle homeTextFeildStyle(){
    return TextStyle(
      color: Color(0xFF1A237E),
      fontSize: 15.0,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle whiteTextFeildStyle(){
    return TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle boldTextFeildStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 22.0,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle priceTextFeildStyle(){
    return TextStyle(
      color: const Color.fromARGB(174, 0, 0, 0),
      fontSize: 24.0,
      fontWeight: FontWeight.bold
    );
  }
}