import '../pages/index.dart';
import '../pages/search.dart';
import '../pages/loading.dart';
import '../pages/message.dart';
import '../pages/images.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Routers {
  static const indexRoute = "/loading";

  static final routes = [
    GetPage(
      name: "/",
      page: () => const Index(),
    ),
    GetPage(
      name: "/loading",
      page: () => const Loading(),
    ),
    GetPage(
      name: "/search",
      page: () => const Search(),
    ),
    GetPage(
      name: "/message/:id",
      page: () => const Message(),
    ),
    GetPage(
      name: "/images",
      page: () => const Images(),
    ),
    // GetPage(
    //   name: "/friend",
    //   page: () => const Friend(),
    //   arguments: const {"cur": 1},
    // ),
    // GetPage(
    //   name: "/found",
    //   page: () => const Found(),
    //   arguments: const {"cur": 2},
    // ),
    // GetPage(
    //   name: "/profile",
    //   page: () => const Profile(),
    //   arguments: const {"cur": 3},
    // ),
  ];
}
