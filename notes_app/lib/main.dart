import 'package:flutter/material.dart';
import 'package:notes_app/notes/notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      home: Notes(),
    );
  }
}
