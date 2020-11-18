import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider<DataModel>(
        // encapsulating the further widget tree under a provider
        create: (_) => DataModel(),
        child: HomeScreen(),
      ),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Basic App'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<DataModel>(builder: (context, dataModel, child) {
                return RaisedButton(
                  child: Text(
                    'increase +1',
                    textScaleFactor: 1.4,
                  ),
                  onPressed: () {
                    dataModel.increaseValue();
                  },
                );
              }),
              SizedBox(
                height: 20,
              ),
              Consumer<DataModel>(builder: (context, dataModel, child) {
                return Text(
                  dataModel.count.toString(),
                  textScaleFactor: 2.5,
                );
              }),
              // TODO 2 make a button for decreasing the value and calling decreaseValue() function
            ],
          ),
        ),
      ),
    );
  }
}

class DataModel with ChangeNotifier {
  // Model extending ChangeNotifier (a Type of Notifier)
  int count = 0;

  void increaseValue() {
    count++;
    notifyListeners(); //   <--- notifies the providers
  }

// TODO 1 : make decrease Value function just as above

}
