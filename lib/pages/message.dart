import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../componentes/Card60s.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  var resMsg;

  //var data = {};
  var card = {
    "Card60s": const Card60s(),
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resMsg = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resMsg['title']!),
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call_to_action),
          )
        ],
      ),
      body: card[resMsg['template']],
    );
  }
}
