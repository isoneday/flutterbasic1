import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds:  MyHomeApp(),
        title:  Text('Welcome In Flutter Icon+'),
        image:  Image.asset('gambar/ojol.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader:  TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
