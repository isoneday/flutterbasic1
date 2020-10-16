import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/databases/dbhelper.dart';
import 'package:myfirstapp_flutter/model/user.dart';
import 'package:toast/toast.dart';

class DatabaseSqfliteScreen extends StatefulWidget {
  static String id = "database";
  @override
  _DatabaseSqfliteScreenState createState() => _DatabaseSqfliteScreenState();
}

class _DatabaseSqfliteScreenState extends State<DatabaseSqfliteScreen> {
  var txtNameController = TextEditingController();
  var txtPhoneController = TextEditingController();
  var txtEmailController = TextEditingController();
  bool status = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  bool autoValidate = false;
  List<User> itemUser;
  List<User> user;
  bool insertData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("DATABASE SQFLite"),
      ),
      body: getAllData(),
      floatingActionButton: buildFAB(),
    );
  }

  getAllData() {
    return FutureBuilder(
      future: getDataUser(),
      builder: (context, snapshot) {
        return createListView(context, snapshot);
      },
    );
  }

  createListView(BuildContext context, AsyncSnapshot snapshot) {
    user = snapshot.data;
    if (user != null) {
      return AnimatedList(
          key: listKey,
          shrinkWrap: true,
          initialItemCount: user.length,
          itemBuilder: (context, index, animation) {
            return buildItemList(user[index], animation, index);
          });
    } else {
      return Container(
        child: Text("tidak ada data"),
      );
    }
  }

  buildItemList(User user, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          // onTap: () => ,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  margin: EdgeInsets.only(top: 6),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Text(
                      user.name.substring(0, 1).toUpperCase(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle),
                      Text(user.name, style: TextStyle(fontSize: 17)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      Text(user.phone, style: TextStyle(fontSize: 17)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.email),
                      Text(user.email, style: TextStyle(fontSize: 17)),
                    ],
                  ),
                ],
              )
            ],
          ),
          trailing: Column(
            children: [
              Flexible(
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => onEdit(user, index),
                  color: Colors.green[800],
                ),
              ),
              Flexible(
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onDelete(user, index),
                  color: Colors.green[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //get data from dbSqflite
  getDataUser() async {
    var dbHelper = Helper();
    await dbHelper.getAllUsers().then((value) {
      itemUser = value;
      if (insertData == true) {
        listKey.currentState.insertItem(user.length);
        insertData = false;
      }
    });
    return itemUser;
  }

  buildFAB() {
    return FloatingActionButton(
      onPressed: () => openAlert(null),
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
    );
  }

  openAlert(User user) {
    if (user != null) {
      txtNameController.text = user.name;
      txtPhoneController.text = user.phone;
      txtEmailController.text = user.email;
      status = true;
    } else {
      txtNameController.text = "";
      txtPhoneController.text = "";
      txtEmailController.text = "";
      status = false;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          contentPadding: EdgeInsets.only(top: 12),
          content: Container(
            width: 300,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  status ? "Edit User" : "Add User",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Colors.green,
                  height: 5,
                ),
                Form(
                    key: formKey,
                    autovalidate: autoValidate,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: txtNameController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.green),
                          decoration: InputDecoration(
                            hintText: "add name",
                            fillColor: Colors.grey[300],
                          ),
                          validator: validateName,
                          onSaved: (newValue) {
                            txtNameController.text = newValue;
                          },
                        ),
                        TextFormField(
                          controller: txtPhoneController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: Colors.green),
                          decoration: InputDecoration(
                            hintText: "add phone",
                            fillColor: Colors.grey[300],
                          ),
                          validator: validatePhone,
                          onSaved: (newValue) {
                            txtPhoneController.text = newValue;
                          },
                        ),
                        TextFormField(
                          controller: txtEmailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.green),
                          decoration: InputDecoration(
                            hintText: "add email",
                            fillColor: Colors.grey[300],
                          ),
                          validator: validateEmail,
                          onSaved: (newValue) {
                            txtEmailController.text = newValue;
                          },
                        ),
                        InkWell(
                          onTap: () => status ? editUser(user.id) : addUser(),
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 50, bottom: 50, left: 100, right: 100),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                )),
                            child: Text(
                              status ? "edit user" : "add user",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else if (value.length > 30) {
      return 'Name must be less than 30 charater';
    } else
      return null;
  }

  String validatePhone(String value) {
    Pattern pattern = r'^[0-9]*$';
    RegExp regex = new RegExp(pattern);
    if (value.trim().length != 12)
      return 'Mobile Number must be of 10 digit';
    else if (value.startsWith('+', 0)) {
      return 'Mobile Number should not contain +91';
    } else if (value.trim().contains(" ")) {
      return 'Blank space is not allowed';
    } else if (!regex.hasMatch(value)) {
      return 'Characters are not allowed';
    } else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else if (value.length > 30) {
      return 'Email length exceeds';
    } else
      return null;
  }

  addUser() {
    if (formKey.currentState.validate()) {
      var user = User();
      user.name = txtNameController.text;
      user.email = txtEmailController.text;
      user.phone = txtPhoneController.text;
      var dbHelper = Helper();
      dbHelper.insert(user).then((value) {
        txtNameController.text = "";
        txtEmailController.text = "";
        txtPhoneController.text = "";
        Navigator.pop(context);
        Toast.show("succesfully added data user", context);
        setState(() {
          insertData = true;
        });
      });
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  editUser(int id) {
    if (formKey.currentState.validate()) {
      var user = User();
      user.id = id;
      user.name = txtNameController.text;
      user.email = txtEmailController.text;
      user.phone = txtPhoneController.text;
      var helper = Helper();
      helper.update(user).then((value) {
        txtNameController.text = "";
        txtEmailController.text = "";
        txtPhoneController.text = "";
        Navigator.pop(context);
        Toast.show("Data updated Successfully", context);
        setState(() {
          status = false;
        });
      });
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  onDelete(User user, int index) {
    var id = user.id;
    var helper = Helper();
    helper.delete(id).then((value) {
      User userRemove = itemUser.removeAt(index);
      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return buildItemList(userRemove, animation, index);
      };
      listKey.currentState.removeItem(index, builder);
    });
  }

  onEdit(User user, int index) {
    openAlert(user);
  }
}
