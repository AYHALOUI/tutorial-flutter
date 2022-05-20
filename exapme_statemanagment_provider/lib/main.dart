import 'package:exapme_statemanagment_provider/CounterState.dart';
import 'package:exapme_statemanagment_provider/PageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>CounterState())
    ],
    child: MaterialApp(
      routes: {
        '/':(context)=>PageProvider(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    ),);
  }
}


