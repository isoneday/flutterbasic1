import 'package:flutter/material.dart';

import 'screens/splashloading_screen.dart';   

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashLoadingScreen(),
      //untuk menghilangkan icon debug di dalam aplikasi
      debugShowCheckedModeBanner: false,
    );
  }
}

