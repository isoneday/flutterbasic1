import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/config.dart';
import 'package:myfirstapp_flutter/main.dart';

void main() {
  Config.appFlavor = Flavor.DEV;
  return runApp(MyApp());
}
