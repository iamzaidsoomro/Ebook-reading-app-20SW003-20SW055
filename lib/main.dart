import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/screens/book.dart';
import 'package:flutter_application_1/screens/forgot_password.dart';
import 'package:flutter_application_1/screens/saved_book.dart';
import 'package:flutter_application_1/utils/firebase_options.dart';

import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/log_in.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/screens/sign_up.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'screens/favourite_screen.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
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
                summary: "dasd",
              ),
          "profile": (context) => ProfileScreen(),
          "favourite": (context) => const FavouriteScreen(),
          "homeview": (context) => const HomeView(),
          "saved": (context) => const SavedBooksScreen(),
          "forgotPassword": (context) => const ForgotPasswordScreen()
        },
      ),
    );
  }
}
