// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:notes_app/utils/notes_theme.dart';

class NotePadPage extends StatefulWidget {
  const NotePadPage({super.key});

  @override
  State<NotePadPage> createState() => _NotePadPageState();
}

class _NotePadPageState extends State<NotePadPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: NotesTheme.backgroundColor,
      appBar: AppBar(
        foregroundColor: NotesTheme.highlightColor,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: true,
      ),
    );
  }
}
