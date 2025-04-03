import 'dart:convert';

  UserModel usersFromMap(String str, String docId) => UserModel.fromMap(json.decode(str), docId);

String usersToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? profileImageUrl;
  final String? headline;
  final String? location;
  final String? bio;
  final String? company;
  final String? experience;
  final String? education;
  final List<String>? skills;
  final List<String>? connections;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.headline,
    this.location,
    this.bio,
    this.company,
    this.experience,
    this.education,
    this.skills,
    this.connections,
  });

  factory UserModel.fromMap(Map<String, dynamic> json, String docId) => UserModel(
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    profileImageUrl: json["profileImageUrl"],
    headline: json["headline"],
    location: json["location"],
    bio: json["bio"],
    company: json["company"],
    experience: json["experience"],
    education: json["education"],
    skills: json["skills"] != null
      ? List<String>.from(json["skills"].map((x) => x))
      : null,
    connections: json["connections"] != null
      ? List<String>.from(json["connections"].map((x) => x))
      : null,
  );

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "name": name,
    "email": email,
    "profileImageUrl": profileImageUrl,
    "headline": headline,
    "location": location,
    "bio": bio,
    "company": company,
    "experience": experience,
    "education": education,
    "skills": skills != null ? List<dynamic>.from(skills!.map((x) => x)) : null,
    "connections": connections != null ? List<dynamic>.from(connections!.map((x) => x)) : null,
  };
}
