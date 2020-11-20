import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_theme_changer/Model/thememodel.dart';
import 'package:provider_theme_changer/views/screentwo.dart';

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
