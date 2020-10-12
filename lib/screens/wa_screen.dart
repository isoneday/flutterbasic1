import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/ui/ui_chat.dart';

class WaScreen extends StatefulWidget {
    static String id = "wa";
  @override
  _WaScreenState createState() => _WaScreenState();
}

class _WaScreenState extends State<WaScreen>
    with SingleTickerProviderStateMixin {
  TabController myController;
  UIWA wa = UIWA();
  @override
  void initState() {
    // TODO: implement initState
    myController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        backgroundColor: Colors.green,
        bottom: TabBar(
            controller: myController,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Status",
              ),
              Tab(
                text: "Call",
              ),
            ]),
      ),
      body: TabBarView(controller: myController, children: [
        Center(child: Icon(Icons.camera_alt)),
        wa.buidListView(),
        Center(child: Icon(Icons.camera_alt)),
        Center(child: Icon(Icons.camera_alt)),
      ]),
    );
  }
}
