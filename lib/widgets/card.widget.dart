import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:hachifit/models/exercises.model.dart';
import 'package:hachifit/pages/detalle.page.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.article});

  ExerciseModel article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetallePage(
                        article: article,
                      )));
        },
        child: Container(
            color: Color.fromARGB(255, 29, 78, 87),
            height: 110,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(article.gifurl, scale: 1),
                ),
                Column(
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 30, 25),
                      child: Container(
                        height: 60,
                        width: 300,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            article.name.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      'Target',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 30, 25),
                      child: Container(
                        height: 60,
                        width: 300,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            article.target.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),

                //Text(article.equipment),
                //Text(article.bodypart),
              ],
            )),
      ),
    );
  }
}
