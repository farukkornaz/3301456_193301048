import 'dart:io';

import 'Chapter.dart';

class Manga {
  int id;
  String title;
  String author;
  String description;
  List<Chapter> chapters;
  List<String> tags;
  String image;

  Manga({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.chapters,
    required this.tags,
    required this.image,
  });
}

/*import 'dart:io';

import 'package:arya_manga/models/Chapter.dart';

import 'Tag.dart';

class Manga{
  int id;
  String title;
  late DateTime releaseDate;
  String? author;
  String description;
  List<Chapter>? chapters;
  List<Tag>? tags;
  File image;

  Manga({required this.image, required this.id, required this.title, this.author,
    this.description="-", this.chapters}) {
    releaseDate = DateTime.now();
  }
}*/



