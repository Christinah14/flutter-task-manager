import 'package:http/http.dart' as http;

import '../config/api_config.dart';

import 'dart:convert';

import '../models/task.dart';

class TaskApiService {

  //getTasks
  Future<List<Task>> getTasks() async {
    final url = '${ApiConfig.baseUrl}/api/Tasks';

    final response = await http.get(Uri.parse(url));

    //if the backend successfully return the tasks
    if(response.statusCode == 200){ 

    //convert into dart data (list of tasks)
    final data = jsonDecode(response.body);

    //convert data into task object
    final tasks = data.map<Task>((json) {
      return Task.fromJson(json);
    }).toList();

    return tasks;}
    else{
      throw Exception('Faild to lad tasks');
    }
  }


  //get task by id
  Future<Task> getTaskById(int id) async {
    final url = '${ApiConfig.baseUrl}/api/Tasks/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //convert the response to dart data
      final data = jsonDecode(response.body);
      //convert the data into a task object
      return Task.fromJson(data);
    } else {
      throw Exception('Failed to load task');
    }
  }

  //create a new task
  Future<Task> createTask(
    //the backend provides the task id and createdAt
    String title,
    String? description,
    TaskPriority priority,
    DateTime? dueDate,
  ) async {
    final url = '${ApiConfig.baseUrl}/api/Tasks';

    final response = await http.post(
      Uri.parse(url),
      //info regarding the format of the data
      headers: {'Content-Type': 'application/json'},
      //encodes the dart data into json forma
      body: jsonEncode({
        'title': title,
        'description': description,
        'isCompleted': false,
        'Priority': priority.index,
        'dueDate': dueDate?.toIso8601String(),
      }),
    );
    if(response.statusCode == 201){
      final data = jsonDecode(response.body);
      return Task.fromJson(data);

    } throw Exception('Failed to create a task');
  }


  //update an existing task
  Future<void> updateTask(Task task) async {

    final url = '${ApiConfig.baseUrl}/api/Tasks/${task.id}';
    final response = await http.put(
      Uri.parse(url),

      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': task.id,
        'title': task.title,
        'description': task.description,
        'iscompleted': task.isCompleted,
        'priority': task.priority.index,
        'dueDate': task.dueDate?.toIso8601String(),
        'createdAt': task.createdAt?.toIso8601String(),
      }),
    );
    if(response.statusCode == 204){
      return ;
    }

    throw Exception('failed to update task');
  }

  //remove a task
  //delete by id
  Future<void> deleteTask(int id) async {
    final url = '${ApiConfig.baseUrl}/api/Tasks/$id';
    final response = await http.delete(Uri.parse(url));
    
    if(response.statusCode != 200 && response.statusCode != 204){
      throw Exception('Failed to delete');
    }
  }
}
