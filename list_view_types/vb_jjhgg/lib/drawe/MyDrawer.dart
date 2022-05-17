import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              backgroundImage: AssetImage("images/im1.jpg"),
            ),
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  "ListView Simple",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/ls');
                },
              ),
              Divider(
                height: 5,
                color: Colors.red,
              ),
              ListTile(
                title: Text("ListView Builder",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/lb');
                },
              ),
              Divider(
                height: 5,
                color: Colors.red,
              ),
              ListTile(
                title: Text("ListView Separated",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/lSe');
                },
              ),
              Divider(
                height: 5,
                color: Colors.red,
              ),
              ListTile(
                title: Text("ListView Custom",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/lc');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
