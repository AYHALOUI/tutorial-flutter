import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GitRepositories extends StatefulWidget {

  String login;
  String avatar_url;
  GitRepositories({required this.login, required this.avatar_url});

  @override
  State<GitRepositories> createState() => _GitRepositoriesState();
}


class _GitRepositoriesState extends State<GitRepositories> {

  dynamic dataRepositorie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadRepositories();
  }

  void _loadRepositories() async{
    String url = 'https://api.github.com/users/${widget.login}/repos';
    Uri request = Uri.parse(url);
    http.Response response = await http.get(request);
    if(response.statusCode == 200){
      setState(() {
        this.dataRepositorie = jsonDecode(response.body);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Repositories => ${this.widget.login}'), actions: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            widget.avatar_url,
          ),
        )
      ],),
      body: ListView.separated(itemBuilder: (context, index){
        return ListTile(
          title: Text("${dataRepositorie[index]['name']}"),
        );
      },
          separatorBuilder: (context,index){
          return Divider(height: 2, color: Colors.blue,);
          },
          itemCount: dataRepositorie!= null?dataRepositorie.length:0),
    );
  }
}
