import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab3/screens/favourite_jokes_screen.dart';
import 'firebase_options.dart';

import 'package:lab3/screens/home.dart';
import 'package:lab3/screens/jokes_screen.dart';
import 'package:lab3/screens/random_joke_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const JokeApp());
}

class JokeApp extends StatelessWidget {
  const JokeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211198',
      initialRoute: '/',
      routes: {
        '/' : (context) => const Home(),
        '/type': (context) => const JokesScreen(),
        '/random': (context) => const RandomJokeScreen(),
        '/favourites': (context) => const FavoritesScreen(),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF5C00)),
      ),
    );
  }
}