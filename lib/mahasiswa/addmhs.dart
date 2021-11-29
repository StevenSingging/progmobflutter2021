import 'package:flutter/material.dart';
import 'package:progmobflutter2021/apiservice.dart';
import 'dart:io';
import 'dart:convert';
import 'package:progmobflutter2021/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMhs extends StatefulWidget{
  final String title;

  const AddMhs({Key? key, required this.title}) : super(key: key);


  @override
  _AddMhsState createState() => _AddMhsState(title);

}

class _AddMhsState extends State<AddMhs> {
  final GlobalKey<FormState> _FormState = GlobalKey<FormState>();
  final String title;
  _AddMhsState(this.title);
  bool _IsLoading = false;
  Mahasiswa mhs = new Mahasiswa(id: '', alamat: '', email: '', nama: '', nim: '', foto: '', nim_progmob: '');
  late File _imageFile;

 Future<void> _pickImage(ImageSource source) async{
   File selected = await ImagePicker.pickImage(source: source);

   setState(() {
     _imageFile = selected;
   });

   @override
   Widget build(BuildContext context){
     return Scaffold(
       appBar: new AppBar(
         title: new Text(this.title),
       ),
       body: Container(
         padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
         child: SingleChildScrollView(
           child: Stack(
             children: <Widget>[
               Form(
                 key: _FormState,
                 child: Column(
                   children: <Widget> [
                     SizedBox(
                       height: 15,
                     ),
                     TextFormField(
                       decoration: InputDecoration(
                         labelText: "NIM",
                         hintText:  "NIM",
                         border: OutlineInputBorder(),
                         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                       ),
                       onSaved: (String value){
                         this.mhs.nim = value;
                       },
                     ),
                     SizedBox(
                       height: 25,
                     ),
                     TextFormField(
                       decoration: InputDecoration(
                         labelText: "Nama",
                         hintText:  "Nama Mahasiswa",
                         border: OutlineInputBorder(),
                         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                     ),
                       onSaved: (String value){
                         this.mhs.nama = value;
                       },
                     ),
                     SizedBox(
                       height: 25,
                     ),
                     TextFormField(
                       decoration: InputDecoration(
                         labelText: "Alamat",
                         hintText:  "Alamat Mahasiswa",
                         border: OutlineInputBorder(),
                         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                       ),
                       onSaved: (String value){
                         this.mhs.alamat = value;
                       },
                     ),
                     SizedBox(
                       height: 25,
                     ),
                     TextFormField(
                       decoration: InputDecoration(
                         labelText: "Email",
                         hintText:  "Email Mahasiswa",
                         border: OutlineInputBorder(),
                         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                       ),
                       keyboardType: TextInputType.emailAddress,
                       onSaved: (String value){
                         this.mhs.email = value;
                       },
                     ),
                    _imageFile == null
                     ? Text("Silahkan Memilih gambar Terlebih Dahulu")
                        : Image.file(
                      _imageFile,
                      fit: BoxFit.cover,
                      height: 300.0,
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                    ),
                     MaterialButton(
                       minWidth: MediaQuery.of(context).size.width,
                       padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                       color: Colors.blue,
                       onPressed: (){
                         _pickImage(ImageSource.gallery);
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           new Icon(Icons.image,color: Colors.white,),
                           Text("upload Foto",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold
                             ),
                           )
                         ],
                       )
                     ),
                     SizedBox(
                       height: 15,
                     ),
                     MaterialButton(
                       minWidth: MediaQuery.of(context).size.width,
                       padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                       color: Colors.blue,
                       onPressed: (){
                         return showDialog(
                           context: context,
                           builder: (context){
                             return AlertDialog(
                               title: Text("Simpan Data"),
                               content: Text("Apakah anda akan Menyimpan data ini?"),
                               actions: <Widget>[
                                 FlatButton(
                                   onPressed: () async{
                                     _FormState.currentState.save();
                                     setState(() => _IsLoading = true);
                                     this.mhs.nim_progmob = "72190289";
                                     //List<int> ImageBytes = _imageFile.readAsBytesSync();
                                     //this.mhs.foto = base64Encode(ImageBytes);
                                     ApiService().createMhsWithFoto(this.mhs, _imageFile, _imageFile.path).then((isSuccess){
                                       setState(() => _IsLoading = false);
                                       if(isSuccess){
                                         Navigator.pop(context);
                                         Navigator.pop(context);
                                       }else{
                                         Navigator.pop(context);
                                         Navigator.pop(context);
                                       }
                                     });
                                   },
                                   child: Text("ya"),
                                 ),
                                 FlatButton(
                                   onPressed: (){
                                     Navigator.pop(context);
                                   },
                                   child: Text("Tidak"),
                                 )
                               ],
                             );
                           },
                         );
                       },
                       child: Text("Simpan",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                     )
                   ],
                 ),
               ),
               _IsLoading
                   ? Stack(
                 children: <Widget>[
                   Opacity(
                       opacity: 0.3,
                     child: ModalBarrier(
                       dismissible: false,
                       color: Colors.grey,
                     ),
                   ),
                   Center(
                     child: CircularProgressIndicator(),
                   ),
                 ],
               )
                   : Container(),
             ],
           ),
         ),
       ),
     );
   }

 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}