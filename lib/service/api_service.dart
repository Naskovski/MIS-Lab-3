import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{

  static Future<http.Response> getJokeTypes() async {
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/types"));
    return response;
  }

  static Future<dynamic> getJokesByType(String type) async{
    final response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception("Failed to load data!");
    }
  }

  static Future<http.Response> getRandomJoke() async {
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    return response;
  }

  static Future<http.Response> getJokeById(int jokeId) async {
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/$jokeId"));
    return response;
  }
}
