import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hachifit/models/exercises.model.dart';
import 'package:hachifit/providers/exercises.provider.dart';
import 'package:hachifit/widgets/card.widget.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final exerciseProvider = ExerciseProvider();
  late Future<List<ExerciseModel>> exercises;

  List<String> _lista = [];

  List<String> _lista_Filtro = [
    'Body Part',
    'Equipment',
    'Target'
  ];

  List<String> _lista_BodyPart = [
    'back',
    'chest',
    'lower arms',
    'neck',
    'shoulders',
    'upperarms',
    'waist',
    'upper legs',
    'lower legs',
    'cardio'
  ];

  List<String> _lista_Equipmennt = [
  "assisted",
  "band",
  "barbell",
  "body weight",
  "bosu ball",
  "cable",
  "dumbbell",
  "elliptical machine",
  "ez barbell",
  "hammer",
  "kettlebell",
  "leverage machine",
  "medicine ball",
  "olympic barbell",
  "resistance band",
  "roller",
  "rope",
  "skierg machine",
  "sled machine",
  "smith machine",
  "stability ball",
  "stationary bike",
  "stepmill machine",
  "tire",
  "trap bar",
  "upper body ergometer",
  "weighted",
  "wheel roller"
  ];

  List<String> _lista_Target = [
  "abductors",
  "abs",
  "adductors",
  "biceps",
  "calves",
  "cardiovascular system",
  "delts",
  "forearms",
  "glutes",
  "hamstrings",
  "lats",
  "levator scapulae",
  "pectorals",
  "quads",
  "serratus anterior",
  "spine",
  "traps",
  "triceps",
  "upper back"
  ];
  String _vista_Filtro = 'Target';
  String _vista = 'abs';

  void initState() {
    //articles = articuloProvider.getArticles();
    exercises = exerciseProvider.getArticlesbyTarget(_vista);
    //print(response);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hachi-Fit"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/HachiFit.jpg'),
                              repeat: ImageRepeat.noRepeat),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Filter by:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            DropdownButton(
                              items: _lista_Filtro.map((String a) {
                                return DropdownMenuItem(
                                    value: a, child: Text(a, style: TextStyle(fontSize: 20),));
                              }).toList(),
                              onChanged: (_value) => {
                                setState(() {
                                  _vista_Filtro = _value.toString();
                                  if(_vista_Filtro == 'Target'){
                                    _lista = _lista_Target;
                                  }
                                  if(_vista_Filtro == 'Equipment'){
                                    _lista = _lista_Equipmennt;
                                  }
                                  if(_vista_Filtro == 'Body Part'){
                                    _lista = _lista_BodyPart;
                                  }
                                })
                              },
                              hint: Text(_vista_Filtro, style: TextStyle(fontSize: 25),),
                            ),
                            DropdownButton(
                              items: _lista.map((String a) {
                                return DropdownMenuItem(
                                    value: a, child: Text(a, style: TextStyle(fontSize: 20),));
                              }).toList(),
                              onChanged: (_value) => {
                                setState(() {
                                  _vista = _value.toString();
                                  if(_vista_Filtro == 'Target'){
                                    exercises = exerciseProvider
                                      .getArticlesbyTarget(_vista);
                                  }
                                  if(_vista_Filtro == 'Equipment'){
                                    exercises = exerciseProvider
                                      .getArticlesbyEquipment(_vista);
                                  }
                                  if(_vista_Filtro == 'Body Part'){
                                    exercises = exerciseProvider
                                      .getExercisebybodyPart(_vista);
                                  }
                                })
                              },
                              hint: Text(_vista, style: TextStyle(fontSize: 25),),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 126, 126, 126),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ))
                  ],
                ),
              )),
          Expanded(
            flex: 8,
            child: Container(
                child: FutureBuilder(
              future: exercises,
              builder: ((context, snapshot) {
                List<CardWidget> lista = [];
                if (snapshot.hasData) {
                  snapshot.data?.forEach(
                    (element) => lista.add(CardWidget(article: element)),
                  );
                  return ListView(
                    children: lista,
                  );
                } else {
                  return Text("Empty");
                }
              }),
            )),
          ),
        ],
      ),
    );
  }
}
