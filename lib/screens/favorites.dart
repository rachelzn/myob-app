import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../screens/details.dart';
import '../widgets/cocktail_card.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: favoritesProvider.favorites.isEmpty
          ? Center(child: Text('No favorites added yet!'))
          : ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                final cocktail = favoritesProvider.favorites[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(cocktail: cocktail),
                    ),
                  ),
                  child: CocktailCard(
                    cocktail: cocktail,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: cocktail,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
