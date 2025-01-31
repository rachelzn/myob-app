import 'package:hive/hive.dart';

part 'cocktail.g.dart'; // Required for Hive adapter

@HiveType(typeId: 0)
class Cocktail {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String glassType;
  @HiveField(5)
  final String instructions;
  @HiveField(6)
  final List<String> ingredients;

  Cocktail({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.glassType,
    required this.instructions,
    required this.ingredients,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      id: json['idDrink'],
      name: json['strDrink'],
      imageUrl: json['strDrinkThumb'],
      category: json['strCategory'] ?? 'Unknown',
      glassType: json['strGlass'] ?? 'Any',
      instructions: json['strInstructions'] ?? 'No instructions available',
      ingredients: List<String>.generate(15, (index) {
        final ingredient = json['strIngredient${index + 1}'];
        return ingredient != null ? ingredient : '';
      }).where((i) => i.isNotEmpty).toList(),
    );
  }
}
