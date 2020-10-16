import 'package:myfirstapp_flutter/model/model_makanan.dart';

class DataMakanan {
  static var itemMakanan = [
    ModelMakanan(
        "Apel",
        "https://id.wikipedia.org/wiki/Apel",
        "apel adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. ",
        "gambar/ayam.jpg"),
    ModelMakanan(
        "buah naga",
        "https://id.wikipedia.org/wiki/Buah_naga",
        "Buah naga (Inggris: Pitaya) adalah buah dari beberapa jenis kaktus dari marga Hylocereus dan Selenicereus. Buah ini berasal dari Meksiko, Amerika Tengah dan Amerika Selatan namun sekarang juga dibudidayakan di negara-negara Asia seperti Taiwan, Vietnam, Filipina, Indonesia dan Malaysia. ",
        "gambar/naga.jpeg"),
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
