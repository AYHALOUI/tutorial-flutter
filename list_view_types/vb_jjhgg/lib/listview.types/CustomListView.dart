import 'package:flutter/material.dart';
class CustomListView extends StatelessWidget {
   CustomListView({Key? key}) : super(key: key);

  List<Color> colors = [Colors.black, Colors.teal, Colors.red, Colors.blue,Colors.white];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("ListView Custom")),
      body: ListView.custom(
        padding: EdgeInsets.all(5),
        childrenDelegate: SliverChildBuilderDelegate((context, index){
          return Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(5),
            color: colors[index],
          );
        }, childCount:  colors.length
       ),
      ),
    );
  }
}
