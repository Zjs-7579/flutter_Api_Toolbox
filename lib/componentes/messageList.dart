import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import './searchStack.dart';
import '../componentes/data.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  //List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<Widget> resList = [const SearchStack()];
  _doNothing(context) {
    print("object");
  }

  _onTabMessage(data) {
    print("--------$data---------");
    //var id = data.id;
    //Get.toNamed("/message/$id");
  }

  _resMeg() {
    for (var i = 0; i < Store.data.length; i++) {
      var data = Store.data[i];

      resList.add(
        Container(
          height: 80,
          // padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          width: double.infinity,
          color: const Color.fromARGB(31, 116, 114, 114),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  padding: const EdgeInsets.all(10),
                  onPressed: _doNothing,
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  //icon: Icons.archive,
                  label: '取消关注',
                ),
                SlidableAction(
                  onPressed: _doNothing,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  //icon: Icons.save,
                  label: '删除',
                ),
              ],
            ),
            child: ListTile(
              onTap: (() =>
                  Get.toNamed("/message/${data['id']!}", arguments: data)),
              textColor: Colors.white,
              leading: Image.network(
                data['icon']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              trailing: Text(
                data['date']!,
                style: const TextStyle(
                    fontSize: 9, color: Color.fromARGB(255, 149, 143, 143)),
              ),
              subtitle: Text(data['desc']!),
              title: Text(data['title']!),
            ),
          ),
        ),
      );
      resList.add(const Divider(
        height: 0.1,
        color: Color.fromARGB(255, 47, 46, 46),
      ));
    }

    return resList;
  }

  doNothing() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromARGB(31, 184, 182, 182),
      height: double.infinity,
      //decoration: const BoxDecoration(color: Color.fromARGB(31, 116, 114, 114)),
      // child: ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: list.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(title: Text("------$list[index]-------"));
      //   },
      // ),
      child: ListView(
        children: _resMeg(),
      ),
    );
  }
}
