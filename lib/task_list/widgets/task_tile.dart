import 'package:flutter/material.dart';
import 'package:flutter_task_manager/task_list/task_list_view_model.dart';
import '../../models/task.dart';
import 'package:provider/provider.dart';

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



        leading: IconButton(
          onPressed: () async {
            await context.read<TaskListViewModel>().updateTask(task);
            },
          icon:
           Icon(
            task.isCompleted
            ? Icons.radio_button_checked
            : Icons.radio_button_unchecked,
          color: Color(0xFFFF7A00),
        ),
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
        trailing: IconButton(icon:const Icon(Icons.delete, color: Colors.red),
         onPressed: () async{
          //verifies if the task is a not a null can delete the task
          if(task.id != null)
            {await context.read<TaskListViewModel>().deleteTask(task.id!);}
         },)
        
      ),
      );
  }
}
