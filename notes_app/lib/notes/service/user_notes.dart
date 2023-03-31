import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes_app/notes/models/note_model.dart';

class UserNotes {
  static void addNote(NoteModel note) {
    final userNote = note.toJson();

    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final String uid = auth.currentUser!.uid;
    try {
      db
          .collection("Users")
          .doc(uid)
          .collection("Notes")
          .doc(note.note_id)
          .set(userNote);
    } catch (e) {
      print(e);
    }
  }

  static Future<List<NoteModel>> getNotes() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final String uid = auth.currentUser!.uid;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("Users").doc(uid).collection("Notes").get();
    return querySnapshot.docs
        .map((e) => NoteModel.fromQueryDocumentSnapshot(e))
        .toList();
  }
}
