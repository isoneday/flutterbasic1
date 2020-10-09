import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/screens/makanan_screen.dart';
import 'package:myfirstapp_flutter/screens/minuman_screen.dart';

class UtamaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Utama Screen"),
        ),
        body: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  tampilanMenu(Colors.green, "gambar/ojol.png", "list minuman",
                      context, MinumanScreen()),
                  tampilanMenu(Colors.amber, "gambar/ojol.png", "list makanan",
                      context, MakananScreen())
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  tampilanMenu(Colors.amber, "gambar/ojol.png", "list minuman",
                      context, MinumanScreen()),
                  tampilanMenu(Colors.green, "gambar/ojol.png", "list makanan",
                      context, MakananScreen())
                ],
              ),
            ),
          ],
        ));
  }

  Widget tampilanMenu(Color warna, String gambar, String title,
      BuildContext context, Widget kelasTujuan) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => kelasTujuan));
          },
          child: Container(
            color: warna,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  gambar,
                  width: 60,
                  height: 60,
                ),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
