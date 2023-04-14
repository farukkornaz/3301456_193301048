import 'package:arya_manga/models/Manga.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Chapter.dart';

class MangaChapterPage extends StatelessWidget {
  final Chapter chapter;
  final Manga manga;

  const MangaChapterPage({Key? key, required this.chapter, required this.manga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.chapterName),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {},
                      ),
                      const Text("Önceki Bölüm"),
                    ],
                  ),
                  onTap: () {
                    var chapter = manga.chapters.where((element) => element.chapterNo==chapter.chapterNo+1);


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MangaChapterPage(chapter: chapter, manga: manga,),
                      ),
                    );
                  },
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Row(
                  children: [
                    const Text("sonraki bölüm"),
                    IconButton(
                      onPressed: () {
                        // sonraki bölüme gitmek için gerekli kodlar
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chapter.image.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // resmin tam boyutlu hali için gerekli kodlar
                    },
                    child: Image.network(
                      chapter.image[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
