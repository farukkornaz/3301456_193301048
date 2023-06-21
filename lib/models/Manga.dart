import 'dart:convert';
import 'dart:io';

import 'package:arya_manga/models/TestManga.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Chapter.dart';

Manga mangaFromJson(String str) => Manga.fromJson(json.decode(str));

String mangaToJson(Manga data) => json.encode(data.toJson());

class Manga {
  //int id=-1;
  late String id;
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
    /*id = lastId;
    lastId += 1;*/
  }

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
    title: json["title"],
    author: json["author"],
    image: json["image"],
    description: json["description"],
    chapters: List<Chapter>.from(json["chapters"].map((x) => Chapter.fromJson(x))),
    tags: List<String>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "author": author,
    "image": image,
    "description": description,
    "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };

}

