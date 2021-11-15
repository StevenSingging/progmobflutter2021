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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "test Input2",
                hintText: "Text yang diinput formatnya sbb,",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20),
                )
              ),
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
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
       // child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}