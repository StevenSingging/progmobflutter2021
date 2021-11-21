import 'package:flutter/material.dart';
import 'package:progmobflutter2021/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dosen/dashboardsn.dart';
import 'mahasiswa/dashboardmhs.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
        drawer: Drawer(

          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Arsyadhelsing"),
                accountEmail: Text("Arsyadhelsing@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "AH",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Data Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardDsn(title: "Dashboard Dosen")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Data Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.library_books),
                subtitle: Text("Menu CRUD Matakuliah"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Data jadwal"),
                trailing: Icon(Icons.schedule),
                subtitle: Text("Menu CRUD Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              Divider(
                color: Colors.black,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
                  );
                },
              ),
            ],
        ),
      ),
      body: Container(
        child: Center(
         child: Text("Dashboard",
           style: TextStyle(
             fontSize: 20
           )
         ),
        ),
      )
    );
  }
}