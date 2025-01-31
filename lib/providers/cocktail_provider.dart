import 'package:flutter/material.dart';
import '../models/cocktail.dart';
import '../services/api_service.dart';

class CocktailProvider extends ChangeNotifier {
  List<Cocktail> _cocktails = [];
  bool _isLoading = false;

  List<Cocktail> get cocktails => _cocktails;
  bool get isLoading => _isLoading;

  Future<void> searchCocktails(String query) async {
    _isLoading = true;
    notifyListeners();

    _cocktails = await ApiService.fetchCocktailsByName(query);

    _isLoading = false;
    notifyListeners();
  }
}
