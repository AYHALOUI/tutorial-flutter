

import 'package:flutter/material.dart';

class SimpleListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListeView Simple"),
      ),
      body: ListView(
        children: [
          Card(child:ListTile(
            title: Text("Item 1"),
          )),
          Card(child:ListTile(
            title: Text("Item 2"),
          )),
          Card(child:ListTile(
            title: Text("Item 3"),
          )),
          Card(child:ListTile(
            title: Text("Item 4"),
          )),
          Card(child:ListTile(
            title: Text("Item 5"),
          )),
        ],
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
      ),
    );
  }
}
