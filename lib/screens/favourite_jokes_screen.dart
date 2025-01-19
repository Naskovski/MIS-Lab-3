import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lab3/models/joke.dart';
import 'package:lab3/service/api_service.dart';
import 'package:lab3/service/persistence_service.dart';
import 'package:lab3/widgets/joke_list.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Joke> favoriteJokes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    try {
      // Get the list of favorite joke IDs
      final List<int> favoriteIds = await PersistenceService.getFavourites();
      print(favoriteIds.toString());

      // Fetch jokes for each ID
      final List<Joke> jokes = [];
      for (int id in favoriteIds) {
        final response = await ApiService.getJokeById(id);
        if (response.statusCode == 200) {
          final jokeJson = jsonDecode(response.body);
          jokes.add(Joke.fromJson(jokeJson));
        } else {
          debugPrint('Failed to load joke with ID $id: ${response.statusCode}');
        }
      }

      setState(() {
        favoriteJokes = jokes;
        isLoading = false;
      });
    } catch (e) {
      // Handle errors (e.g., network issues)
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load favorite jokes: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(color: Color(0xFFFFFFFF)),
      )
          : favoriteJokes.isEmpty
          ? const Center(
        child: Text(
          'No favorite jokes found!',
          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
        ),
      )
          : JokeList(jokes: favoriteJokes),
      backgroundColor: const Color(0xFF052032),
    );
  }
}
