import '../models/task.dart';
import '../services/task_api_service.dart';


class TaskRepository {
  final TaskApiService apiService;

TaskRepository({
  required this.apiService,
});

Future< List<Task>> getTasks() async{
  return await apiService.getTasks();
}

Future<void> deleteTask(int id) async{
  await apiService.deleteTask(id
  );
}

Future<void> updateTask(Task task) async {
  await apiService.updateTask(task);
}

}