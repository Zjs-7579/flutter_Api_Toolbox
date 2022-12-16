import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './index.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      //print("object");
      //Get.toNamed("/");
      Get.off(const Index());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        "images/loading.gif",
        fit: BoxFit.cover,
      ),
    );
  }
}
