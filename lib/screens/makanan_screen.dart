import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/ui/ui_makanan.dart';

class MakananScreen extends StatelessWidget {
  UIMakanan uimakanan = UIMakanan();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Makanan"),
      ),
      body: uimakanan.buildListViewDefault(),
    );
  }
}
