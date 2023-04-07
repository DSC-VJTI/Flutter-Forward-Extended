// ignore_for_file: must_be_immutable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/login/login.dart';
import 'package:notes_app/notes/notes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          isLoggedIn = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const Notes() : const Login(),
    );
  }
}
