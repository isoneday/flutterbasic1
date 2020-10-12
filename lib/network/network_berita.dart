import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:myfirstapp_flutter/model/model_portaberita.dart';

class NotFoundException implements Exception {
  String cause;
  NotFoundException(this.cause);
}

class NetworkBerita {
  static String url = "https://newsapi.org/v2/";

  Future<Model_PortalBerita> getDataBeritabyKeyword() async {
    var response = await http.get(Uri.encodeFull(
        url + "everything?q=covid&apiKey=9ba80533c8274efe96cb442df3512e5b"));
    print("result00 : ${response.toString()}");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print("result11 : ${data.toString()}");
      Model_PortalBerita model_portalBerita = Model_PortalBerita.fromJson(data);

      return model_portalBerita;
    } else {
      if (response.statusCode == 400) {
        throw NotFoundException("NOT FOUND");
      } else {
        throw Exception("unable to load");
      }
    }
  }
}
