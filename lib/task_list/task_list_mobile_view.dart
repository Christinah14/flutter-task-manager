import 'package:flutter/material.dart';
import 'widgets/task_tile.dart';
import '../models/task.dart';
import 'widgets/empty_task_list.dart';
import 'package:provider/provider.dart';
import 'task_list_view_model.dart';

class TaskListMobileView extends StatelessWidget {
  const TaskListMobileView({super.key});

  @override

  Widget build(BuildContext context) {

    final viewModel = context.watch<TaskListViewModel>();

    Widget taskContent;

    //checks if there are tasks
    if(viewModel.isLoading){
      taskContent = const Center(
        child: CircularProgressIndicator(),
      );
    }
    else if (viewModel.tasks.isEmpty){
      taskContent = const EmptyTaskList();
    } else {
      taskContent = ListView.builder(itemCount: viewModel.tasks.length,
      itemBuilder: (context, index){
        return TaskTile(task: viewModel.tasks[index],);
      },);
    }

    return Scaffold(
      //off white background
      backgroundColor: const Color(0xFFF8F9FC),

      //app bar design
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1C),
        foregroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'My Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        //TODO still need to implement navigation
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  
        
        children:[
          const Text('Stay organised',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color:Color(0xFF1C1C1C), //dark navy
          ),
          ),

          //inserting space
          const SizedBox(height: 4),

          const Text(
            'Manage your tasks and stay on track',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          //inserting space
          const SizedBox(height: 20),

          TextField(
            decoration: InputDecoration(
              hintText: 'Search tasks...',
              hintStyle: const TextStyle(
                color: Color(0xFF6B7280),
              ),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF1C1C1C)),

              filled: true,
              fillColor: Colors.white,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        
        
        const SizedBox(height: 16),
        //filters
        const Row ( 
          children: [
          Text('All'),
          SizedBox(width: 20),
          Text('Active'),
          SizedBox(width: 20),
          Text('completed'),
          SizedBox(width: 20),
          Text('Overdue'),
        ],
        ),
        const SizedBox(height: 16),

        //placing a tile widget 
        //instance of tasktile
        // TODO through the view

        Expanded(child: taskContent,),
        ],
      ),
      ),
    );
  }
}
