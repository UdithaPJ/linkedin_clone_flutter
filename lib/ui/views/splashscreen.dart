import 'package:flutter/material.dart';
import 'package:linkedin_clone_flutter/ui/views/home_page.dart';
import 'package:linkedin_clone_flutter/ui/views/login_page.dart';
import 'package:linkedin_clone_flutter/ui/views/welcome_page.dart';
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
      }
      else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
      }
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage(),),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Loading();
  }
}