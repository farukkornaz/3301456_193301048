import 'package:flutter/material.dart';

import 'package:arya_manga/FireStore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'models/Manga.dart';
import 'package:arya_manga/models/Chapter.dart';

import 'pages/SplashScreen.dart';

Future<void> main() async {

  Chapter testChapter1 = Chapter(
      chapterName: "testchapterName",
      chapterNo: 1,
      parentMangaId: 1,
      image: ["image1","image2"]);

  Chapter testChapter2 = Chapter(
      chapterName: "testchapterName2",
      chapterNo: 2,
      parentMangaId: 1,
      image: ["image3","image4"]);


  Manga testManga = Manga(
      title: "testMangaNeme",
      author: "Testauthor",
      description: "description",
      chapters: [testChapter1, testChapter2],
      tags: ["tag1", "tag2"],
      image: "image");

  /*Manga testManga2 = Manga(
      title: "testMangaNeme2",
      author: "Testauthor2",
      description: "description2",
      chapters: [testChapter1, testChapter2],
      tags: ["tag3", "tag2"],
      image: "image");*/







  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FireStore.addManga(manga: testManga);
  //FireStore.addManga(manga: testManga2);

  //List<Manga> allManga = await FireStore.fetchManga();
  List<Manga>? selectedMangas = await FireStore.fetchMangaByTag(tags: ["tag2"]);

  if(selectedMangas != null){
    for(int i=0; i<selectedMangas.length; i++){
      print(selectedMangas[i].title);
    }
  }


  runApp(const AryaManga());
}

class AryaManga extends StatelessWidget {
  const AryaManga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

