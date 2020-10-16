import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/arguments/state_argument.dart';

class StateManagementScreen extends StatelessWidget {
  StateManagementScreen(
      {Key key, this.counter, this.incrementCounter, this.decrementCounter})
      : super(key: key);

  static String id = "state";
  int counter;
  var decrementCounter;
  var incrementCounter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You have pushed the botton this many times:"),
          Text(
            counter.toString(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          RaisedButton(
              color: Colors.blue,
              child: Text(
                "Next Page",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.pushNamed(context, DetailStateManagement.id,
                    arguments: StateArgument(counter, decrementCounter));
              })
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(Icons.add),
      ),
    );
  }

  void onPressed() {
    incrementCounter(null);
    print("Counter $counter");
  }
}

class DetailStateManagement extends StatelessWidget {
  int counter;
  ValueChanged decrementCounter;

  DetailStateManagement({Key key, this.counter, this.decrementCounter})
      : super(key: key);

  static String id = "detailstate";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail StateManagement"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the botton this many times:"),
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: onPressed,
          tooltip: "Decrement",
          child: Icon(
            Icons.indeterminate_check_box,
            color: Colors.white,
          ),
        ));
  }

  void onPressed() {
    decrementCounter(null);
    print("Counter $counter");
  }
}
