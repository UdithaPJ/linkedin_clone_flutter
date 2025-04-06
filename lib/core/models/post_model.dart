import 'dart:convert';

PostModel postModelFromMap(String str) => PostModel.fromMap(json.decode(str));

String postModelToMap(PostModel data) => json.encode(data.toMap());

class PostModel {
  final int id;
  final String uid;
  final String? headline;
  final String description;
  final String? tags;
  final String? imageUrl;
  final int? likes;
  final int? comments;

  PostModel({
    required this.id,
    required this.uid,
    this.headline,
    required this.description,
    this.tags,
    this.imageUrl,
    this.likes,
    this.comments,
  });

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    uid: json["uid"],
    headline: json["headline"],
    description: json["description"],
    tags: json["tags"],
    imageUrl: json["imageUrl"],
    likes: json["likes"],
    comments: json["comments"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "uid": uid,
    "headline": headline,
    "description": description,
    "tags": tags,
    "imageUrl": imageUrl,
    "likes": likes,
    "comments": comments,
  };
}
