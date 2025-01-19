import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lab3/service/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> types = [];

  @override
  void initState() {
    super.initState();
    getJokeTypes();
  }

  void getJokeTypes() async {
    ApiService.getJokeTypes().then((res) {
      setState(() {
        types = List<String>.from(jsonDecode(res.body));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF052032),
        title: const Text(
          "211198 Jokes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.sentiment_very_satisfied,
              color: Color(0xFF904E55),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/random');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Favorites tile
            Card(
              color: const Color(0xFFFFFFFF),
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/favourites');
                },
                child: const ListTile(
                  title: Text(
                    "Favourites",
                    style: TextStyle(color: Color(0xFF000000)),
                  ),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            // Categories title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // List of joke types
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: types.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFFFFFFFF),
                  margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: InkWell(
                    onTap: () => {
                      Navigator.pushNamed(
                        context,
                        '/type',
                        arguments: types[index],
                      )
                    },
                    child: ListTile(
                      title: Text(
                        types[index],
                        style: const TextStyle(color: Color(0xFF000000)),
                      ),
                      leading: const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF002626),
    );
  }
}
