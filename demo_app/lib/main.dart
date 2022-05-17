import 'package:flutter/material.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Center(
        child: Text('Counter Value  => $_counter', style: TextStyle(fontSize: 20),
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              setState(() {
                _counter--;
                print(_counter);
              });
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                _counter++;
                print(_counter);
              });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),

    );
  }
}

