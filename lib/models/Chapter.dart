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
    if(isTemp != null && isTemp == true){
      id=-1;
    }else{
      id = lastId;
      lastId += 1;
    }
  }

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    chapterName: json["chapterName"],
    chapterNo: json["chapterNo"],
    parentMangaId: json["parentMangaId"],
    image: List<String>.from(json["image"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "chapterName": chapterName,
    "chapterNo": chapterNo,
    "parentMangaId": parentMangaId,
    "image": List<dynamic>.from(image.map((x) => x)),
  };

}
