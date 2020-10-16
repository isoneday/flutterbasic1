import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/screens/camera_screen.dart';
import 'package:myfirstapp_flutter/screens/home_screen.dart';
import 'package:myfirstapp_flutter/screens/makanan_screen.dart';
import 'package:myfirstapp_flutter/screens/quiz_screen.dart';
import 'package:myfirstapp_flutter/screens/statemanagement_screens.dart';

import 'screens/minuman_screen.dart';
import 'screens/portalberita_screen.dart';
import 'screens/splashloading_screen.dart';
import 'screens/utama_screen.dart';
import 'screens/wa_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = counter ?? 0;
  }

  void incrementCounter(_) {
    setState(() {
      counter++;
      print("increment: $counter");
    });
  }

  void decrementCounter(_) {
    setState(() {
      counter--;
      print("decrement: $counter");
    });
  }

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
        } else if (settings.name == StateManagementScreen.id) {
          return MaterialPageRoute(builder: (context) {
            return StateManagementScreen(
              counter: counter,
              decrementCounter: decrementCounter,
              incrementCounter: incrementCounter,
            );
          });
        } else if (settings.name == DetailStateManagement.id) {
          return MaterialPageRoute(builder: (context) {
            return DetailStateManagement(
              counter: counter,
              decrementCounter: decrementCounter,
            );
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
        CameraScreen.id: (context) => CameraScreen(),
        QuizScreen.id: (context) => QuizScreen(),
        // DetailMakanan.id: (context) => DetailMakanan(),
        // WebMakanan.id: (context) => WebMakanan(),
      },
    );
  }
}
