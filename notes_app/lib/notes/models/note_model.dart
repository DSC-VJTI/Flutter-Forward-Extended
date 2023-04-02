// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String? title;
  String? date;
  String? description;
  String? note;
  String? note_id;

  NoteModel({this.title, this.note, this.note_id, this.description, this.date});

  factory NoteModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final String note_id = doc.id;
    final Map<String, dynamic> data = doc.data();
    final String title = data['title'];
    final String date = data['date'];
    final String note = data['note'];
    final String description = note.trim().split("\n").length > 1
        ? note.split("\n")[1]
        : note.split("\n")[0];

    return NoteModel(
      title: title,
      date: date,
      description: description,
      note: note,
      note_id: note_id,
    );
  }

  Map<String, dynamic> toJson() {
    return {"date": date, "note": note, "title": title};
  }
}
