import 'package:flutter/material.dart';
import '../blocx/bloc_exports.dart';
import '../models/tasks_model.dart';
import '../widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  PendingTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.pendingTasks;
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Chip(
              label: Text(
                '${tasksList.length} Pending | ${state.completedTasks.length} Completed',
              ),
            ),
          ),
          TasksList(tasksList: tasksList),
        ],
      );
    });
  }
}
