import 'package:flutter/material.dart';




class BuilderListView extends StatelessWidget {

  List<String> Cars = ['Car 1', 'Car 2', 'Car 3', 'Car 4','Car 5'];
  List<String> ImgCars = ['images/im1.jpg', 'images/im2.jpg', 'images/im3.jpg', 'images/im4.jpg','images/im1.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(Cars[index]),
              leading: CircleAvatar(
                backgroundImage: AssetImage(ImgCars[index]),
              ),
            ),

          );
        },
        itemCount: Cars.length,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
