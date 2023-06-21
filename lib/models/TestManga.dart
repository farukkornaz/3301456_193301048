import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'TestChapter.dart';

TestManga mangaFromJson(String str) => TestManga.fromJson(json.decode(str));

String mangaToJson(TestManga data) => json.encode(data.toJson());

class TestManga {
  //int id=-1;
  late String id;
  String title;
  String author;
  String description;
  List<TestChapter> chapters;
  List<String> tags;
  String image;
  static int lastId=0;

  TestManga({
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


  factory TestManga.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return TestManga(
        title: data["title"],
        author: data["author"],
        description: data["description"],
        chapters: List<TestChapter>.from(data["chapters"].map((x) => TestChapter.fromJson(x))),
        tags: List<String>.from(data["tags"].map((x) => x)),
        image: data["image"]);
  }


  factory TestManga.fromJson(Map<String, dynamic> json) => TestManga(
    title: json["title"],
    author: json["author"],
    image: json["image"],
    description: json["description"],
    chapters: List<TestChapter>.from(json["chapters"].map((x) => TestChapter.fromJson(x))),
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

