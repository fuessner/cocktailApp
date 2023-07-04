import 'package:flutter/material.dart';
import 'package:mycocktail/ui_components/ingredient_widget.dart';
import 'package:mycocktail/ui_components/instruction_widget.dart';

import '../constants.dart';

class ResultWindow extends StatelessWidget {
  // const ResultWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // Die Elemente auf dieser Seite werden auf die ganze Seite verteilt
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Auch auf der höhe werden die Elemente ausgerichteet
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Cocktail Name
            Center(
                child: Text("Name",style: kHeaderTextStyle,
                ),
            ),
             // Cocktail Details
            Container(
              // padding links und recht vom container = 20
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              decoration: BoxDecoration(
                color: kGroupBackgroundColor,
              ),
              child: Row(
                // AXIS: Stellt den Text zentriert im Container da
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("category"),
                  Text("-"),
                  Text("alcoholic"),
                  Text("-"),
                  Text("glass type"),
                ],
              ),
            ),
            // Cocktail Image
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                //  image: DecorationImage( )

              ),
            ),
            // Cocktail Ingredients
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              decoration: kBoxDecorationStyle,
              child: IngredientWidget(
                ingredientList: [],
              ),
            ),
            // Cocktail Instructions
            Container(
              // Das padding + margin + heigt muss sein sonst läuft
              // die APP nicht. Da sie zu groß sonst wäre
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              decoration: kBoxDecorationStyle,
              child: InstructionWidget(instructions: "instruction",
              ),
            ),
            //
            // Return Button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Return"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kComponentColor,
                  minimumSize: kButtonMinSize,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
