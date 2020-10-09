import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/data/data_makanan.dart';
import 'package:myfirstapp_flutter/model/model_makanan.dart';
import 'package:myfirstapp_flutter/screens/makanan_screen.dart';

class UiMinuman {
  GridView buildGridView() {
    return GridView.builder(
        itemCount: DataMakanan.itemCount,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 7,
                shadowColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: Hero(
                              tag: makanan.namaMkn,
                              child: Image.asset(
                                makanan.gambarMkn,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                      Text(
                        makanan.namaMkn,
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
