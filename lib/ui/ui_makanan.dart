import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/data/data_makanan.dart';
import 'package:myfirstapp_flutter/model/model_makanan.dart';
import 'package:myfirstapp_flutter/screens/makanan_screen.dart';

class UIMakanan {
  ListView buildListView() {
    return ListView.builder(
        itemCount: DataMakanan.itemCount,
        itemBuilder: (context, index) {
          ModelMakanan makanan = DataMakanan.getItemMakanan(index);
          return InkWell(
            splashColor: Colors.red,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailMakanan(
                            makanan: makanan,
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 7,
                shadowColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        makanan.namaMkn,
                        style: TextStyle(fontSize: 25),
                      ),
                      Hero(
                          tag: makanan.namaMkn,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(makanan.gambarMkn),
                            radius: 28,
                          ))
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

  Widget buildDetailMakanan(ModelMakanan makanan, BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
                tag: makanan.namaMkn, child: Image.asset(makanan.gambarMkn))),
        Text(
          makanan.namaMkn,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          makanan.detailMkn,
          style: TextStyle(
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
