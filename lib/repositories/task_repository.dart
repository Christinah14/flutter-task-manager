import '../models/task.dart';
import '../services/task_api_service.dart';


class TaskRepository {
  final TaskApiService apiService;

TaskRepository({
  required this.apiService,
});

//get Tasks
Future< List<Task>> getTasks() async{
  return await apiService.getTasks();
}

// retrieve a trask by id
Future <Task> getTaskById(int id) async{
  return await apiService.getTaskById(id);
}

//delete a task by id
Future<void> deleteTask(int id) async{
  await apiService.deleteTask(id
  );
}

//update a task
Future<void> updateTask(Task task) async {
  await apiService.updateTask(task);
}

//create a tasl
Future<void> createTask(String title,
    String? description,
    TaskPriority priority,
    DateTime? dueDate) async{
  await apiService.createTask(title, description, priority, dueDate);
}

// create repo get by id

}