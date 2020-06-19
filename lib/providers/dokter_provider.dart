import 'package:flutter/material.dart';
import 'package:doctor_consultation_app/models/dokter_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doctor_consultation_app/constant.dart';

class DokterProvider extends ChangeNotifier {
  List<DokterModel> _data = [];
  List<DokterModel> get dataDokter => _data;

  Future<List<DokterModel>> getDokter() async {
    final response = await http.get(apiUrl);

    if(response.statusCode == 200){
      final result = json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data = result.map<DokterModel>((json) => DokterModel.fromJson(json)).toList();
      // print(_data);
      return _data; 
    } else {
      throw Exception();
    }
  }


}