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
bool isLoading = false;
String? errorMessage;

// TODO error handling
Future<void> loadTasks() async{

  isLoading = true;
  notifyListeners();

  tasks = await repository.getTasks();
  isLoading = false;
  notifyListeners();
}

Future<void> deleteTask(int id) async{
  await repository.deleteTask(id);
  //load the new tasks 
  await loadTasks(); //updated tasks list
}

//user marks a task as active, complete
Future<void> updateTask(Task task) async{
  await repository.updateTask(task);
  await loadTasks();
}

Future<void> createTask(
  String title,
  String ? description,
  TaskPriority priority,
  DateTime? dueDate,
) async{
  // repository creates the task

  await repository.createTask(title, description, priority, dueDate);
  
  //fetchs the latest list into the view
  //the UI updates
  await loadTasks();
}

// TODO Additional features
}