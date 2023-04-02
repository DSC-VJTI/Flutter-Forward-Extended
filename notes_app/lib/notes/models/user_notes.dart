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
    } catch(e) {
      print(e.toString());
    }
  }
}
