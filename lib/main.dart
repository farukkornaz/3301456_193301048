import 'package:flutter/material.dart';

import 'package:arya_manga/FireStore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'models/Manga.dart';
import 'package:arya_manga/models/Chapter.dart';

import 'pages/SplashScreen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /*Manga newManga;
  newManga= Manga(
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
  );
  FireStore.addManga(manga: newManga);
  newManga = Manga(
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
  );
  FireStore.addManga(manga: newManga);
  newManga = Manga(
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
  );
  FireStore.addManga(manga: newManga);
  newManga = Manga(
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
  );
  FireStore.addManga(manga: newManga);*/


  //FireStore.addManga(manga: testManga);
  //FireStore.addManga(manga: testManga2);

  //List<Manga> allManga = await FireStore.fetchManga();
  /*List<Manga>? selectedMangas = await FireStore.fetchMangaByTag(tags: ["tag2"]);

  if(selectedMangas != null){
    for(int i=0; i<selectedMangas.length; i++){
      print(selectedMangas[i].title);
    }
  }*/

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

