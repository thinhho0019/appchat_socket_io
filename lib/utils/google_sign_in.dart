import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class SignInWithGoogle {
  GoogleSignInAccount? googleUser;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String? emailName;
  String? nameUser;
  String? urlImage;
  void initGoogleLogin(){
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account){
        googleUser = account;

      if(googleUser!= null){
        // Perform your action
      }
      googleSignIn.signInSilently();
    });
  }
  Future<UserCredential> googleLogin() async{
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    this.emailName = googleUser!.email;
    this.urlImage = googleUser!.photoUrl;
    this.nameUser = googleUser!.displayName;
    final GoogleSignInAuthentication? googleAuth =  await googleUser!.authentication;

    final credential =  GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  
  Future<void> signOut() async {
    googleSignIn.disconnect();
  }
}