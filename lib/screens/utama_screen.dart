import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/screens/camera_screen.dart';
import 'package:myfirstapp_flutter/screens/makanan_screen.dart';
import 'package:myfirstapp_flutter/screens/minuman_screen.dart';
import 'package:myfirstapp_flutter/screens/wa_screen.dart';

import 'portalberita_screen.dart';

class UtamaScreen extends StatelessWidget {
  static String id = "utama";
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
                  tampilanMenu(Colors.amber, "gambar/ojol.png", "list minuman",
                      context, MinumanScreen.id),
                  tampilanMenu(Colors.green, "gambar/ojol.png", "list makanan",
                      context, MakananScreen.id)
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  tampilanMenu(Colors.green, "gambar/ojol.png", "Whatsapp",
                      context, WaScreen.id),
                  tampilanMenu(Colors.amber, "gambar/ojol.png", "Portal Berita",
                      context, PortalBeritaScreen.id)
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  tampilanMenu(Colors.green, "gambar/ojol.png", "Camera",
                      context, CameraScreen.id),
                  tampilanMenu(Colors.amber, "gambar/ojol.png", "Portal Berita",
                      context, PortalBeritaScreen.id)
                ],
              ),
            ),
          ],
        ));
  }

  Widget tampilanMenu(Color warna, String gambar, String title,
      BuildContext context, String kelasTujuan) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, kelasTujuan);
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
