import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cocktail.dart';

class ApiService {
  static const String baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';

  // Search cocktail by name
  static Future<List<Cocktail>> fetchCocktailsByName(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/search.php?s=$name'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['drinks'] != null) {
        return (data['drinks'] as List)
            .map((drink) => Cocktail.fromJson(drink))
            .toList();
      }
    }
    return [];
  }
}
