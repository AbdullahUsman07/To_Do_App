
import 'package:flutter/material.dart';
import 'package:todo_App/screens/homepage.dart';

void main()=>runApp(const TodoApp());


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

