import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hachifit/models/exercises.model.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class ExerciseProvider { 
  Future<List<ExerciseModel>> getExercise() async {
    List<ExerciseModel> exercise = [];
    var client = http.Client();
    
    try {
      var url = 'https://exercisedb.p.rapidapi.com/';
      var apikey = "238da9a941msh584e731c85a6bcap1f8b86jsne4fc9e87f319";//apikey suarez
      //var apikey ="b8c9f91f35msh4c441ffc0ba3643p1ae8d6jsn6f0672535fd9";//apikey Tejedor
      var endpoint = "exercises";//todos los ejercicios, sino hay opcion que tome este enpoint
      
      
      var uri = Uri.parse(url + endpoint);
      var response = await http.get(uri, headers:{'X-RapidAPI-Key':apikey});
      
      print(response.statusCode);
      //print(response.body);
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
     
      decodedResponse 
          .forEach((item) => exercise.add(ExerciseModel.fromJson(item)));
      
      
      return exercise;
    }  catch(e) { 
      print(e);
      print(exercise.length);
      //exercise.forEach((element) {element.bodypart=translator.translate(element.bodypart)})
      return exercise;
   } 
     finally {
      client.close();
    }
  }
  Future<List<ExerciseModel>> getExercisebybodyPart(String bodypart) async {
    List<ExerciseModel> exercise = [];
    var client = http.Client();

    try {
      var url = 'https://exercisedb.p.rapidapi.com/';
      var apikey = "238da9a941msh584e731c85a6bcap1f8b86jsne4fc9e87f319";//apikey suarez
      //var apikey ="b8c9f91f35msh4c441ffc0ba3643p1ae8d6jsn6f0672535fd9";//apikey Tejedor
      
      var endpoint = "exercises/bodyPart/$bodypart";
      
      var uri = Uri.parse(url + endpoint);
      var response = await http.get(uri, headers:{'X-RapidAPI-Key':apikey});
      print("aqui el response");
      print(response.statusCode);
      
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      
      decodedResponse 
          .forEach((item) => exercise.add(ExerciseModel.fromJson(item)));
     
      return exercise;
    }  catch(e) { 
      print(e);
      print(exercise.length);
      return exercise;
   } 
     finally {
      client.close();
    }
  }

  Future<List<ExerciseModel>> getArticlesbyTarget(String target) async {
    List<ExerciseModel> articles = [];
    var client = http.Client();

    try {
      var url = 'https://exercisedb.p.rapidapi.com/';
      var apikey = "238da9a941msh584e731c85a6bcap1f8b86jsne4fc9e87f319";//apikey suarez
      //var apikey ="b8c9f91f35msh4c441ffc0ba3643p1ae8d6jsn6f0672535fd9";//apikey Tejedor
      
      var endpoint = "exercises/target/$target";
      
      var uri = Uri.parse(url + endpoint);
      var response = await http.get(uri, headers:{'X-RapidAPI-Key':apikey});
      print("aqui el response");
      print(response.statusCode);
      
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      
      decodedResponse 
          .forEach((item) => articles.add(ExerciseModel.fromJson(item)));
      var ar1 = articles[1];
      
      //var a = await translator.translate(articles[1].bodypart, to: 'es');
      //print(a);
      return articles;
    }  catch(e) { 
      print(e);
      
      return articles;
   } 
     finally {
      client.close();
    }
  }
  Future<List<ExerciseModel>> getArticlesbyEquipment(String equipment) async {
    List<ExerciseModel> articles = [];
    var client = http.Client();

    try {
      var url = 'https://exercisedb.p.rapidapi.com/';
      var apikey = "238da9a941msh584e731c85a6bcap1f8b86jsne4fc9e87f319";//apikey suarez
      //var apikey ="b8c9f91f35msh4c441ffc0ba3643p1ae8d6jsn6f0672535fd9";//apikey Tejedor
      
      var endpoint = "exercises/equipment/$equipment";
      
      var uri = Uri.parse(url + endpoint);
      var response = await http.get(uri, headers:{'X-RapidAPI-Key':apikey});
      //print("aqui el response");
      print(response.statusCode);
      
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      
      decodedResponse 
          .forEach((item) => articles.add(ExerciseModel.fromJson(item)));
      var ar1 = articles[1];
      
      //var a = await translator.translate(articles[1].bodypart, to: 'es');
      //print(a);
      return articles;
    }  catch(e) { 
      print(e);
      
      return articles;
   } 
     finally {
      client.close();
    }
  }

  Future<List<ExerciseModel>> getArticlesbyName(String name) async {
    List<ExerciseModel> articles = [];
    var client = http.Client();

    try {
      var url = 'https://exercisedb.p.rapidapi.com/';
      var apikey = "238da9a941msh584e731c85a6bcap1f8b86jsne4fc9e87f319";//apikey suarez
      //var apikey ="b8c9f91f35msh4c441ffc0ba3643p1ae8d6jsn6f0672535fd9";//apikey Tejedor
      
      var endpoint = "exercises/name/$name";
      
      var uri = Uri.parse(url + endpoint);
      var response = await http.get(uri, headers:{'X-RapidAPI-Key':apikey});
      //print("aqui el response");
      print(response.statusCode);
      
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      
      decodedResponse 
          .forEach((item) => articles.add(ExerciseModel.fromJson(item)));
      var ar1 = articles[1];
      
      //var a = await translator.translate(articles[1].bodypart, to: 'es');
      //print(a);
      return articles;
    }  catch(e) { 
      print(e);
      
      return articles;
   } 
     finally {
      client.close();
    }
  }

}