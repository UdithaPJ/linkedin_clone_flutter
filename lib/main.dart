import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone_flutter/ui/views/home_page.dart';
import 'package:linkedin_clone_flutter/ui/views/welcome_page.dart';
import 'package:linkedin_clone_flutter/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: Consumer<AuthViewModel>(
        builder: (context, authViewModel, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Linkedin Clone App",
            theme: ThemeData.light(useMaterial3: true),
            home: authViewModel.user != null ? HomePage() : WelcomePage(),
          );
        },
      ),
    );
  }
}
