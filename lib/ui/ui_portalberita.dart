import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/data/data_makanan.dart';
import 'package:myfirstapp_flutter/model/model_makanan.dart';
import 'package:myfirstapp_flutter/model/model_portaberita.dart';
import 'package:myfirstapp_flutter/screens/makanan_screen.dart';
import 'package:myfirstapp_flutter/screens/portalberita_screen.dart';

class UIPortalBerita {
  ListView buildListView(List itemListBerita) {
    return ListView.builder(
        itemCount: itemListBerita?.length ?? 0,
        itemBuilder: (context, index) {
          Articles berita = itemListBerita[index];
          return InkWell(
            splashColor: Colors.red,
            onTap: () {
              Navigator.pushNamed(context, DetailBerita.id, arguments: berita);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                          tag: berita.title,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: SizedBox(
                                width: double.infinity,
                                child: Image.network(berita?.urlToImage ??
                                    "https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png")),
                          )),
                      Text(
                        berita?.title ?? "no title",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text(berita?.author ?? "no author")),
                          Flexible(
                              child: Text(
                                  berita?.publishedAt.substring(0, 10) ??
                                      "no publishedAt")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  ListView buildListViewDefault() {
    return ListView.builder(
        itemCount: DataMakanan.itemCount,
        itemBuilder: (context, index) {
          ModelMakanan makanan = DataMakanan.getItemMakanan(index);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 7,
              shadowColor: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    makanan.namaMkn,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("sub makanan"),
                  trailing: CircleAvatar(
                    backgroundImage: AssetImage(makanan.gambarMkn),
                    radius: 28,
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget buildDetailBerita(Articles berita, BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
                tag: berita.title, child: Image.network(berita.urlToImage))),
        Text(
          berita.title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          berita.description,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          berita.content,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
