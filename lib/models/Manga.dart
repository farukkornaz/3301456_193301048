import 'dart:io';

import 'Chapter.dart';

class Manga {
  int id=-1;
  String title;
  String author;
  String description;
  List<Chapter> chapters;
  List<String> tags;
  String image;
  static int lastId=0;

  Manga({
    required this.title,
    required this.author,
    required this.description,
    required this.chapters,
    required this.tags,
    required this.image,
  }){
    id = lastId;
    lastId += 1;
  }
}

