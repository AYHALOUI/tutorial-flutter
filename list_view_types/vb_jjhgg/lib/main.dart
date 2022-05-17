import 'package:flutter/material.dart';
import 'package:vb_jjhgg/HomePage.dart';
import 'package:vb_jjhgg/listview.types/CustomListView.dart';
import 'package:vb_jjhgg/listview.types/ListViewBuilder.dart';
import 'package:vb_jjhgg/listview.types/ListViewSimple.dart';

import 'listview.types/ListVIewSeparated.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> listS = ['ListView Simple','ListView Builder','ListView Separated','ListView Custom'];
    return MaterialApp(
      routes: {
        '/ls': (context)=>SimpleListView(),
        '/lSe':(context)=>SeparatedListView(),
        '/lb': (context) =>BuilderListView(),
        '/lc': (context) =>CustomListView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),

    );
  }
}
