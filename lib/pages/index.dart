import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import './home.dart';
import './friend.dart';
import './found.dart';
import './profile.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
  }

  int _cur = 0;
  final List<StatefulWidget> _listRouter = const [
    Home(),
    Friend(),
    Found(),
    Profile()
  ];

  // final List<IconData?> _listIcons = const [
  //   Icons.add_circle_outline,
  //   Icons.playlist_add,
  //   null,
  //   null,
  // ];

  // var _icon = Icons.add_circle_outline;

  _onTap(i) {
    setState(() {
      _cur = i;
      // _icon = _listIcons[i]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _cur == 0
            ? const Text('信息')
            : _cur == 1
                ? const Text('目录')
                : _cur == 2
                    ? const Text('发现')
                    : const Text(''),
        backgroundColor: Colors.black87,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: _cur == 0
                ? const Icon(Icons.add_circle_outline)
                : _cur == 1
                    ? const Icon(Icons.playlist_add)
                    : const Icon(null),
          )
        ],
      ),
      body: _listRouter[_cur],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _cur,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.green,
          backgroundColor: Colors.black87,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.speaker_notes),
              label: "信息",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storage),
              label: "目录",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.voicemail),
              label: "发现",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "我",
            ),
          ]),
    );
  }
}
