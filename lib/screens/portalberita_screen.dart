import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstapp_flutter/model/model_portaberita.dart';
import 'package:myfirstapp_flutter/ui/ui_portalberita.dart';
import 'package:toast/toast.dart';

class PortalBeritaScreen extends StatefulWidget {
  static String id = "portal";
  @override
  _PortalBeritaScreenState createState() => _PortalBeritaScreenState();
}

class _PortalBeritaScreenState extends State<PortalBeritaScreen> {
  bool loading;
  List itemListBerita;
  UIPortalBerita portalBerita = UIPortalBerita();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataaBerita();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Portal Berita"),
        ),
        body: loading == true
            ? Center(child: CircularProgressIndicator())
            : portalBerita.buildListView(itemListBerita));
  }

  getDataaBerita() async {
    loading = true;
    String url =
        "https://newsapi.org/v2/everything?q=covid&apiKey=9ba80533c8274efe96cb442df3512e5b";
    var response = await http.get(Uri.encodeFull(url));
    print("result00 : ${response.toString()}");
    if (response.statusCode == 200) {
      Toast.show("sukses menampilkan data", context);
      var data = json.decode(response.body);
      var articles = data["articles"] as List;
      print("result11 : ${data.toString()}");
      setState(() {
        loading = false;
        itemListBerita = articles
            .map<Articles>((value) => Articles.fromJson(value))
            .toList();
      });
    } else {
      Toast.show("gagal menampilkan data", context);
      setState(() {
        loading = false;
      });
    }
    return itemListBerita;
  }
}
