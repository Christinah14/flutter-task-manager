import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';


//notfies the ui when there are changes
class TaskListViewModel extends ChangeNotifier{
final TaskRepository repository;
Task? task;

TaskListViewModel({
  required this.repository,
  this.task
});

//state data
List<Task> tasks=[];
bool isLoading = false;
String? errorMessage;

// TODO error handling
// TODO add notfier listeners
Future<void> loadTasks() async{

  isLoading = true;
  notifyListeners();

  tasks = await repository.getTasks();
  isLoading = false;
  notifyListeners();
}

Future<void> loadTask(int id)async {
  task = await repository.getTaskById(id);
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
  //load the new task
  await loadTasks();
}

// create a task
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
  //load the new task
  await loadTasks();
}

// TODO Additional features
}