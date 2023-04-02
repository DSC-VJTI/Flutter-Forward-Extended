// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/notes/models/note_model.dart';
import 'package:notes_app/utils/notes_theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';

class NotePadPage extends StatefulWidget {
  NotePadPage({super.key, this.model});
  NoteModel? model;

  @override
  State<NotePadPage> createState() => _NotePadPageState();
}

class _NotePadPageState extends State<NotePadPage> {
  final TextEditingController _textFieldController = TextEditingController();
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    _textFieldController.text = widget.model?.note ?? "";
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

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
        actions: [
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () async {
                    if (_textFieldController.text.isNotEmpty) {
                      await Share.share(_textFieldController.text);
                    }
                  },
                  child: Icon(
                    CupertinoIcons.share,
                    size: width / 20,
                  )),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  if (widget.model != null) {
                    Navigator.pop(
                        context,
                        NoteModel(
                            date: widget.model!.date,
                            description: _textFieldController.text
                                        .trim()
                                        .split("\n")
                                        .length >
                                    1
                                ? _textFieldController.text.split("\n")[1]
                                : _textFieldController.text.split("\n")[0],
                            note_id: widget.model!.note_id,
                            title: _textFieldController.text.split("\n").first,
                            note: _textFieldController.text));
                  } else {
                    Navigator.pop(
                        context,
                        NoteModel(
                            date: DateFormat("dd/mm/yy kk:mm")
                                .format(DateTime.now()),
                            description: _textFieldController.text
                                        .trim()
                                        .split("\n")
                                        .length >
                                    1
                                ? _textFieldController.text.split("\n")[1]
                                : _textFieldController.text.split("\n")[0],
                            note_id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            title: _textFieldController.text.split("\n").first,
                            note: _textFieldController.text));
                  }
                },
                child: Text(
                  "Done",
                  style: NotesTheme.appText(
                      size: width / 22,
                      color: NotesTheme.highlightColor,
                      weight: FontWeight.w800),
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: TextField(
          focusNode: myFocusNode,
          cursorColor: NotesTheme.highlightColor,
          controller: _textFieldController,
          onTap: () {
            myFocusNode.requestFocus();
          },
          maxLines: MediaQuery.of(context).size.height.toInt(),
          textCapitalization: TextCapitalization.sentences,
          style:
              NotesTheme.appText(size: width / 23, weight: FontWeight.normal),
          decoration: null,
        ),
      ),
    );
  }
}
