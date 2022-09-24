import 'dart:html';

class ExerciseModel {
  String bodypart;
  String equipment;
  String gifurl;
  String id;
  String name;
  String target;

  ExerciseModel(
      {required this.bodypart,
      required this.equipment,
      required this.gifurl,
      required this.id,
      required this.name,
      required this.target});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
      bodypart: json['bodyPart'] ?? '',
      equipment: json['equipment'] ?? '',
      gifurl: json['gifUrl'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      target: json['target'] ?? '');
}