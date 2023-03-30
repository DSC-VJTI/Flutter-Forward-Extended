// ignore_for_file: non_constant_identifier_names

class NoteModel {
  String? title;
  String? date;
  String? description;
  String? note;
  String? note_id;

  NoteModel({this.title, this.note, this.note_id, this.description, this.date});

  Map<String, dynamic> toJson() {
    return {"date": DateTime.now().toString(), "note": note, "title": title};
  }
}
