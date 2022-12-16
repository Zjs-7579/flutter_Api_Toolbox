import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Card60s extends StatefulWidget {
  const Card60s({Key? key}) : super(key: key);

  @override
  _Card60sState createState() => _Card60sState();
}

class _Card60sState extends State<Card60s> {
  final _cardData = [];
  final List<Widget> _cardWidget = [];

  _getResult() async {
    var url = Uri.parse("https://api.vvhan.com/api/60s?type=json");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      setState(() {
        var data = json.decode(response.body);
        var obj = {
          "time":
              data['time'][0] + "/" + data['time'][1] + "/" + data['time'][2],
          "img": data['imgUrl'],
          "data": data['data'],
        };
        _cardData.add(obj);
        // var len = _cardData.length - 1;
        _widgetList(_cardData.length - 1);
      });
    }
  }

  _widgetList(len) {
    setState(() {
      _cardWidget.add(
        SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Text(
                  _getDate().substring(0, 16),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: SizedBox(
                  //width: double.infinity,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("每天60秒读懂世界"),
                        subtitle: Text(
                          _cardData[len]['time'],
                          style: const TextStyle(fontSize: 10),
                        ),
                        trailing: TextButton(
                          onPressed: () {
                            //print(_cardData[len]);
                            Get.toNamed("/images",
                                arguments: {"img": _cardData[len]['img']});
                          },
                          child: const Icon(Icons.wallpaper),
                        ),
                      ),
                      SizedBox(
                        child:
                            Column(children: _itemData(_cardData[len]['data'])),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _itemData(data) {
    final List<Widget> list = [];
    for (var i = 0; i < data.length; i++) {
      list.add(ListTile(
        leading: Text(
          "${i + 1}",
        ),
        title: Text(data[i]),
      ));
    }

    return list;
  }

  _getDate() {
    return DateTime.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black87,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          //最主要的代码块Expanded这块
          Expanded(
              flex: 19,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Column(children: _cardWidget),
              )),
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.black38,
                child: OutlinedButton(
                  onPressed: () {
                    _getResult();
                  },
                  child: const Text(
                    "获取",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
