
import 'dart:io';

class Chapter {
  int id;
  String chapterName;
  int chapterNo;
  int parentMangaId;
  List<String> image;

  Chapter({
    required this.id,
    required this.chapterName,
    required this.chapterNo,
    required this.parentMangaId,
    required this.image,
  });
}










/*
import 'dart:io';

class Chapter{
  int id;
  String? chapterName;
  File image;
  late DateTime releaseDate;

  Chapter({required this.id, required this.image, this.chapterName}){
    releaseDate = DateTime.now();
  }

}*/
