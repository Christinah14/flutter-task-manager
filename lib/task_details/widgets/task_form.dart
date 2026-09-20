import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  //keeps track and manages user input
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            //task title field
            maxLength: 20,
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),

            //validation check
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter a title';
              }
              return null;
            }
          ),
          // task description title
          TextFormField(
            maxLength: 40,
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Task description'),
            //validation check
            validator: (value){
              if(value == null || value.isEmpty || value.length < 5){
                return "Enter a description at least 5 chars long.";
              }
              return null;
            }
          )
        ],
      ),
    );
  }
}
