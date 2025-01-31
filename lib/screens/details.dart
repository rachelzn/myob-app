import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cocktail.dart';
import '../providers/favorites_provider.dart';

class DetailsScreen extends StatelessWidget {
  final Cocktail cocktail;

  const DetailsScreen({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    bool isFav = favoritesProvider.isFavorite(cocktail.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail.name),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.red),
            onPressed: () {
              isFav
                  ? favoritesProvider.removeFavorite(cocktail.id)
                  : favoritesProvider.addFavorite(cocktail);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(cocktail.imageUrl),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Category: ${cocktail.category}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Glass: ${cocktail.glassType}'),
                  SizedBox(height: 10),
                  Text('Ingredients:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  for (var ingredient in cocktail.ingredients)
                    Text('- $ingredient'),
                  SizedBox(height: 10),
                  Text('Instructions:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(cocktail.instructions),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
