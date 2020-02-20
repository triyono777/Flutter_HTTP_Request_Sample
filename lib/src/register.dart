import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Map<String, String> _user = {};

  ///    "email": "eve.holt@reqres.in",
  //    "password": "pistol"

  register() {
    http.post("https://reqres.in/api/register", body: _user).then((res) {
      var resJson = json.decode(res.body);

      if (resJson['error'] != null) {
        Toast.show("Something Went wrong -> " + resJson['error'], context,
            gravity: Toast.CENTER);
      } else {
        Toast.show(
            "Registerd Successfully , token= " + resJson['token'], context,
            gravity: Toast.CENTER);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: SingleChildScrollView(
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
                child: Text("Register"),
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
                    Text('register succesfull'),
                    Text('email: eve.holt@reqres.in'),
                    Text('password: pistol'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('register unsuccesfull'),
                    Text('email: sydney@fife'),
                    Text('without password'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
