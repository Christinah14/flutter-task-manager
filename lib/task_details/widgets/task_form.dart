import 'package:flutter/material.dart';
import 'package:flutter_task_manager/models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  //keeps track and manages user input
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  TaskPriority selectedPriority = TaskPriority.medium;

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
          ),

          //priority
          // drop down values are for the enum
          DropdownButtonFormField<TaskPriority>(
            initialValue: selectedPriority,
            items: TaskPriority.values.map((priority){
              return DropdownMenuItem<TaskPriority>(value: priority,
              child: Text(priority.name),);

            }).toList(),
            onChanged: (value){
              if(value !=null){
                setState((){
                  selectedPriority = value;
                });
              }
            },
          ),

          //dueDate 

        ],
      ),
    );
  }
}
