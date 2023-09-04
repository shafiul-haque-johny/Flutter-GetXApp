import 'package:flutter/material.dart';
import 'package:getx_app/content_page.dart';
import 'package:getx_app/detail_page.dart';
import 'package:getx_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      //home: Container(color: Colors.teal,),
      home: HomePage(),
    );
  }
}
