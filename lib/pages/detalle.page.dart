import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hachifit/models/exercises.model.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key, required this.article});
  ExerciseModel article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.name)),
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
                      child: Container(),
                    ))
                  ],
                ),
              )),
          Expanded(
            flex: 5,
            child: Container(
              child: Image.network(article.gifurl, scale: 1),
            ),
          ),
          Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            article.name.toUpperCase(),
                            style: TextStyle(color: Color.fromARGB(255, 145, 10, 0),
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,20,20,5),
                        child: Text(
                          'Equipment: ',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        article.equipment,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,20,20,5),
                        child: Text(
                          'Body Part: ',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        article.bodypart,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,20,20,5),
                        child: Text(
                          'Target: ',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        article.target,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
