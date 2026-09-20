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
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),

            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter a title';
              }
              return null;
            }
          ),
        ],
      ),
    );
  }
}
