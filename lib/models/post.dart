//import 'package:json_serializable/json_serializable.dart';

import 'package:flutter/material.dart';

class Post {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final String author;

  Post({
    @required this.author,
    @required this.title,
    @required this.description,
    @required this.thumbnail,
    @required this.id,
  });

  factory Post.fromJson(String id, Map<String, dynamic> data, String thumb) {
    return Post(
      id: id,
      description: data['selftext']
          .toString()
          .replaceAll("\n", " ")
          .replaceAll("&amp;#x200B;", ""),
      title: data['title'].toString(),
      author: data['author'].toString(),
      thumbnail: thumb,
    );
  }

  @override
  String toString() {
    return '$id||$description||$title||$author||$thumbnail\n';
  }
}
