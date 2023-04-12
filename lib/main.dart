import 'package:flutter/material.dart';
import 'package:pet_shelter_new/views/auth/auth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shelter',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const Scaffold(
        body: AuthWidget(),
      ),
    );
  }
}