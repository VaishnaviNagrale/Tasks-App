import 'package:flutter/material.dart';

import '../blocx/bloc_exports.dart';
import '../widgets/tasks_list.dart';
import 'drawer_screen.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:const Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon:const Icon(Icons.delete_forever),
                        label:const Text('Delete all tasks')),
                    onTap: () =>
                        context.read<TasksBloc>().add(PermenentlyDeleteTask()),
                  ),
                ],
              ),
            ],
          ),
          drawer:const MyDrawer(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TasksList(tasksList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
