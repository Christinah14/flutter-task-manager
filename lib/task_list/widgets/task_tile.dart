import 'package:flutter/material.dart';
import '../../models/task.dart';

//reused by the taskview
//reusable widget
class TaskTile extends StatelessWidget {
  //task object
  final Task task;

  //constructor
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(

      //styling the tile
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        leading: const Icon(
          Icons.radio_button_unchecked,
          color: Color(0xFFFF7A00),
        ),
        //checked when someone delete
        
        //TODO remove the placeholders
        //how the task would look like
        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),

// the calender info
        subtitle: Row(
          children: [const Icon(
            Icons.calendar_today,
            size:16,),

            const SizedBox(width: 6),

            Text(task.dueDate != 
            null ? '${task.dueDate!.day}/${task.dueDate!.month}/${task.dueDate!.year}': 'No due date',),
            ],
            ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
