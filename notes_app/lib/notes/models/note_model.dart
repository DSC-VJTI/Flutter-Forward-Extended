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
    final String title = doc.data()['title'];
    final String note = doc.data()['note'];
    final String date = doc.data()["date"];
    final String description = note.trim().split("\n").length > 1
        ? note.split("\n")[1]
        : note.split("\n")[0];
    return NoteModel(
      title: title,
      note: note,
      date: date,
      description: description,
      note_id: doc.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {"date": date, "note": note, "title": title};
  }
}
