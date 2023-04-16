
import 'dart:io';

class Chapter {
  bool? isTemp;
  int id=-1;
  String chapterName;
  int chapterNo;
  int parentMangaId;
  List<String> image;
  static int lastId=0;

  Chapter({
    this.isTemp,
    required this.chapterName,
    required this.chapterNo,
    required this.parentMangaId,
    required this.image,
  }){
    if(isTemp!=null && isTemp ==true){
      id=-1;
    }else{
      id = lastId;
      lastId += 1;
    }

  }
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
