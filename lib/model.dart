import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class ClicksPeryear{
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPeryear(this.year,this.clicks,this.color)
    : this.color = charts.Color(
    r: color.red , g: color.green, b: color.blue, a: color.alpha);
}

class DashboardSI{
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;

  DashboardSI({required this.mahasiswa,required this.dosen,required this.matakuliah,required this.jadwal});

  factory DashboardSI.fromJson(Map<String,dynamic> json){
    return DashboardSI(
      mahasiswa: json["mahasiswa"],
      dosen: json["dosen"],
      matakuliah: json["matakuliah"],
      jadwal: json["jadwal"]
    );
  }
}

class Mahasiswa{
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Mahasiswa({required this.id, required this.nama,required this.nim,required this.alamat,required this.email,required this.foto,required this.nim_progmob});

  factory Mahasiswa.fromJson(Map<String , dynamic> map){
    return Mahasiswa(id: map["id"], nama: map["nama"], nim: map["nim"], alamat: map["alamat"], email: map["email"],
    foto: map["foto"], nim_progmob: map["nim_progmob"]);
  }

  List<Mahasiswa> mahasiswaFromJson(String jsonData){
    final data = json.decode(jsonData);
    return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
  }

  String mahasiswaToJson(Mahasiswa data){
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }

  Map<String, dynamic>toJson(){
    return("id": id,"nama": nama,"nim": nim, "alamat":alamat,"email":email,"foto":foto,"nim_progmob":nim_progmob);
  }
}