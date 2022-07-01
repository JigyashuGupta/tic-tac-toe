import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: kBodyTextTheme,
        fontFamily: 'Montserrat'
      ),
      home: HomeScreen(),
    );
  }
}
