import 'package:flutter/material.dart';
import 'package:flutter_task_manager/repositories/task_repository.dart';
import 'package:flutter_task_manager/services/task_api_service.dart';
import 'package:flutter_task_manager/task_list/task_list_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_task_manager/task_list/task_list_view_model.dart';


void main() {
  runApp(
    //state management
    ChangeNotifierProvider(
      //provides evrything that happens in tasklistmodel to evrything under my app
    create: (_) => TaskListViewModel(
      repository: TaskRepository(apiService: TaskApiService(),
      ),
    )..loadTasks(),
    //everything that falls under myapp has excess to tasklistmodel
    child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TaskListView(),
    ); 
  }
}

