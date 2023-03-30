import 'package:flutter/material.dart';
import 'package:notes_app/utils/notes_theme.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: NotesTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: NotesTheme.highlightColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          "All Notes",
          style: NotesTheme.appText(
              size: width / 11,
              weight: FontWeight.bold,
              color: NotesTheme.highlightColor),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "5 Notes",
              style: NotesTheme.appText(
                  size: width / 30, weight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
