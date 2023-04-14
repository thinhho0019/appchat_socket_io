import 'package:appchat/cubits/cubit/cubit_login_cubit.dart';
import 'package:appchat/utils/global.color.dart';
import 'package:appchat/utils/google_sign_in.dart';
import 'package:appchat/utils/key_shared.dart';
import 'package:appchat/utils/sharedpreference.dart';
import 'package:appchat/view/bottom_navigation.dart';
import 'package:appchat/view/widget/ButtonGlobal.dart';
import 'package:appchat/view/widget/FormGlobal.dart';
import 'package:appchat/view/widget/FormGlobalPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});
  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  final TextEditingController emailControler = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  SignInWithGoogle signInWithGoogle = SignInWithGoogle();

  String welcome = "hello signIn now";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signInWithGoogle.initGoogleLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ChatTT",
                  style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: [
                        Text(
                          "ĐĂNG NHẬP VỚI TÀI KHOẢN",
                          style: TextStyle(
                              color: GlobalColors.textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                FormGlobal(
                    controller: emailControler,
                    obscure: false,
                    text: "Email",
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: 10,
                ),
                FormGlobalPassword(
                    controller: passwordController,
                    obscure: false,
                    text: "Password",
                    textInputType: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                ButtonGlobal(text: "ĐĂNG NHẬP"),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Hoặc đăng nhập với mạng xã hội -',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getString();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        width: 50,
                        height: 55,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/images/google.svg',
                          height: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        signInWithGoogle.signOut();
                        showSnackbar("log out");
                      },
                      child: Container(
                        height: 55,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/images/facebook.svg',
                          height: 30,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future getString() async {
    await signInWithGoogle.googleLogin();
    welcome = signInWithGoogle.emailName.toString();
    String urlImage = signInWithGoogle.urlImage.toString();
    String displayName = signInWithGoogle.nameUser.toString();
    sharedPreferences.setString(keyShared.GOOGLEIMAGE, urlImage);
    sharedPreferences.setString(keyShared.GOOGLEGMAIL, welcome);
    sharedPreferences.setString(keyShared.GOOGLENAMEDISPLAY, displayName);
    showSnackbar(welcome);
    if (!welcome.isEmpty) {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation(),));
      context.read<CubitLoginCubit>().login();
    }
  }

  void showSnackbar(String title) {
    final snackBar = SnackBar(
      content: Text(title!),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
