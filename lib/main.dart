import 'package:flutter/material.dart';
import 'package:flutter_task_manager/task_details/task_details_mobile_view.dart';
import 'package:flutter_task_manager/task_list/task_list_view.dart';
import 'task_details/widgets/task_form.dart';


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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TaskListView(),
    ); 
  }
}

