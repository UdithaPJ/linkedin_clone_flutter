import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/post_model.dart';
import '../utils/showSnackBar.dart';

class PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PostModel>> fetchAllPosts(BuildContext context) async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('posts').get();
      List<PostModel> posts = snapshot.docs.map((doc) {
        return PostModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      return posts;
    } catch (e) {
      Snackbars.errorSnackBar(message: "Something went wrong", context: context);
      throw Exception("Something went wrong: $e");
    }
  }
}
