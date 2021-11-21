import 'package:flutter/material.dart';
import 'package:progmobflutter2021/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardDsn extends StatefulWidget {
  const DashboardDsn({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDsnState createState() => _DashboardDsnState();
}

class _DashboardDsnState extends State<DashboardDsn> {
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
                    title: Text("Argo Uciha"),
                    subtitle: Text("0831445666-argouciha@gmail.com"),
                  )
                ],
              ),
            )
        )
        );
      }
    }