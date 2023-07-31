import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterfirebase09/utils/firebase_helper.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  bool userStatus = false;
  @override
  void initState() {
    super.initState();
   userStatus  = fireBase_Helper.firebase.check_user();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
          () {
        Get.offAndToNamed(userStatus==true?"viewproduct":"login");
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Container(
        height: 150,
        width: 150,
        child: LoadingIndicator(
            indicatorType: Indicator.ballPulseRise
          ,
            colors: const [Color(0xff525753),Colors.blue,Colors.redAccent,Colors.orange,Colors.orangeAccent,Colors.black],
            pathBackgroundColor: Colors.yellow,
            strokeWidth: 2,
            backgroundColor: Colors.white,
        ),
      )),
    );
  }
}
