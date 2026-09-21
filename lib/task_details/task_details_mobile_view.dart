import 'package:flutter/material.dart';
import 'widgets/task_form.dart';

class TaskDetailsMobileView extends StatelessWidget{
  const TaskDetailsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: UI
    return Scaffold(
        backgroundColor: const Color(0xFFF8F9FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1C),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Create Task',
        style: TextStyle(fontWeight: FontWeight.bold),),

      ),

      body: const Padding(
        padding: EdgeInsets.all(20),
      
        //calls the task form
        child: TaskForm(),
      )
      );
  }

}