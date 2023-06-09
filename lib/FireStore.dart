import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/Manga.dart';

class FireStore {

  static void addManga({
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
  }

  static Future<List<Manga>> fetchManga() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    //bütün mangaları getirir.
    final snapshot = await db.collection('Manga').get();
    List<Manga> mangas = snapshot.docs.map((e) => Manga.fromSnapshot(e)).toList();

    //Future nesnesi donuyor stream builder gibi bir yerde kullanabilrisin ya da await fetchManga() diyip
    // List<Manga> nesnesine atayabilirsin.
    return mangas;
  }

  static Future<List<Manga>?> fetchMangaByTag({required List<String> tags}) async {

    final List<Manga> mangas = await fetchManga();
    List<Manga>? selectedMangas = <Manga>[];

    bool flag=false;

    for(int i=0; i<mangas.length; i++){
      for(int j=0; j<mangas[i].tags.length; j++){
        for(int k=0; k<tags.length; k++) {
          if (mangas[i].tags[j] == tags[k]) {
            flag = true;
            break;
          }
        }
        if(flag){
          flag = false;
          selectedMangas.add(mangas[i]);
          break;
        }
      }
    }

    /*FirebaseFirestore db = FirebaseFirestore.instance;
    //TODO: en son burada kaldın etiketlere göre mangalar getirilcek
    final snapshot = await db.collection('Manga').get();
    List<TestManga> mangas = snapshot.docs.map((e) => TestManga.fromSnapshot(e)).toList();*/

    //Future nesnesi donuyor stream builder gibi bir yerde kullanabilrisin.
    return selectedMangas;
  }



}