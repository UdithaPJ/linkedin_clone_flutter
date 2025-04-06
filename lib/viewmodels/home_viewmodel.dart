import 'package:flutter/material.dart';
import 'package:linkedin_clone_flutter/core/services/post_service.dart';
import '../core/models/post_model.dart';
import '../core/models/user_model.dart';
import '../core/services/user_service.dart';

class HomeViewModel extends ChangeNotifier {
  final PostService _postService = PostService();
  final UserService _userService = UserService();

  List<PostModel> _posts = [];
  List<PostWithUserData> _postsWithUserData = [];

  bool _isLoading = false;
  String _errorMessage = '';

  List<PostWithUserData> get posts => _postsWithUserData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchPosts(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      _posts = await _postService.fetchAllPosts(context);

      List<PostWithUserData> postsWithUserData = [];
      for (var post in _posts) {
        UserModel user = await _userService.getUserByUid(post.uid, context);
        postsWithUserData.add(PostWithUserData(post, user));
      }
      _postsWithUserData = postsWithUserData;
    } catch (e) {
      _errorMessage = 'Failed to load posts: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class PostWithUserData {
  final PostModel post;
  final UserModel user;

  PostWithUserData(this.post, this.user);
}
