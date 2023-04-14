import 'package:appchat/goRouter/app_route.dart';
import 'package:appchat/utils/global.color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class FriendsScreen extends StatelessWidget {
  final int currentIndex;
  const FriendsScreen({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(top: 25, left: 30),
                      child: Text(
                        "Bạn bè",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),
                ),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: GlobalColors.backgroundAddFriends,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius:2,
                        blurRadius:9,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 22, right: 17),
                  child: IconButton(
                      onPressed: () {
                        context.go(AppRoute.VIEWSEARCH);
                         
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: Icon(
                        Icons.person_add,
                        size: 18,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
