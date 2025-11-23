import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<User?> googleLogin(context) async {
  try {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final user = await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.pushReplacementNamed(context, "/diary");
    return user.user;
  } catch (e) {
    print(e);
    return null;
  }
}
