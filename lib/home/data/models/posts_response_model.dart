// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'posts_response_model.g.dart';

@HiveType(typeId: 0)
class PostsResponseModel {
  @HiveField(0)
  final int? userId;
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? body;

  PostsResponseModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostsResponseModel.fromMap(Map<String, dynamic> map) {
    return PostsResponseModel(
      userId: map['userId'] != null ? map['userId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsResponseModel.fromJson(String source) =>
      PostsResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
