import 'package:arya_manga/pages/MangaChapterPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Chapter.dart';
import '../models/Manga.dart';

class MangaDetailPage extends StatelessWidget {
  final Manga manga;

  const MangaDetailPage({Key? key, required this.manga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(manga.title),
      ),
      body: Column(
        children: [
          // manga detayları için widgetlar
          // ...
          const Text(
            'Bölümler',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: manga.chapters.length,
              itemBuilder: (BuildContext context, int index) {
                Chapter chapter = manga.chapters[index];
                return ListTile(
                  title: Text(chapter.chapterName),
                  subtitle: Text(chapter.chapterNo.toString()),
                  leading: Image.network(chapter.image[index]),
                  onTap: () {
                    // bölüm sayfasına git
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MangaChapterPage(chapter: chapter, manga: manga,),
                      ),
                    );

                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
