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
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png"),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              "Username : iswandi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Email : iswandi.saputra11@gmail.com",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
              ListTile(
                title: Text("Makanan"),
                onTap: () {
                  Navigator.pushNamed(context, MakananScreen.id);
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("Portal berita"),
                onTap: () {
                  Navigator.pushNamed(context, PortalBeritaScreen.id);
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("Camera"),
                onTap: () {
                  Navigator.pushNamed(context, CameraScreen.id);
                },
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
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
