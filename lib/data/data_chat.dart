import 'package:myfirstapp_flutter/model/model_chat.dart';

class DataChat {
  static var itemChat = [
    ModelChat("ayam goreng", "https://id.wikipedia.org/wiki/Ayam_goreng",
        "09/10/2020", "gambar/ayam.jpg"),
    ModelChat("bakso", "https://id.wikipedia.org/wiki/Bakso", "09/10/2020",
        "gambar/bakso.jpg"),
    ModelChat("sate", "https://id.wikipedia.org/wiki/Sate", "09/10/2020",
        "gambar/sate.jpg"),
    ModelChat("soto", "https://id.wikipedia.org/wiki/Soto", "09/10/2020",
        "gambar/soto.jpg"),
  ];
//untuk mengambil total data yang akan ditampilkan
  static var itemCount = itemChat.length;
//get item sesuai dengan index
  static ModelChat getItemMakanan(int index) {
    return itemChat[index];
  }
}
