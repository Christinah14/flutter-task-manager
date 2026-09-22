import 'package:flutter/material.dart';
import 'package:flutter_task_manager/repositories/task_repository.dart';
import 'package:flutter_task_manager/services/task_api_service.dart';
import 'package:flutter_task_manager/task_list/task_list_view_model.dart';

import 'task_list_desktop_view.dart';
import 'task_list_mobile_view.dart';

import 'package:provider/provider.dart';



class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
          //check the screen width (desktop/mobile)
          final screenwidth = MediaQuery.of(context).size.width;
          if (screenwidth < 800) {
            return const TaskListMobileView();
          }

          return const TaskListDesktopView();
        }
  
    
  }
