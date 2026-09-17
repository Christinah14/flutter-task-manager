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
  //remove a tats


}