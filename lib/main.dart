import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_contoh/src/ListData.dart';
import 'dart:convert';

import 'package:http_contoh/src/dashboard.dart';
import 'package:http_contoh/src/login.dart';
import 'package:http_contoh/src/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
      routes: {
        '/Register': (context) => RegisterPage(),
        '/ListData': (context) => ListDataPage(),
        '/Login': (context) => LoginPage(),
      },
    );
  }
}
