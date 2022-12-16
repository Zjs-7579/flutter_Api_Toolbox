import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  var img;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    img = Get.arguments['img'];
    print("--------------");
    print(img);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: img,
      // width: double.infinity,
      // height: double.infinity,
      // color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PhotoView(imageProvider: NetworkImage(img)),
      ),
    );
  }
}
