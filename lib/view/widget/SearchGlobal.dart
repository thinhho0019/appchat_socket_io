import 'package:appchat/utils/global.color.dart';
import 'package:flutter/material.dart';

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({
    Key? key,
    required this.txtControllerSearch,
  }) : super(key: key);

  final TextEditingController txtControllerSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), 
            ),
          ],
          borderRadius: BorderRadius.circular(18),
          color: GlobalColors.backgroundSearch),
      child: TextField(
        controller: txtControllerSearch,
        style: TextStyle(fontSize: 15),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Tìm kiếm",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}