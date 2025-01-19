import 'package:shared_preferences/shared_preferences.dart';

class PersistenceService {
  static const _favoriteKey = 'favoriteJokes';

  static Future<List<int>> getFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favList = prefs.getStringList(_favoriteKey);
    if (favList == null) return [];
    return favList.map((id) => int.tryParse(id) ?? 0).toList();
  }

  static Future<void> addFavourite(int jokeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(_favoriteKey) ?? [];
    if (!favList.contains(jokeId.toString())) {
      favList.add(jokeId.toString());
      await prefs.setStringList(_favoriteKey, favList);
    }
  }

  static Future<void> removeFavourite(int jokeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(_favoriteKey) ?? [];
    favList.remove(jokeId.toString());
    await prefs.setStringList(_favoriteKey, favList);
  }
}
