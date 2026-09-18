import 'package:http/http.dart' as http;
import '../config/api_config.dart';

import 'dart:convert';
import '../models/task.dart';

class TaskApiService {

//getTasks
  Future<List<Task>> getTasks() async{
    final url = '${ApiConfig.baseUrl}/api/Tasks';

    final response = await http.get(
      Uri.parse(url),
    );
    final data = jsonDecode(response.body);

//convert json to task object
    final tasks = data.map<Task>((json){
      return Task.fromJson(json);
    }).toList();

    return tasks;
  }

  //create a new task
  //update an existing task
  Future<void> updateTask(Task task) async{
    final url = '${ApiConfig.baseUrl}/api/Tasks/${task.id}';
    await http.put(Uri.parse(url),
    headers: {
      'Content-Type' : 'application/json',
    },
    body:jsonEncode({
      'id': task.id,
    'title': task.title,
    'description': task.description,
    'iscompleted': task.isCompleted,
    'priority': task.priority.index,
    'dueDate': task.dueDate?.toIso8601String(),
    'createdAt': task.createdAt.toIso8601String(),
    }),
    );
  }

  //remove a task
  //delete by id
  Future<void> deleteTask(int id) async{
    final url = '${ApiConfig.baseUrl}/api/Tasks/$id';
    await http.delete(
      Uri.parse(url),
    );

  }



}