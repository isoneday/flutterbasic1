import 'package:myfirstapp_flutter/model/model_makanan.dart';

class DataMakanan {
  static var itemMakanan = [
    ModelMakanan(
        "ayam goreng",
        "https://id.wikipedia.org/wiki/Ayam_goreng",
        "Ayam goreng adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. ",
        "gambar/ayam.jpg"),
    ModelMakanan(
        "bakso",
        "https://id.wikipedia.org/wiki/Bakso",
        "bakso adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. ",
        "gambar/bakso.jpg"),
    ModelMakanan(
        "sate",
        "https://id.wikipedia.org/wiki/Sate",
        "sate adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. ",
        "gambar/sate.jpg"),
    ModelMakanan(
        "soto",
        "https://id.wikipedia.org/wiki/Soto",
        "soto adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. ",
        "gambar/soto.jpg"),
  ];
//untuk mengambil total data yang akan ditampilkan
  static var itemCount = itemMakanan.length;
//get item sesuai dengan index
  static ModelMakanan getItemMakanan(int index) {
    return itemMakanan[index];
  }
}
