import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app/notes/models/note_model.dart';

class UserNotes {
  static Future<List<NoteModel>?> getNotes() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore db = FirebaseFirestore.instance;

    try {
      final String uid = auth.currentUser!.uid;

      final QuerySnapshot<Map<String, dynamic>> notes =
          await db.collection("Users").doc(uid).collection("Notes").get();
      return notes.docs
          .map((e) => NoteModel.fromQueryDocumentSnapshot(e))
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> addNote(NoteModel note) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final String uid = auth.currentUser!.uid;
      final String note_id = note.note_id!;

      final Map<String, dynamic> data = note.toJson();

      final FirebaseFirestore db = FirebaseFirestore.instance;
      await db
          .collection("Users")
          .doc(uid)
          .collection("Notes")
          .doc(note_id)
          .set(data);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> deleteNote(NoteModel note) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final String uid = auth.currentUser!.uid;
      final String note_id = note.note_id!;
      final FirebaseFirestore db = FirebaseFirestore.instance;

      db.collection("Users").doc(uid).collection("Notes").doc(note_id).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
