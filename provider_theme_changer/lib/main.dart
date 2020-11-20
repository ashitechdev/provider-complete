import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_theme_changer/views/screenone.dart';

import 'Model/thememodel.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider<ThemeModel>(
        create: (_) => ThemeModel(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// theme of the whole App under this Material Widget i.e. Screen1 and Screen2
      theme: Provider.of<ThemeModel>(context, listen: true).currentTheme,
      home: Screen1(),
    );
  }
}
