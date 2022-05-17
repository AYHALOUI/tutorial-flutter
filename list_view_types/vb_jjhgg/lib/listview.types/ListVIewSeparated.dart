import 'package:flutter/material.dart';
class SeparatedListView extends StatelessWidget {
  const SeparatedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> Cars = ['Car 1', 'Car 2', 'Car 3', 'Car 4','Car 5'];
    List<String> ImgCars = ['images/im1.jpg', 'images/im2.jpg', 'images/im3.jpg', 'images/im4.jpg','images/im1.jpg'];

    return Scaffold(
      appBar: AppBar(title: Text("ListView Separated"),),
      body: ListView.separated(
        itemCount: Cars.length,

        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Cars[index]),
            leading: CircleAvatar(
              backgroundImage: AssetImage(ImgCars[index]),
            ),
          );
        },
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return Divider(height: 1, color: Colors.deepOrange, );
        },
      ),
    );
  }
}
