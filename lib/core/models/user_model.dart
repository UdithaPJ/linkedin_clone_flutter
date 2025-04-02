import 'package:meta/meta.dart';
import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;
  final String headline;
  final String location;
  final String bio;
  final String company;
  final String experience;
  final String education;
  final List<String> skills;
  final List<String> connections;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.headline,
    required this.location,
    required this.bio,
    required this.company,
    required this.experience,
    required this.education,
    required this.skills,
    required this.connections,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    profileImageUrl: json["profileImageUrl"],
    headline: json["headline"],
    location: json["location"],
    bio: json["bio"],
    company: json["company"],
    experience: json["experience"],
    education: json["education"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    connections: List<String>.from(json["connections"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "profileImageUrl": profileImageUrl,
    "headline": headline,
    "location": location,
    "bio": bio,
    "company": company,
    "experience": experience,
    "education": education,
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "connections": List<dynamic>.from(connections.map((x) => x)),
  };
}
