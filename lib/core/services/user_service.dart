import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/user_model.dart';
import '../utils/showSnackBar.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserByUid(String uid, BuildContext context) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        return UserModel.fromMap(doc.data()!, uid);
      } else {
        Snackbars.errorSnackBar(message: "User not found. Please sign in", context: context);
        throw Exception('User not found');
      }
    } catch (e) {
      Snackbars.errorSnackBar(message: "Something went wrong", context: context);
      throw Exception('Something went wrong: $e');
    }
  }
}
