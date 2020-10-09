import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/screens/utama_screen.dart';

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  // String email, password;
  final formKey = GlobalKey<FormState>();
  bool validasi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.home),
          centerTitle: true,
          actions: [
            Icon(
              Icons.settings,
              color: Colors.red,
            ),
            Icon(Icons.search),
          ],
          title: Center(
              child: Text("Fluter Icon+",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber[50],
                      fontWeight: FontWeight.bold)))),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidate: validasi,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    "gambar/ojol.png",
                    // network(
                    //   "https://cdn.iconscout.com/icon/free/png-512/flutter-2038877-1720090.png",
                    height: 100,
                    width: 100,
                    // color: Colors.black,
                  ),
                ),
                Text("Flutter Icon+",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.amber[50],
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      // onSaved: (newValue) {
                      //   email = newValue;
                      // },
                      validator: validasiEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "email",
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: "enter Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      // onSaved: (newValue) {
                      //   password = newValue;
                      // },
                      validator: validasiPassword,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "password",
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintText: "enter Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.red)))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(
                    builder: (c) => Container(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            cekValidasi(c);
                          },
                          child: Text("Login"),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }

  String validasiEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value.trim()))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validasiPassword(String value) {
    if (value.length < 6) {
      return 'password harus lebih besar dari 5';
    } else {
      return null;
    }
  }

  void cekValidasi(BuildContext c) {
    if (formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      Scaffold.of(c).showSnackBar(SnackBar(content: Text('validasi berhasil')));
      //pindah halaman
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UtamaScreen()));
    } else {
      Scaffold.of(c).showSnackBar(SnackBar(content: Text('validasi gagal')));
    }
  }
}
