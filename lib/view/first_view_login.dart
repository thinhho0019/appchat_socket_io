import 'dart:async';

import 'package:appchat/cubits/cubit/cubit_login_cubit.dart';
import 'package:appchat/goRouter/app_route.dart';
import 'package:appchat/utils/global.color.dart';
import 'package:appchat/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FirstViewLogin extends StatelessWidget {
  FirstViewLogin();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailControler;
    Timer(const Duration(seconds: 1), (() {
      context.read<CubitLoginCubit>().unknowns();
    }));
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: const Center(
          child: Text(
        "ChatTT",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      )),
    );
  }
}
