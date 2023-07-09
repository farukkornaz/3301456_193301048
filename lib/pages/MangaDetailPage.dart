import 'package:arya_manga/pages/MangaChapterPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Chapter.dart';
import '../models/Manga.dart';
import 'ChapterCreationPage.dart';

class MangaDetailPage extends StatelessWidget {
  final Manga manga;

  const MangaDetailPage({Key? key, required this.manga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        shadowColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChapterCreationPage(manga),
            ),
          );}),
        ],
        centerTitle: true,
        title: Text(manga.title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Manga Açıklaması',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              Text(
                manga.description,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                "Yazar: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                manga.author,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Bölümler',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: manga.chapters != null ? manga.chapters!.length : 0,
              itemBuilder: (BuildContext context, int index) {
                Chapter chapter = manga.chapters![index];
                return ListTile(
                  title: Text(chapter.chapterNo.toString()),
                  subtitle: Text(chapter.chapterName),
                  leading: Image.network(chapter.image[0]),
                  onTap: () {
                    // bölüm sayfasına git
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MangaChapterPage(
                          chapter: chapter,
                          manga: manga,
                        ),
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
