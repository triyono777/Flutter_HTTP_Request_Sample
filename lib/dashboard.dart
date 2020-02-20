import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample HTTP Request'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTemplate(
              label: 'Login',
              onpress: () {
                Navigator.pushNamed(context, '/Login');
              },
            ),
            ButtonTemplate(
              label: 'Register',
              onpress: () {
                Navigator.pushNamed(context, '/Register');
              },
            ),
            ButtonTemplate(
              label: 'ListDataContacts',
              onpress: () {
                Navigator.pushNamed(context, '/ListData');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonTemplate extends StatelessWidget {
  final onpress;
  final label;
  const ButtonTemplate({
    Key key,
    this.onpress,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.deepPurple,
      child: Text(
        label ?? 'ListDataContacts',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onpress ??
          () {
            Navigator.pushNamed(context, '/ListData');
          },
    );
  }
}
