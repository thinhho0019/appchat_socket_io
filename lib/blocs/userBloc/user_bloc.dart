 
import 'dart:async';

import 'package:appchat/models/user_model.dart';
import 'package:bloc/bloc.dart';
 


class userBloc{

  final userController  = StreamController<List<userModel>>.broadcast();
  
  void dispose(){
    userController.close();
  }
}
userBloc userbloc = userBloc();
 