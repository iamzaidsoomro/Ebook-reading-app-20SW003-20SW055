import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/book.dart';
import 'package:flutter_application_1/firebase_options.dart';

import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/log_in.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/sign_up.dart';
import 'package:flutter_application_1/splash_screen.dart';

import 'favourite_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/login": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
        "/signup": (context) => const SignUpScreen(),
        "/book": (context) => Book(
              bookTitle: "Book3",
              bookAuthor: "Author3",
              bookImage: "lib/assets/book5.jpg",
            ),
        "profile": (context) => ProfileScreen(),
        "favourite": (context) => const FavouriteScreen(),
      },
    );
  }
}
