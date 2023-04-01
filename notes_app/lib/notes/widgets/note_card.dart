// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_app/notes/models/note_model.dart';
import 'package:notes_app/utils/notes_theme.dart';

class NoteCard extends StatelessWidget {
  NoteCard(
      {super.key,
      required this.model,
      required this.isFirst,
      required this.isLast});
  NoteModel model;
  bool isFirst;
  bool isLast;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    BorderRadiusGeometry radiusGeometry = BorderRadius.circular(0);

    if (isFirst && isLast) {
      radiusGeometry = BorderRadius.circular(10);
    } else if (isFirst && !isLast) {
      radiusGeometry = const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10));
    } else if (!isFirst && isLast) {
      radiusGeometry = const BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      decoration: BoxDecoration(
          color: NotesTheme.slightBlack, borderRadius: radiusGeometry),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 1),
            child: Text(
              model.title!.length > 20
                  ? model.title!.substring(0, 20)
                  : model.title!,
              style:
                  NotesTheme.appText(size: width / 23, weight: FontWeight.w800),
            ),
          ),
          Row(
            children: [
              Text(
                model.date!,
                style: NotesTheme.appText(
                  size: width / 24,
                  color: Colors.grey,
                  weight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: width / 30,
              ),
              Text(
                model.description!.length > 10
                    ? model.description!.substring(0, 10)
                    : model.description!,
                overflow: TextOverflow.clip,
                style: NotesTheme.appText(
                  size: width / 24,
                  color: Colors.grey,
                  weight: FontWeight.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
