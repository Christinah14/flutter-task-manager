import 'package:flutter/material.dart';
import 'package:flutter_task_manager/task_list/task_list_view_model.dart';

import 'task_list_desktop_view.dart';
import 'task_list_mobile_view.dart';

import 'package:provider/provider.dart';

import 'task_list_desktop_view.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskListViewModel(),
      child: Builder(
        builder: (context) {

          //check the screen width (desktop/mobile)
          final screenwidth = MediaQuery.of(context).size.width;
          if (screenwidth < 800) {
            return const TaskListMobileView();
          }

          return const TaskListDesktopView();
        },
      ),
    );
  }
}
