import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/ui/ui_minuman.dart';

class MinumanScreen extends StatelessWidget {
  UiMinuman minuman = UiMinuman();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Minuman"),
      ),
      body: minuman.buildGridView(),
    );
  }
}
