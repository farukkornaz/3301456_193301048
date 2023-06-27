import 'package:arya_manga/models/Manga.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Chapter.dart';

class MangaChapterPage extends StatelessWidget {
  final Chapter chapter;
  final Manga manga;

  const MangaChapterPage({Key? key, required this.chapter, required this.manga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    // burada önceki ve sonraki bölümü bulamazsa orElse fonksiyonu boş bir
    // bölüm döner. bu boş bölümümn fieldlarını kontrol ederek sayfa düzenlenir.
    Chapter? previousChapter = manga.chapters!=null ? manga.chapters!.firstWhere(
        (element) => element.chapterNo == chapter.chapterNo - 1,
        orElse: () => createTempChapter()): null;

    Chapter? nextChapter = manga.chapters!=null ? manga.chapters!.firstWhere(
        (element) => element.chapterNo == chapter.chapterNo + 1,
        orElse: () => createTempChapter()): null;

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
                previousChapter != null ?
                GestureDetector(
                  child: previousChapter.chapterNo != -1
                      ? Row(
                          children: const [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.indigo,
                            ),
                            Text("Önceki Bölüm"),
                          ],
                        )
                      : Row(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MangaChapterPage(
                            chapter: previousChapter, manga: manga),
                      ),
                    );
                  },
                ): const SizedBox(),
                const Expanded(
                  child: SizedBox(),
                ),
                nextChapter!=null ?
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MangaChapterPage(
                            chapter: nextChapter, manga: manga),
                      ),
                    );
                  },
                  child: nextChapter.chapterNo != -1 ? Row(
                    children: const [
                      Text("sonraki bölüm"),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.indigo,
                      ),
                    ],
                  ) : Row(),
                ) : const SizedBox(),
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

  createTempChapter() {
    return Chapter(
        isTemp: true,chapterName: "", chapterNo: -1, parentMangaId: -1, image: [""]);
  }
}
