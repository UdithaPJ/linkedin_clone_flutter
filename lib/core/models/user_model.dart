import 'dart:convert';

  UserModel usersFromMap(String str, String docId) => UserModel.fromMap(json.decode(str), docId);

String usersToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? profileImageUrl;
  final String? bannerImageUrl;
  final String? headline;
  final String? location;
  final String? bio;
  final String? company;
  final String? education;
  final List<String>? skills;
  final int? noOfFollowers;
  final int? noOfConnections;
  final int? noOfProfileViews;
  final int? noOfImpressions;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.bannerImageUrl,
    this.headline,
    this.location,
    this.bio,
    this.company,
    this.education,
    this.skills,
    this.noOfFollowers,
    this.noOfConnections,
    this.noOfProfileViews,
    this.noOfImpressions,
  });

  factory UserModel.fromMap(Map<String, dynamic> json, String docId) => UserModel(
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    profileImageUrl: json["profileImageUrl"],
    bannerImageUrl: json["bannerImageUrl"],
    headline: json["headline"],
    location: json["location"],
    bio: json["bio"],
    company: json["company"],
    education: json["education"],
    skills: json["skills"] != null
      ? List<String>.from(json["skills"].map((x) => x))
      : null,
    noOfFollowers: json["noOfFollowers"],
    noOfConnections: json["noOfConnections"],
    noOfProfileViews: json["noOfProfileViews"],
    noOfImpressions: json["noOfImpressions"],
  );

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "name": name,
    "email": email,
    "profileImageUrl": profileImageUrl,
    "bannerImageUrl": bannerImageUrl,
    "headline": headline,
    "location": location,
    "bio": bio,
    "company": company,
    "education": education,
    "skills": skills != null ? List<dynamic>.from(skills!.map((x) => x)) : null,
    "noOfFollowers": noOfFollowers,
    "noOfConnections": noOfConnections,
    "noOfProfileViews": noOfProfileViews,
    "noOfImpressions": noOfImpressions,
  };
}
