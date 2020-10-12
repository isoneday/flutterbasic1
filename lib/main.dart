import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/screens/home_screen.dart';
import 'package:myfirstapp_flutter/screens/makanan_screen.dart';

import 'screens/minuman_screen.dart';
import 'screens/portalberita_screen.dart';
import 'screens/splashloading_screen.dart';
import 'screens/utama_screen.dart';
import 'screens/wa_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SplashLoadingScreen(),
      //untuk menghilangkan icon debug di dalam aplikasi
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == WebMakanan.id) {
          return MaterialPageRoute(builder: (context) {
            return WebMakanan(webMakanan: settings.arguments);
          });
        } else if (settings.name == DetailMakanan.id) {
          return MaterialPageRoute(builder: (context) {
            return DetailMakanan(makanan: settings.arguments);
          });
        } else if (settings.name == DetailBerita.id) {
          return MaterialPageRoute(builder: (context) {
            return DetailBerita(berita: settings.arguments);
          });
        } else if (settings.name == WebBerita.id) {
          return MaterialPageRoute(builder: (context) {
            return WebBerita(webBerita: settings.arguments);
          });
        }
      },
      initialRoute: SplashLoadingScreen.id,
      routes: {
        SplashLoadingScreen.id: (context) => SplashLoadingScreen(),
        MyHomeApp.id: (context) => MyHomeApp(),
        MakananScreen.id: (context) => MakananScreen(),
        MinumanScreen.id: (context) => MinumanScreen(),
        PortalBeritaScreen.id: (context) => PortalBeritaScreen(),
        UtamaScreen.id: (context) => UtamaScreen(),
        WaScreen.id: (context) => WaScreen(),
        // DetailMakanan.id: (context) => DetailMakanan(),
        // WebMakanan.id: (context) => WebMakanan(),
      },
    );
  }
}
