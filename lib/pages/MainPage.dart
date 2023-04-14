import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Chapter.dart';
import '../models/Manga.dart';
import 'MangaDetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Manga> mangas = [
    Manga(
      id: 1,
      title: 'Naruto',
      author: 'Masashi Kishimoto',
      description:
          'Naruto Uzumaki, tüm hayatı boyunca Hokage olmak için çalışır. Bu sırada, kötü niyetli kişilerle savaşır ve birçok zorlukla karşılaşır.',
      chapters: [
        Chapter(
          id: 1,
          chapterName: 'Chapter 1',
          chapterNo: 1,
          parentMangaId: 1,
          image: [
            'https://cm.blazefast.co/0a/7a/0a7afa4969de7a85c709ff980b1438c0.jpg',
            'https://cm.blazefast.co/ac/f0/acf064f7498f08e0ef2bb8e678029883.jpg',
            'https://cm.blazefast.co/03/85/0385f0a8328c26b2b0dcf5e432263dc5.jpg',
            'https://cm.blazefast.co/81/e4/81e41e0039ccc440191c8791c4441c39.jpg',
            'https://cm.blazefast.co/12/bf/12bf004749da015433bbb09af6a9075d.jpg',
            'https://cm.blazefast.co/f4/a3/f4a3f94d16180015f1e7ec0a73767385.jpg',
          ],
        ),
        Chapter(
          id: 2,
          chapterName: 'Chapter 2',
          chapterNo: 2,
          parentMangaId: 1,
          image: [
            'https://cm.blazefast.co/da/51/da51c44fb6f923550cfe9b2a61905ad6.jpg',
            'https://cm.blazefast.co/df/d5/dfd553fc4721ac6618c502ead17d7a0c.jpg',
            'https://cm.blazefast.co/b4/c3/b4c3f23c7c707b29bd89f3eaa448799f.jpg',
          ],
        ),
        Chapter(
          id: 3,
          chapterName: 'Chapter 3',
          chapterNo: 3,
          parentMangaId: 1,
          image: [
            'https://cm.blazefast.co/da/51/da51c44fb6f923550cfe9b2a61905ad6.jpg',
            'https://cm.blazefast.co/df/d5/dfd553fc4721ac6618c502ead17d7a0c.jpg',
            'https://cm.blazefast.co/b4/c3/b4c3f23c7c707b29bd89f3eaa448799f.jpg',
          ],
        ),
      ],
      tags: ['action', 'adventure', 'shounen'],
      image: 'https://z6c4t4d8.rocketcdn.me/wp-content/uploads/2022/08/naruto-kac-yasinda.jpg',
    ),
    Manga(
      id: 2,
      title: 'One Piece',
      author: 'Eiichiro Oda',
      description:
          'Monkey D. Luffy, bir korsandır ve tüm dünya hazinelerini bulmak için efsanevi bir maceraya atılır.',
      chapters: [
        Chapter(
          id: 4,
          chapterName: 'Chapter 1',
          chapterNo: 1,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/da/51/da51c44fb6f923550cfe9b2a61905ad6.jpg',
            'https://cm.blazefast.co/df/d5/dfd553fc4721ac6618c502ead17d7a0c.jpg',
            'https://cm.blazefast.co/b4/c3/b4c3f23c7c707b29bd89f3eaa448799f.jpg',
          ],
        ),
        Chapter(
          id: 5,
          chapterName: 'Chapter 2',
          chapterNo: 2,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/da/51/da51c44fb6f923550cfe9b2a61905ad6.jpg',
            'https://cm.blazefast.co/df/d5/dfd553fc4721ac6618c502ead17d7a0c.jpg',
            'https://cm.blazefast.co/b4/c3/b4c3f23c7c707b29bd89f3eaa448799f.jpg',
          ],
        ),
      ],
      tags: ['adventure', 'fantasy', 'shounen'],
      image: 'https://i.imgur.com/LqOWD2U.jpg',
    ),
    Manga(
      id: 3,
      title: 'Attack on Titan',
      author: 'Hajime Isayama',
      description:
          'Eren Yeager, insanları yiyen devler tarafından işgal edilen bir dünyada yaşar ve onları durdurmak için savaşır.',
      chapters: [
        Chapter(
          id: 6,
          chapterName: 'Chapter 1',
          chapterNo: 1,
          parentMangaId: 3,
          image: [
            'https://cm.blazefast.co/da/51/da51c44fb6f923550cfe9b2a61905ad6.jpg',
            'https://cm.blazefast.co/df/d5/dfd553fc4721ac6618c502ead17d7a0c.jpg',
            'https://cm.blazefast.co/b4/c3/b4c3f23c7c707b29bd89f3eaa448799f.jpg',
          ],
        ),
        Chapter(
          id: 7,
          chapterName: 'Chapter 2',
          chapterNo: 2,
          parentMangaId: 3,
          image: [
            'https://cm.blazefast.co/da/51/da51c44fb6f923550cfe9b2a61905ad6.jpg',
            'https://cm.blazefast.co/df/d5/dfd553fc4721ac6618c502ead17d7a0c.jpg',
            'https://cm.blazefast.co/b4/c3/b4c3f23c7c707b29bd89f3eaa448799f.jpg',
          ],
        ),
        Chapter(
          id: 8,
          chapterName: 'Chapter 3',
          chapterNo: 3,
          parentMangaId: 3,
          image: [
            'https://cm.blazefast.co/da/51/da51c44fb6f923550cfe9b2a61905ad6.jpg',
            'https://cm.blazefast.co/df/d5/dfd553fc4721ac6618c502ead17d7a0c.jpg',
            'https://cm.blazefast.co/b4/c3/b4c3f23c7c707b29bd89f3eaa448799f.jpg',
          ],
        ),
      ],
      tags: ['action', 'drama', 'horror'],
      image: 'https://i.imgur.com/WnNYnRA.jpg',
    ),
  ];

  List<String> tags = [
    'all',
    'action',
    'adventure',
    'drama',
    'fantasy',
    'horror',
    'shounen'
  ];

  String? selectedTag;
  List<Manga> listMangaByTag=[];

  @override
  Widget build(BuildContext context) {
    listMangaByTag.clear();
    if(selectedTag != null){

      if(selectedTag == 'all'){
        for(var item in mangas){
          listMangaByTag.add(item);
        }
      }

      for(var item in mangas){
        if(item.tags.contains(selectedTag)){
          listMangaByTag.add(item);
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manga App'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.33,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                Manga manga = mangas[index];
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          manga.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        manga.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(manga.author),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedTag = tags[index];
                      });
                    },
                    child: Text(tags[index]),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: selectedTag!=null ? listMangaByTag.length : mangas.length,
              itemBuilder: (context, index) {
                Manga manga =selectedTag!=null ? listMangaByTag[index] : mangas[index];
                //Manga manga = mangas[index];
                return ListTile(
                  leading: Image.network(
                    manga.image,
                    width: 50,
                  ),
                  title: Text(manga.title),
                  subtitle: Text(manga.description),
                  onTap: () {
                    // detay sayfasına git
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MangaDetailPage(manga: manga),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Manga oluşturma sayfasına git
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
