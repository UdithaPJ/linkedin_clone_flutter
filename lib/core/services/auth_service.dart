import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:linkedin_clone_flutter/core/models/user_model.dart';
import '../utils/showSnackBar.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> signUp(String name, String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(uid: userCredential.user!.uid, name: name, email: email);
      await _firestore.collection('users').doc(user.uid).set(user.toMap());
      Snackbars.successSnackBar(message: "Account created", context: context);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        print("Email already in use");
        Snackbars.errorSnackBar(message: "Email already in use", context: context);
      }
      if (e.code == "network-request-failed") {
        Snackbars.errorSnackBar(message: "Network error occured", context: context);
      }
    }
    return null;
  }

  Future<UserModel?> signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();

      if (userDoc.exists) {
        Snackbars.successSnackBar(message: "Login successful", context: context);
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>, userCredential.user!.uid);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password" || e.code == "invalid-credential") {
        Snackbars.errorSnackBar(message: "Incorrect email or password", context: context);
      }
      if (e.code == "too-many-requests") {
        Snackbars.errorSnackBar(message: "Too many requests. Try again later", context: context);
      }
      if (e.code == "network-request-failed") {
        Snackbars.errorSnackBar(message: "Network error occured", context: context);
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    Snackbars.successSnackBar(message: "User signed out", context: context);
    await _auth.signOut();
  }
}