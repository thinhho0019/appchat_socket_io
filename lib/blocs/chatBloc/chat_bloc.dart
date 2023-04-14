 import 'dart:async';

import 'package:appchat/models/message_model.dart';

class chatBloc {
  final chatController = StreamController<List<messageModel>>.broadcast();

  void dispose(){
      chatController.close();
  }
 }
 chatBloc chatbloc = chatBloc();