import 'package:flutter/material.dart';
import '../blocx/bloc_exports.dart';
import '../models/tasks_model.dart';
import '../widgets/tasks_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  FavoriteTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.favoriteTasks;
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Chip(
              label: Text(
                '${state.favoriteTasks.length} Favorite',
              ),
            ),
          ),
          TasksList(tasksList: tasksList),
        ],
      );
    });
  }
}
