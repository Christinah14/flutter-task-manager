import 'package:flutter/material.dart';
import 'widgets/task_form.dart';

class TaskDetailsMobileView extends StatelessWidget{
  const TaskDetailsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),

      body: const Padding(
        padding: EdgeInsets.all(20),
        
        //calls the task form
        child: TaskForm(),
      )
      );
  }

}