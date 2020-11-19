import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

/// Screen 1
class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.lightbulb_outline,
        ),
        onPressed: () {
          Provider.of<ThemeModel>(context, listen: false).changeTheme();
        },
        tooltip: "Change Theme",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Yoo this is a text",
                textScaleFactor: 2.0,
              ),
            ),
            SizedBox(
              height: 30,
            ),

            /// lets use Provider.of to check which theme is currently active
            Container(
              child:
                  Provider.of<ThemeModel>(context, listen: true).currentTheme ==
                          ThemeData.light()
                      ? Text(
                          "Light Theme is active rn",
                          textScaleFactor: 1.8,
                        )
                      : Text(
                          "Dark Theme is active rn",
                          textScaleFactor: 1.8,
                        ),
            ),

            SizedBox(
              height: 30,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Screen2();
                  }));
                },
                child: Text("Go to Screen 2"))
          ],
        ),
      ),
    );
  }
}

///Screen 2
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.lightbulb_outline,
        ),
        tooltip: "Change Theme",
        onPressed: () {
          Provider.of<ThemeModel>(context, listen: false).changeTheme();
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Yoo this is a text",
                textScaleFactor: 2.0,
              ),
            ),
            SizedBox(
              height: 30,
            ),

            /// lets use Provider.of to check which theme is currently active
            Container(
              child:
                  Provider.of<ThemeModel>(context, listen: true).currentTheme ==
                          ThemeData.light()
                      ? Text(
                          "Light Theme is active rn",
                          textScaleFactor: 1.8,
                        )
                      : Text(
                          "Dark Theme is active rn",
                          textScaleFactor: 1.8,
                        ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Back to Screen 1"))
          ],
        ),
      ),
    );
  }
}
