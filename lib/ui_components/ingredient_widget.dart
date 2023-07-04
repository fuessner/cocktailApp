import 'package:flutter/material.dart';
import 'package:mycocktail/constants.dart';

import '../services/ingreadient.dart';

class IngredientWidget extends StatelessWidget {
  IngredientWidget({required this.ingredientList});

  final List<Ingredient> ingredientList;

  Widget createTable(){
    List<TableRow> TableRows = [];
    for(int i = 0; i < ingredientList.length; i++)
      {
        TableRows.add(
           TableRow(
             children: [
                Center(child: Text(ingredientList[i].name),),
               Center(child: Text(ingredientList[i].mesure),),
             ],
           ),
        );
      }
    return Table(children: TableRows,);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Ingredients",
              style: kTableTextStyle,),
        SizedBox(height: 30,),
        Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: createTable(),
            ),
        ),
      ],
    );
  }
}
