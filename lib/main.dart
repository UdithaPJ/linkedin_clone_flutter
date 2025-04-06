import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkedin_clone_flutter/ui/views/forgotpassword_page.dart';
import 'package:linkedin_clone_flutter/ui/views/home_page.dart';
import 'package:linkedin_clone_flutter/ui/views/login_page.dart';
import 'package:linkedin_clone_flutter/ui/views/main_page.dart';
import 'package:linkedin_clone_flutter/ui/views/profile_page.dart';
import 'package:linkedin_clone_flutter/ui/views/signup_page.dart';
import 'package:linkedin_clone_flutter/ui/views/signup_page1.dart';
import 'package:linkedin_clone_flutter/ui/views/signup_page2.dart';
import 'package:linkedin_clone_flutter/ui/views/splashscreen.dart';
import 'package:linkedin_clone_flutter/ui/views/welcome_page.dart';
import 'package:linkedin_clone_flutter/viewmodels/auth_viewmodel.dart';
import 'package:linkedin_clone_flutter/viewmodels/home_viewmodel.dart';
import 'package:linkedin_clone_flutter/viewmodels/profile_viewmodel.dart';
import 'package:linkedin_clone_flutter/viewmodels/signup_viewmodel.dart';
import 'package:provider/provider.dart';

import 'config/app_routes.dart';

// Future<void> addUsersDataFromJson() async {
//   final String jsonString = await rootBundle.loadString('assets/usersdata.json');
//   final List<dynamic> data = json.decode(jsonString);
//
//   for (var doc in data) {
//     await FirebaseFirestore.instance.collection('users').add(doc);
//   }
//   print("users added successfully");
// }
//
// Future<void> addPostsDataFromJson() async {
//   final String jsonString = await rootBundle.loadString('assets/postsdata.json');
//   final List<dynamic> data = json.decode(jsonString);
//
//   for (var doc in data) {
//     await FirebaseFirestore.instance.collection('posts').add(doc);
//   }
//   print("posts added successfully");
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  // await addUsersDataFromJson();
  // await addPostsDataFromJson();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => SignupViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Linkedin Clone App",
        theme: ThemeData.light(useMaterial3: true),
        initialRoute: AppRoutes.splashscreen,
        routes: {
          AppRoutes.splashscreen: (_) => const SplashScreen(),
          AppRoutes.welcome: (_) => const WelcomePage(),
          AppRoutes.signup: (_) => const SignupPage(),
          AppRoutes.signup1: (_) => SignupPage1(),
          AppRoutes.signup2: (_) => const SignupPage2(),
          AppRoutes.login: (_) => const LoginPage(),
          AppRoutes.forgotpassword: (_) => const ForgotpasswordPage(),
          AppRoutes.main: (_) => const MainPage(),
          AppRoutes.home: (_) => const HomePage(),
          AppRoutes.profile: (_) => const ProfilePage(),
        },
      ),
    );
  }
}
