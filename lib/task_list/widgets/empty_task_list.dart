import 'package:flutter/material.dart';

class EmptyTaskList extends StatelessWidget {
  const EmptyTaskList({super.key});

  //instance where there is no task
  // empty state
  @override
  Widget build(BuildContext context) {
    //the child will be in the center
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        //display multiple widget
        children: [
          Icon(Icons.task_alt, size: 64, color: Colors.grey),

          SizedBox(height: 16),
          
          Text(
            'No task yet',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 8),
          Text(
            'Add a task to get started',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
