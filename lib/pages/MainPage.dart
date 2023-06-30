import 'package:arya_manga/FireStore.dart';
import 'package:arya_manga/pages/MangaCreatePage.dart';
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
  late Future<List<Manga>> mangas;
  late List<Manga> MangaList;

  /*List<Manga> test = [
    Manga(
      title: 'Naruto',
      author: 'Masashi Kishimoto',
      description:
          'Naruto Uzumaki, tüm hayatı boyunca Hokage olmak için çalışır. Bu sırada, kötü niyetli kişilerle savaşır ve birçok zorlukla karşılaşır.',
      chapters: [
        Chapter(
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
      image: 'https://ww5.mangakakalot.tv/mangaimage/manga-ng952689.jpg',
    ),
    Manga(
      title: 'One Piece',
      author: 'Eiichiro Oda',
      description:
          'Monkey D. Luffy, bir korsandır ve tüm dünya hazinelerini bulmak için efsanevi bir maceraya atılır.',
      chapters: [
        Chapter(
          chapterName: 'Chapter 1',
          chapterNo: 1,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/47/68/476897725c39457a82dfaa3ded719699.jpg',
            'https://cm.blazefast.co/70/67/70676d543f510d03d5c8c5d1086c99c6.jpg',
            'https://cm.blazefast.co/9c/ce/9ccefa4aaafc23ac489cc199ea504541.jpg',
            'https://cm.blazefast.co/af/e1/afe169d88a294f6e4a1c040959c76962.jpg',
            'https://cm.blazefast.co/18/cf/18cf6739be1f96b951c0f0b4051030a4.jpg',
          ],
        ),
        Chapter(
          chapterName: 'Chapter 2',
          chapterNo: 2,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),
        Chapter(
          chapterName: 'Chapter 3',
          chapterNo: 3,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),
        Chapter(
          chapterName: 'Chapter 4',
          chapterNo: 4,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),
        Chapter(
          chapterName: 'Chapter 5',
          chapterNo: 5,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),
        Chapter(
          chapterName: 'Chapter 6',
          chapterNo: 6,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),
        Chapter(
          chapterName: 'Chapter 7',
          chapterNo: 7,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),
        Chapter(
          chapterName: 'Chapter 8',
          chapterNo: 8,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),

        Chapter(
          chapterName: 'Chapter 9',
          chapterNo: 9,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),
        Chapter(
          chapterName: 'Chapter 10',
          chapterNo: 10,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),
        Chapter(
          chapterName: 'Chapter 11',
          chapterNo: 11,
          parentMangaId: 2,
          image: [
            'https://cm.blazefast.co/d8/df/d8dfa5f1701efed1cce8e299f018c4f8.jpg',
            'https://cm.blazefast.co/1d/45/1d45861877446b91ed26e51f0fc404c0.jpg',
            'https://cm.blazefast.co/71/51/71514f9a503625b4c4aab5c67ada7e32.jpg',
            'https://cm.blazefast.co/1d/25/1d2553826c4926c49e98178c9dbd9ee4.jpg',
            'https://cm.blazefast.co/61/40/6140d5e909eb56b2a28938edf6c41d20.jpg',
            'https://cm.blazefast.co/21/12/21127dbdfe915613a0291b467cea8cc3.jpg',
          ],
        ),
      ],
      tags: ['adventure', 'fantasy', 'shounen'],
      image: 'https://ww5.mangakakalot.tv/mangaimage/manga-aa951409.jpg',
    ),
    Manga(
      title: 'Attack on Titan',
      author: 'Hajime Isayama',
      description:
          'Eren Yeager, insanları yiyen devler tarafından işgal edilen bir dünyada yaşar ve onları durdurmak için savaşır.',
      chapters: [
        Chapter(
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
      image: 'https://ww5.mangakakalot.tv/mangaimage/manga-oa952283.jpg',
    ),
    Manga(
      title: 'Berserk',
      author: 'Kentaro mirua',
      description:
      'is a Japanese dark fantasy manga series illustrated and written by'
          ' Kentaro Miura. Place in a medieval Europe-divine the narrative '
          'centers on the characters of Guts dark fantasy world, a lone'
          ' mercenary, and Griffith, the leader of a mercenary group known'
          'as the Band of the Hawk. Motifs of camaraderie, isolation,'
          ' as well as the question of whether mankind is basically good or bad'
          ' pervade the narrative, as it investigates both the very best and'
          ' worst of human nature. ',
      chapters: [
        Chapter(
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
      image: 'https://ww5.mangakakalot.tv/mangaimage/manga-ma952557.jpg',
    ),
    Manga(
      title: 'Attack on Titan',
      author: 'Hajime Isayama',
      description:
      'Eren Yeager, insanları yiyen devler tarafından işgal edilen bir dünyada yaşar ve onları durdurmak için savaşır.',
      chapters: [
        Chapter(
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
      image: 'https://ww5.mangakakalot.tv/mangaimage/manga-oa952283.jpg',
    ),
    Manga(
      title: 'Attack on Titan',
      author: 'Hajime Isayama',
      description:
      'Eren Yeager, insanları yiyen devler tarafından işgal edilen bir dünyada yaşar ve onları durdurmak için savaşır.',
      chapters: [
        Chapter(
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
      image: 'https://ww5.mangakakalot.tv/mangaimage/manga-oa952283.jpg',
    ),
  ];*/

  List<String> tags = [
    'all',
    'action',
    'adventure',
    'drama',
    'fantasy',
    'horror',
    'shounen'
  ];

  List<Manga> listMangaByTag = [];
  String? selectedTag;


  Future fetchManga() async {
    await FireStore.fetchManga().then((value) => value.forEach((element) {
          print(element.title);
          MangaList.add(element);
        }));
  }

  @override
  void initState() {
    super.initState();
    mangas = FireStore.fetchManga();
  }

  Future<void> setTag() async {

    listMangaByTag.clear();

    List<Manga> mangaList = await mangas;
    if (selectedTag != null) {
      if (selectedTag == 'all') {
        for (var item in mangaList) {
          listMangaByTag.add(item);
        }
      }
      for (var item in mangaList) {
        if (item.tags.contains(selectedTag)) {
          listMangaByTag.add(item);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Arya Manga',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: FutureBuilder(
                future: mangas,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        Manga manga = snapshot.data[index];
                        return Container(
                          margin: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MangaDetailPage(manga: manga),
                                ),
                              );
                            },
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(manga.author),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              )),
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
                        setTag();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(tags[index]),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: FutureBuilder(
                future: mangas,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: selectedTag != null
                          ? listMangaByTag.length
                          : snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Manga manga = selectedTag != null
                            ? listMangaByTag[index]
                            : snapshot.data![index];
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
                                builder: (context) =>
                                    MangaDetailPage(manga: manga),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MangaCreationPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
