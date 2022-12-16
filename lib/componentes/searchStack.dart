import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStack extends StatelessWidget {
  const SearchStack({Key? key}) : super(key: key);

  _onTab() {
    Get.toNamed("/search");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTab,
      child: SizedBox(
        width: double.infinity,
        height: 64,
        //color: Colors.black,
        child: Stack(
          children: [
            Positioned(
                top: 10,
                left: 12,
                right: 12,
                child: Container(
                  // width: double.infinity,
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(31, 116, 114, 114),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.search,
                        color: Color.fromARGB(96, 87, 87, 87),
                      ),
                      Text(
                        "搜索",
                        style: TextStyle(color: Color.fromARGB(96, 87, 87, 87)),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
