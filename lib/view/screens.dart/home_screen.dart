import 'package:appchat/utils/global.color.dart';
import 'package:appchat/utils/key_shared.dart';
import 'package:appchat/utils/sharedpreference.dart';
import 'package:appchat/view/widget/SearchGlobal.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  final int currentIndex;
  HomeScreen({Key? key, required this.currentIndex}) : super(key: key);
  TextEditingController txtControllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 0, left: 30),
              child: Text(
                "Đoạn chat",
                style: TextStyle(
                    
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              )),
          //search
          ContainerSearch(txtControllerSearch: txtControllerSearch)
        ],
      ),
    );
  }
}


