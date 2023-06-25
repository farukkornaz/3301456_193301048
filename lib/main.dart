import 'package:arya_manga/FireStore.dart';
import 'package:arya_manga/models/TestChapter.dart';
import 'package:arya_manga/models/TestManga.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/SplashScreen.dart';

Future<void> main() async {

  TestChapter testChapter1 = TestChapter(
      chapterName: "testchapterName",
      chapterNo: 1,
      parentMangaId: 1,
      image: ["image1","image2"]);

  TestChapter testChapter2 = TestChapter(
      chapterName: "testchapterName2",
      chapterNo: 2,
      parentMangaId: 1,
      image: ["image3","image4"]);


  TestManga testManga = TestManga(
      title: "testMangaNeme",
      author: "Testauthor",
      description: "description",
      chapters: [testChapter1, testChapter2],
      tags: ["tag1", "tag2"],
      image: "image");

  TestManga testManga2 = TestManga(
      title: "testMangaNeme2",
      author: "Testauthor2",
      description: "description2",
      chapters: [testChapter1, testChapter2],
      tags: ["tag3", "tag2"],
      image: "image");







  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //FireStore.addManga(manga: testManga);
  //FireStore.addManga(manga: testManga2);

  //List<TestManga> allManga = await FireStore.fetchManga();
  List<TestManga>? selectedMangas = await FireStore.fetchMangaByTag(tags: ["tag2"]);

  if(selectedMangas != null){
    for(int i=0; i<selectedMangas!.length; i++){
      print(selectedMangas[i]!.title);
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

