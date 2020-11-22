import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_theme_changer/Model/thememodel.dart';

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
            FlatButton(
              child: Text("A Flat Button"),
              onPressed: () {},
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
