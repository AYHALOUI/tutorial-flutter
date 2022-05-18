import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:demo_app/repositories/GetRepositories.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  TextEditingController queryController = new TextEditingController();
  String query = "";
  bool NotVisible = false;
  dynamic data;

  int current_page=0;
  int total_pages = 0;
  int page_size =20;

  ScrollController _scrollController = new ScrollController();

  List<dynamic> items =[];


  void retrieveData(String query) {
    String url ="https://api.github.com/search/users?q=${query}&per_page=${page_size}&page=${current_page}";
    Uri request = Uri.parse(url);
    print(request.toString());
    http.get(request).then((value) {
      setState(() {
        this.data = jsonDecode(value.body);
        this.items.addAll(data['items']);
        if(data['total_count'] % page_size ==0){
          total_pages = data['total_count']~/page_size;
          print(total_pages);
        }else total_pages = (data['total_count']/page_size).floor() +1;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        setState(() {
          if(current_page<total_pages-1){
            current_page++;
            retrieveData(query);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users =>${query} => ${current_page} / ${total_pages}"),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: NotVisible,
                    onChanged: (value) {
                      setState(() {
                        this.query = value;
                        //print(query);
                      });
                    },
                    controller: queryController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        suffixIcon: IconButton(
                          onPressed: () {
                            NotVisible = !NotVisible;
                            print(NotVisible);
                          },
                          icon: Icon(NotVisible == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                        )),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      items =[];
                      current_page = 0;
                      this.query = queryController.text;
                      retrieveData(query);
                    });
                  },
                  icon: Icon(
                    Icons.search,
                  ))
            ],
          ),
          Expanded(
            child: ListView.separated(itemBuilder: (context, index){
              return ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GitRepositories(login: items[index]['login'],
                        avatar_url: items[index]['avatar_url'],
                      )
                      )
                  );
                },
               title: Row(
                 children: [
                   CircleAvatar(
                     backgroundImage: NetworkImage("${items[index]['avatar_url']}"),
                     radius: 20,
                   ),
                   SizedBox(width: 5,),
                   Text("${items[index]['login']}"),
                   SizedBox(
                     width: 30,
                   ),
                   CircleAvatar(
                     child: Text(items[index]['score'].toString(),),
                     radius: 15,

                   )
                 ],
               ),
              );
            }, itemCount: items.length,
              controller: _scrollController,
              separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 2, color: Colors.blue,);
              },
            ),
          )
        ],
      )),
    );
  }
}
