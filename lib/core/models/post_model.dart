import 'dart:convert';

PostModel postModelFromMap(String str) => PostModel.fromMap(json.decode(str));

String postModelToMap(PostModel data) => json.encode(data.toMap());

class PostModel {
  final String username;
  final String headline;
  final DateTime timestamp;
  final bool isOnline;
  final String profileImageUrl;
  final String description;
  final String tags;
  final bool isVideoPost;
  final String imageUrl;
  final String videoUrl;
  final String likes;
  final String comments;

  PostModel({
    required this.username,
    required this.headline,
    required this.timestamp,
    required this.isOnline,
    required this.profileImageUrl,
    required this.description,
    required this.tags,
    required this.isVideoPost,
    required this.imageUrl,
    required this.videoUrl,
    required this.likes,
    required this.comments,
  });

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
    username: json["username"],
    headline: json["headline"],
    timestamp: json["timestamp"],
    isOnline: json["isOnline"],
    profileImageUrl: json["profileImageUrl"],
    description: json["description"],
    tags: json["tags"],
    isVideoPost: json["isVideoPost"],
    imageUrl: json["imageUrl"],
    videoUrl: json["videoUrl"],
    likes: json["likes"],
    comments: json["comments"],
  );

  Map<String, dynamic> toMap() => {
    "username": username,
    "headline": headline,
    "timestamp": timestamp,
    "isOnline": isOnline,
    "profileImageUrl": profileImageUrl,
    "description": description,
    "tags": tags,
    "isVideoPost": isVideoPost,
    "imageUrl": imageUrl,
    "videoUrl": videoUrl,
    "likes": likes,
    "comments": comments,
  };
}
