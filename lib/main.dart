import 'package:appchat/cubits/cubit/cubit_login_cubit.dart';
import 'package:appchat/goRouter/app_page.dart';
import 'package:appchat/utils/sharedpreference.dart';
import 'package:appchat/view/bottom_navigation.dart';
import 'package:appchat/view/first_view_login.dart';
import 'package:appchat/view/login_view.dart';
import 'package:appchat/view/test_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPreferences.initPreference();
  await Firebase.initializeApp();
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).scaffoldBackgroundColor, // sử dụng màu chủ đạo của giao diện
      statusBarIconBrightness: Brightness.dark
    ));
    // return BlocProvider(
    //   create: (context) => CubitLoginCubit(),
    //   child: Builder(builder: (context) {
    //     return MaterialApp.router(
    //       debugShowCheckedModeBanner: false,
    //       theme:ThemeData(),
              
    //       routerConfig: AppPage(context.read<CubitLoginCubit>()).goRoute,
    //     );
    //   }),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: testChat(),
    );
  }
}
