
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_App/screens/homepage.dart';
import 'package:todo_App/viewModel/taskview.dart';

void main()=>runApp(const TodoApp());


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> TaskView(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

