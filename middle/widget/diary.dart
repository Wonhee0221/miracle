import 'package:flutter/foundation.dart';

class Diary {
  final int? id;
  final String title;
  final String content;
  final String uploadDate;

  Diary({required this.id, required this.title, required this.content, required this.uploadDate});

  factory Diary.fromJson(Map<String, dynamic> json) => Diary(
    id: json['id'],
    content: json['content'],
    title: json['title'],
    uploadDate: json['uploadDate'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "uploadDate": uploadDate,
  };
}