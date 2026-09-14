import 'package:flutter/material.dart';

//reused by the taskview
//reusable widget
class TaskTile extends StatelessWidget {
  final String title;
  final String dueDate;

  //constructor
  const TaskTile({super.key, required this.title, required this.dueDate});

  @override
  Widget build(BuildContext context) {
    return Card(
      //styling the tile
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 12),

      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        leading: const Icon(
          Icons.radio_button_unchecked,
          color: Color(0xFF2563EB),
        ),
        //TODO remove the placeholders
        //how the task would look like
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),

// the calender info
        subtitle: Row(
          children: [const Icon(
            Icons.calendar_today,
            size:16,),

            const SizedBox(width: 6),

            Text(dueDate),
            ],
            ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
