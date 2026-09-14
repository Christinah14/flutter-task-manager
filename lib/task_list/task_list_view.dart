import 'package:flutter/material.dart';
import 'task_list_desktop_view.dart';
import 'task_list_mobile_view.dart';

class TaskListView extends StatelessWidget{
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    if(screenwidth < 800){
      return const TaskListMobileView();
    }

    return const TaskListDesktopView();
  }
}