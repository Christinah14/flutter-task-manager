import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';


//notfies the ui when there are changes
class TaskListViewModel extends ChangeNotifier{
final TaskRepository repository;

TaskListViewModel({
  required this.repository,
});
//state data
List<Task> tasks=[];


Future<void> loadTasks() async{
  tasks = await repository.getTasks();
  notifyListeners();
}
}