import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmobflutter2021/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardMhs extends StatefulWidget {
  const DashboardMhs({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Steven Singing S"),
                subtitle: Text("08314456661-steven@gmail.com"),
              )
            ],
          ),
        )
      )
    );
  }
}