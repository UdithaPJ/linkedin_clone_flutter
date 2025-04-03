import 'package:flutter/material.dart';
import 'package:linkedin_clone_flutter/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class AuthProvider extends StatelessWidget {
  final Widget child;

  AuthProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AuthViewModel(),
    );
  }
}