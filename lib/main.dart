import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'routers/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '微信',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      initialRoute: Routers.indexRoute,
      defaultTransition: Transition.fade,
      getPages: Routers.routes,
    );
  }
}
