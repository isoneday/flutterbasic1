import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:myfirstapp_flutter/model/model_makanan.dart';
import 'package:myfirstapp_flutter/ui/ui_makanan.dart';

class MakananScreen extends StatelessWidget {
  UIMakanan uimakanan = UIMakanan();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Makanan"),
      ),
      body: uimakanan.buildListView(),
    );
  }
}

class DetailMakanan extends StatelessWidget {
  UIMakanan uimakanan = UIMakanan();
  ModelMakanan makanan;
  // DetailMakanan(this.makanan, {this.nama});
  DetailMakanan({Key key, @required this.makanan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(makanan.namaMkn),
          actions: [
            IconButton(
                icon: Icon(Icons.link),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebMakanan(
                                webMakanan: makanan.webMkn,
                              )));
                })
          ],
        ),
        body: uimakanan.buildDetailMakanan(makanan, context));
  }
}

class WebMakanan extends StatelessWidget {
  String webMakanan;
  WebMakanan({Key key, @required this.webMakanan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: webMakanan,
      appBar: AppBar(
        title: Text("web makanan"),
      ),
    );
  }
}
