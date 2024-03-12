import 'dart:async';
import 'package:flutter/material.dart';
import 'package:student/login_page.dart';


class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  
  @override
  void initState() {
    Timer(const Duration(seconds:  3 ), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_Page()));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text("Splash Screen"),
        ),
    );
  }
}
