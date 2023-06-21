import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/Manga.dart';

class FireAuth {
  static Future<Manga?> addManga({
    required Manga manga
  }) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final docRef = db.collection('Manga').doc();
      manga.id = docRef.id;
      docRef.set(manga.toJson());
    } catch (e) {
      print("FireAuth addManga kısmında hata meydana geldi.");
      print(e);
    }
    return manga;
  }
}