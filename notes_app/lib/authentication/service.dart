// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
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

      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print("Error Caught  :   $e\n");
      return false;
    }
    return true;
  }

  static Future<bool> singnInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
    } on FirebaseAuthException catch (e) {
      print("Error Caught  :   $e\n");
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password did not match')));
      }
      return false;
    }
    return true;
  }

  static Future<bool> newUserSignUp(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("Error Caught  :   $e\n");
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Provided already Exists')));
      }
      return false;
    } catch (e) {
      print("Error Caught  :   $e\n");
      return false;
    }
    return true;
  }

  static Future<bool> signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      if (auth.currentUser!.displayName != null) {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        googleSignIn.signOut();
      }
      auth.signOut();
    } catch (e) {
      print("Error Caught  :   $e\n");
      return false;
    }
    return true;
  }
}
