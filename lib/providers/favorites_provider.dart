// Implementing Favorites Feature using Hive in MYOB (Make Your Own Booze)

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../models/cocktail.dart';

class FavoritesProvider extends ChangeNotifier {
  late Box<Cocktail> _favoritesBox;
  List<Cocktail> _favorites = [];

  List<Cocktail> get favorites => _favorites;

  FavoritesProvider() {
    _initializeFavorites();
  }

  Future<void> _initializeFavorites() async {
    _favoritesBox = await Hive.openBox<Cocktail>('favorites');
    _favorites = _favoritesBox.values.toList();
    notifyListeners();
  }

  void addFavorite(Cocktail cocktail) {
    _favoritesBox.put(cocktail.id, cocktail);
    _favorites.add(cocktail);
    notifyListeners();
  }

  void removeFavorite(String id) {
    _favoritesBox.delete(id);
    _favorites.removeWhere((cocktail) => cocktail.id == id);
    notifyListeners();
  }

  bool isFavorite(String id) {
    return _favoritesBox.containsKey(id);
  }
}
