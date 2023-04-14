import 'dart:convert';

import 'package:appchat/utils/key_shared.dart';
import 'package:appchat/utils/sharedpreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class testChat extends StatelessWidget {
  testChat({super.key});

  TextEditingController textController = TextEditingController();
  TextEditingController textControllerID = TextEditingController();
  TextEditingController textControllerToID = TextEditingController();
  late IO.Socket socket;
  @override
  Widget build(BuildContext context) {
    socket = IO.io('http://192.168.1.6:3000', <String, dynamic>{
      'transports': ['websocket']
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: textControllerID,
                decoration: InputDecoration(label: Text("nhập sender_id!!")),
              ),
            ),
            IconButton(
                onPressed: () {
                  socket.onConnect((data) {
                    socket.emit('join', textControllerID.text);
                  });
                },
                icon: Icon(Icons.connect_without_contact)),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: textControllerToID,
                decoration: InputDecoration(label: Text("nhập to_id!!")),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(label: Text("nhập gì đó!!")),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  final data = {
                    'from': textControllerID.text,
                    'to': textControllerToID.text,
                    'message': textController.text
                  };
                  final jsonData = json.encode(data);
                  socket.emit("send_message", data);
                },
                icon: Icon(Icons.send))
          ],
        ),
      ),
    );
  }
}
