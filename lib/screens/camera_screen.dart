import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class CameraScreen extends StatefulWidget {
  static String id = "camera";
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File fileImage;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera"),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              getByteFromFile();
            },
          )
        ],
      ),
      body: fileImage == null
          ? Center(
              child: Text("Tidak Ada Gambar"),
            )
          : Image.file(fileImage),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            tampilPilihan();
          }),
    );
  }

  tampilPilihan() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text(
                    "take a photo",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    getImageFromCamera();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Text(
                    "open galery",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    getImageFromGalery();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        fileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
      Navigator.pop(context);
    });
  }

  Future getImageFromGalery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        fileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
      Navigator.pop(context);
    });
  }

  Future<ByteData> getByteFromFile() async {
    final ByteData bytes = await rootBundle.load(fileImage.path);
    await Share.file('share image via:', path.basename(fileImage.path),
        bytes.buffer.asUint8List(), 'image/png',
        text: 'My optional text.');
  }
}
