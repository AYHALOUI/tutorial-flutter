import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vb_jjhgg/drawe/MyDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 30, color: Colors.black,),
        ),
      ),
    );
  }
}
