import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, String> _user = {};

  ///"email": "eve.holt@reqres.in",
//    "password": "cityslicka"

  register() {
    http.post("https://reqres.in/api/login", body: _user).then((res) {
      var resJson = json.decode(res.body);

      if (resJson['error'] != null) {
        Toast.show("Something Went wrong -> " + resJson['error'], context,
            gravity: Toast.CENTER);
      } else {
        Toast.show("Login Successfully , token= " + resJson['token'], context,
            gravity: Toast.CENTER);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (val) {
                  setState(() {
                    _user['email'] = val;
                  });
                }),
            TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (val) {
                  setState(() {
                    _user['password'] = val;
                  });
                }),
            OutlineButton(
              child: Text("Login"),
              onPressed: () {
                register();
              },
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Login Successfull'),
                  Text('"email": "eve.holt@reqres.in"'),
                  Text('password": "cityslicka'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('login unsuccesfull'),
                  Text(' "email": "peter@klaven"'),
                  Text('without password'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
