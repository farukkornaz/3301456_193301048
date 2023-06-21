import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/Manga.dart';
import 'models/TestManga.dart';

class FireStore {

  static void addManga({
    required TestManga manga
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
  }

  static Future<List<TestManga>> fetchManga() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    //bütün mangaları getirir.
    final snapshot = await db.collection('Manga').get();
    List<TestManga> mangas = snapshot.docs.map((e) => TestManga.fromSnapshot(e)).toList();

    //Future nesnesi donuyor stream builder gibi bir yerde kullanabilrisin.
    return mangas;
  }

  /*static Future<List<TestManga>> fetchMangaByTag({required List<String> tags}) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    //TODO: en son burada kaldın etiketlere göre mangalar getirilcek
    final snapshot = await db.collection('Manga').get();
    List<TestManga> mangas = snapshot.docs.map((e) => TestManga.fromSnapshot(e)).toList();

    //Future nesnesi donuyor stream builder gibi bir yerde kullanabilrisin.
    return mangas;
  }*/



}