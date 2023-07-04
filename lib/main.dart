import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycocktail/ui_windows/result_window.dart';
// import 'package:mycocktail/ui_windows/search_window.dart';

import 'constants.dart';

// Video: https://www.youtube.com/watch?v=GB8PcAap5QU
// In diesem wieder wird viel mit JSON gearbeitet
// Die Cocktails kommen von: https://www.thecocktaildb.com/api.php
// Im Google Chrome JSON Formater als Erweiterung hinzugefügt, damit
// man das Json Format besser erkennen kann.

// Designer für Flutter: https://flutterstudio.app ODER
//                       https://app.flutterviz.com/#/

// Design erstellt mit der APP: FIGMA

// Video: 2:56:01

void main() {
  // portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyCocktail()));
  ;
}

class MyCocktail extends StatelessWidget {
  const MyCocktail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Theme -> DARK MODE
    return MaterialApp(
      home: ResultWindow(), // SearchWindow(),
      // Damit DEBUG nicht oben RECHT im EMULATOR angzeigt wird.
      debugShowCheckedModeBanner: false,
      // App in DarkModus
      // copyWith ist optinal gilt dann aber für alle VIEWs
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
    );
  }
}
