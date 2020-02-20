import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListDataPage extends StatefulWidget {
  @override
  _ListDataPageState createState() => _ListDataPageState();
}

class _ListDataPageState extends State<ListDataPage> {
  List _users = [];

  getUsers() async {
    http.get("https://reqres.in/api/users").then((res) {
      Map userData = json.decode(res.body);
      setState(() {
        _users = userData["data"];
      });
    });
  }

  @override
  void initState() {
//    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => getUsers(),
          )
        ],
      ),
      body: _users.length == 0
          ? Center(child: Text("No user Found, silahkan pencet tombol refresh"))
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(_users[index]['avatar'])),
                  title: Text(_users[index]['first_name'] +
                      " " +
                      _users[index]['last_name']),
                );
              },
            ),
    );
  }
}
