import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/screens/home_screen.dart';
import 'package:myfirstapp_flutter/screens/utama_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: checkSession(context),
        title: Text('Welcome In Flutter Icon+'),
        image: Image.asset('gambar/ojol.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }

  checkSession(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool sesi = prefs.getBool("sesi") ?? false;
    if (sesi == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UtamaScreen()));
    } else {
      prefs.setBool("sesi", true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomeApp()));
    }
  }
}
