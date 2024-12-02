import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/planet_model.dart';

class PlanetProvider extends ChangeNotifier{

  List<PlanetModel> planetsData = [];

  Future<void> loadPlanetData() async {
    try{
      final jsonData = await rootBundle.loadString("assets/json/data.json");
      List data = jsonDecode(jsonData);
      planetsData = data.map((e) => PlanetModel.fromJson(e)).toList();
      notifyListeners();
    }catch(e){
      log("Error into load planets data from json object to string -> $e");
    }
  }

  PlanetProvider(){
    loadPlanetData();
  }

}