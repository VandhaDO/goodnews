import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:goodnews/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Good News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: HomePage());
  }
}
