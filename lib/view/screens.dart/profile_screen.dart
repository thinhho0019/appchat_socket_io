import 'package:flutter/material.dart';
import 'package:appchat/utils/key_shared.dart';
import 'package:appchat/utils/sharedpreference.dart';

class ProfileScreen extends StatelessWidget {
  final int currentIndex;
  const ProfileScreen({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25, left: 20),
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(keyShared.GOOGLEIMAGE),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sharedPreferences
                            .getString(keyShared.GOOGLENAMEDISPLAY),
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        sharedPreferences.getString(keyShared.GOOGLEGMAIL),
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: 25),
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.logout))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
