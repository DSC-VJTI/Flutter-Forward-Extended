// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static Future<bool> signInWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential);
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
    return true;
  }

  static Future<bool> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
      return false;
    }
    return true;
  }

  static Future<bool> signInNewUserEmail(String email, String password) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
      return false;
    }
    return true;
  }

  static Future<bool> signOut({bool isGoogleLogin = false}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      if (isGoogleLogin) {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        googleSignIn.signOut();
      }
      auth.signOut();
    } catch (e) {
      print(e.toString());
      return false;
    }
    return true;
  }
}
