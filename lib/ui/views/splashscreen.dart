import 'package:flutter/material.dart';
import '../../config/app_routes.dart';
import '../../core/services/localstorage_service.dart';
import 'loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    final bool hasWelcomed =  await LocalStorageService().hasWelcomed();
    final bool isLoggedIn =  await LocalStorageService().isLoggedIn();

    await Future.delayed(const Duration(seconds: 2));
    if(hasWelcomed) {
      if(isLoggedIn) {
        Navigator.pushNamed(context, AppRoutes.main);

      }
      else {
        Navigator.pushNamed(context, AppRoutes.login);
      }
    }
    else {
      Navigator.pushNamed(context, AppRoutes.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Loading();
  }
}