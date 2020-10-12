import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstapp_flutter/model/model_portaberita.dart';
import 'package:myfirstapp_flutter/network/network_berita.dart';
import 'package:myfirstapp_flutter/ui/ui_portalberita.dart';
import 'package:toast/toast.dart';

class PortalBeritaScreen extends StatefulWidget {
  static String id = "portal";
  @override
  _PortalBeritaScreenState createState() => _PortalBeritaScreenState();
}

class _PortalBeritaScreenState extends State<PortalBeritaScreen> {
  bool loading;
  List<Articles> itemListBerita;
  UIPortalBerita portalBerita = UIPortalBerita();
  NetworkBerita networkBerita = NetworkBerita();
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
    networkBerita.getDataBeritabyKeyword().then((response) {
      if (response.status == "ok") {
        var articles2 = response.articles;
        print("yes,berhasil" + response.status);
        setState(() {
          loading = false;
          itemListBerita = articles2;
        });
        if (response.totalResults == 0) {
          Toast.show("tidak ada data", context);
          setState(() {
            loading = false;
          });
        }
      } else {
        Toast.show("gagal menampilkan data", context);
        setState(() {
          loading = false;
        });
      }
    }).catchError(getError);
  }

  getError(error) {
    setState(() {
      loading = false;
    });
    if (error is NotFoundException) {
      print("not found");
    } else {
      Toast.show("gagal ", context);
    }
  }
}

class DetailBerita extends StatelessWidget {
  static String id = "detailBerita";
  UIPortalBerita portalBerita = UIPortalBerita();
  Articles berita;
  // DetailBerita(this.makanan, {this.nama});
  DetailBerita({Key key, @required this.berita}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(berita.title),
          actions: [
            IconButton(
                icon: Icon(Icons.link),
                onPressed: () {
                  Navigator.pushNamed(context, WebBerita.id,
                      arguments: berita.url);
                })
          ],
        ),
        body: portalBerita.buildDetailBerita(berita, context));
  }
}

class WebBerita extends StatelessWidget {
  static String id = "webberita";
  String webBerita;
  WebBerita({Key key, @required this.webBerita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: webBerita,
      appBar: AppBar(
        title: Text("Berita"),
      ),
    );
  }
}
