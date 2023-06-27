import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Chapter.dart';
import '../models/Manga.dart';

class MangaCreationPage extends StatefulWidget {
  @override
  _MangaCreationPageState createState() => _MangaCreationPageState();
}

class _MangaCreationPageState extends State<MangaCreationPage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late String mangaName;
  late String mangaAuthor;
  late String mangaDescription;
  late String mangaImage;

  List<String> mangaGenres = [
  'all',
  'action',
  'adventure',
  'drama',
  'fantasy',
  'horror',
  'shounen'
  ];
  List<String> selectedGenres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Manga Oluştur'),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Manga İsmi',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Manga ismini giriniz';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    mangaName = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Yazar İsmi',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Yazar ismini giriniz';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    mangaAuthor = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Manga Açıklaması',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'lütfen manga açıklamasını giriniz';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    mangaDescription = value!;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Manga Kapağı',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'boş bırakılamaz';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    mangaImage = value!;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Genres', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Column(
                  children: mangaGenres.map((genre) {
                    return CheckboxListTile(
                      title: Text(genre),
                      value: selectedGenres.contains(genre),
                      onChanged: (selected) {
                        setState(() {
                          if (selected == true) {
                            selectedGenres.add(genre);
                          } else {
                            selectedGenres.remove(genre);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text('Kaydet'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Burada, kaydedilen verileri kullanarak yeni bir Manga nesnesi oluştu.
                      // Örneğin:
                      print(selectedGenres);
                      Manga newManga = Manga(
                          title: "test",
                          author: "test",
                          description: "test",
                          chapters: TempChapter(),
                          tags: selectedGenres,
                          image: mangaImage);

                      // Yeni Manga nesnesini kullanarak başka işlemler yapabilirsiniz.
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TempChapter() {
    List<Chapter> chapters = [Chapter(
        isTemp: true, chapterName: "", chapterNo: -1, parentMangaId: -1, image: [""])];
    return chapters;
  }
}
