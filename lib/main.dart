import 'package:flutter/material.dart';
import 'package:hachifit/pages/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hachi-Fit',
      theme: ThemeData(
        primarySwatch: Colors.red,
        //backgroundColor: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
