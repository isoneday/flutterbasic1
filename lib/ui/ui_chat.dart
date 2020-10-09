import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/data/data_chat.dart';
import 'package:myfirstapp_flutter/model/model_chat.dart';

class UIWA {
  ListView buidListView() {
    return ListView.builder(
        itemCount: DataChat.itemCount,
        itemBuilder: (context, index) {
          ModelChat makanan = DataChat.getItemMakanan(index);
          return InkWell(
            splashColor: Colors.red,
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => DetailMakanan(
              //               makanan: makanan,
              //             )));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                          tag: makanan.nama,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(makanan.gambar),
                            radius: 30,
                          )),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    makanan.nama,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    makanan.tanggal,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Text(
                                makanan.isiPesan,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider()
                ],
              ),
            ),
          );
        });
  }
}
