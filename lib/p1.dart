import 'package:flutter/material.dart';
import 'package:progmobflutter2021/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class P1 extends StatefulWidget {
  const P1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _P1State createState() => _P1State();
}

class _P1State extends State<P1> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh : Arsyadhelsing",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Nama tidak boleh Kosong";
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.orange,
                onPressed: () {  },
              ),
              RaisedButton(
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.orange,
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
       // child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}