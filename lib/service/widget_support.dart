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
      color: Color(0xFF12195A),
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

  static TextStyle SignUpTextFeildStyle(){
    return TextStyle(
        color: const Color.fromARGB(174, 0, 0, 0),
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle AlreadyTextFeildStyle(){
    return TextStyle(
      fontSize: 20.0,
      color: Color(0xFF151E6A),
    );
  }

  static TextStyle logInSignUpTextFeildStyle(){
    return TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF151E6A),
    );
  }

  static TextStyle logInSignUpButtonTextFeildStyle(){
    return TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}