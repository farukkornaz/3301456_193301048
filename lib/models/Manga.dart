import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'Chapter.dart';

Manga mangaFromJson(String str) => Manga.fromJson(json.decode(str));

String mangaToJson(Manga data) => json.encode(data.toJson());

class Manga {
  String id;
  String title;
  String author;
  String description;
  List<Chapter>? chapters;
  List<String> tags;
  String image;
  static int lastId=0;

  Manga({
    this.id = '',
    required this.title,
    required this.author,
    required this.description,
    required this.chapters,
    required this.tags,
    required this.image,
  });

  factory Manga.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Manga(
        id: data["id"],
        title: data["title"],
        author: data["author"],
        description: data["description"],
        chapters: data["chapters"] != null ? List<Chapter>.from(data["chapters"].map((x) => Chapter.fromJson(x))) : [],
        tags: List<String>.from(data["tags"].map((x) => x)),
        image: data["image"]);
  }

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
    id: json["id"],
    title: json["title"],
    author: json["author"],
    image: json["image"],
    description: json["description"],
    chapters: json["chapters"] != null ? List<Chapter>.from(json["chapters"].map((x) => Chapter.fromJson(x))) : [],
    tags: List<String>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "author": author,
    "image": image,
    "description": description,
    "chapters": chapters != null ? List<dynamic>.from(chapters!.map((x) => x.toJson())) : null,
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}
