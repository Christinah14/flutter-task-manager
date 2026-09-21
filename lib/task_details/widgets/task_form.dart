import 'package:flutter/material.dart';
import 'package:flutter_task_manager/models/task.dart';
import 'package:flutter_task_manager/task_details/widgets/due_date_field.dart';

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
  DateTime? selectedDueDate;

  //optional due date
  //method takes time
  //opens the calander and saves user picked date
  Future<void> pickDueDate() async{
    final pickedDate = await showDatePicker(context: context, firstDate: DateTime.now() , lastDate: DateTime(2028), initialDate: DateTime.now(),);
    if(pickedDate!= null){
      setState(() {
        selectedDueDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

          const SizedBox(height: 20),

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
          const SizedBox(height: 20),

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

          const SizedBox(height: 20),

          //dueDate widget
          DueDateField(selectedDueDate: selectedDueDate, onTap: pickDueDate)

        ],
      ),
    );
  }
}
