import 'ingreadient.dart';

class CocktailManager {
  String? name = '';
  String? catergory = '';
  String? alcoholic = '';
  String? glassType = '';
  String? pictureURL = '';
  String? instructions = '';

  List<Ingredient>? ingredients;

  CocktailManager({this.name, this.catergory,
    this.alcoholic, this.glassType,
    this.ingredients, this.instructions,
    this.pictureURL});

}