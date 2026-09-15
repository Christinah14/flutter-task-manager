import 'package:flutter/material.dart';
import '../models/task.dart';


//notfies the ui when there are changes
class TaskListViewModel extends ChangeNotifier{
  final List<Task> tasks = [
    Task(
      title: 'Finish flutter project',
      dueDate: DateTime(2026, 10, 2),
      isCompleted: false,
    ),
  ];
}