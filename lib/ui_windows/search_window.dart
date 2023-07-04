import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mycocktail/services/cocktail_manager.dart';
import 'package:mycocktail/services/ingreadient.dart';
import 'package:mycocktail/ui_windows/result_window.dart';

import '../constants.dart';

class SearchWindow extends StatefulWidget {
  const SearchWindow({Key? key}) : super(key: key);

  @override
  State<SearchWindow> createState() => _SearchWindow();
}

class _SearchWindow extends State<SearchWindow> {
  String cocktailName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // SafeArea damit die APP oben und unten Platz lässt
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // Alle Elemente im Column werden so breit gemacht wie die
              // Column selber. Somit bräuchte man keine WIDTH angabe bei
              // dem Button
              crossAxisAlignment: CrossAxisAlignment.stretch ,
              children: [
                // SizeBox als alternative zu Padding
                // Vorteil: Ich gebe hier nur die Höhe an
                const SizedBox(height: 100,),
                // Logo Text
                const Center(

                  child: Text(
                    'Cocktails',
                  style: TextStyle(fontSize: 70),),
                ),
                // Text Input
                const SizedBox(height: 100,),
                TextField(
                  onChanged: (value) {
                    cocktailName = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'Name a Cocktail?',
                        border: OutlineInputBorder(
                          // Text innerhalb der TextBoxh mit padding
                          borderRadius: BorderRadius.circular(25),
                          borderSide: kBorderSideYellow,
                        ),
                    // Wenn der FOCUS im Textfeld ist, soll sich die
                      // Farbe verändern:
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: kBorderSide,
                    ),
                  ),
                ),
                // Search Button
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () async {

                  if(cocktailName == null) return;
                  // kommt von cocktail_manager.dart

                  cocktailName.toLowerCase().replaceAll(' ', '_');

                  CocktailManager cm = CocktailManager();
                  // Damit get funktioniert müssen wir bei pub.dev
                  // das Package http herunter laden oder aber
                  // in abschnitt DEPENDENCIES in datei PUBSPEC.YAML
                  // den Eintrag http: ^1.0.0 vornehmen.
                  var network = await get(Uri.parse(kMainUrl + cocktailName));
                  var json = jsonDecode(network.body);
                  // Suche im JSON nach drinks und nimmer das erste element 0
                  cm.name = json['drinks'][0]['strDrink'];
                  cm.alcoholic = json['drinks'][0]['strAlcoholic'];
                  cm.glassType = json['drinks'][0]['strGlass'];
                  cm.pictureURL = json['drinks'][0]['strDrinkThumb'];
                  cm.catergory = json['drinks'][0]['strCategory'];
                  cm.instructions = json['drinks'][0]['strInstructions'];

                  String strIngredientName, strIngredientMeasure;
                  List<Ingredient> ingrdientList = [];
                  for(int i = 0; i < 16; i++)
                    {
                      strIngredientName = 'strIngredient' + i.toString();
                      strIngredientMeasure = 'strMeasure' + i.toString();

                      ingrdientList.add(
                          Ingredient(name: json['drinks'][0]['strIngredientName'],
                          mesure: json['drinks'][0]['strIngredientMeasure'] )
                      );
                    }
                  // Elemente die den wert NULL haben werden gelöscht
                  // Vorher prüfen ob beide elemente NULL sind.
                  ingrdientList.removeWhere((element) => element.name == null &&
                       element.mesure == null);

                  ingrdientList.forEach((element) {
                    if (element.mesure == null) {
                        element.mesure = ' ';
                    }
                    if (element.name == null) {
                      element.name = ' ';
                    }
                  });
                  cm.ingredients = ingrdientList;

                 // Navigator.push(context, MaterialPageRoute(builder: (context)
                 // { return ResultWindow();
                 // }
                 // ),
                 // );
                },
                    child: Text('Search'),
                style: ElevatedButton.styleFrom(
                  minimumSize: kButtonMinSize,
                  backgroundColor: kComponentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                ),
                // Random Button
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {},
                  child:
                  Text('Random'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: kButtonMinSize,
                    backgroundColor: kComponentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),),
              ],
            ),
          ),
        ),
      );
  }
}
