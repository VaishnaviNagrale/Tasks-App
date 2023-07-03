import 'package:bloc_to_do_app/models/tasks_model.dart';
import 'package:bloc_to_do_app/widgets/edit_tasks.dart';
import 'package:flutter/material.dart';
import '../blocx/bloc_exports.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  final Task task;
 const PopupMenuButtonWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemovedTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: EditTaskScreen(oldTask: task),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _editTask(context);
                    },
                    icon:const Icon(Icons.edit),
                    label:const Text('Edit'),
                  ),
                  onTap: () => _editTask(context),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      context
                          .read<TasksBloc>()
                          .add(MarkFavoriteOrUnfavoriteTask(task: task));
                    },
                    icon: task.isFavorite == false
                        ?const Icon(Icons.bookmark_border)
                        :const Icon(Icons.bookmark),
                    label: task.isFavorite == false
                        ?const Text('Add to \nbookmarks')
                        :const Text('Remove from \nbookmarks'),
                  ),
                  onTap: () {
                    context
                        .read<TasksBloc>()
                        .add(MarkFavoriteOrUnfavoriteTask(task: task));
                  },
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () => _removeOrDeleteTask(context, task),
                    icon:const Icon(Icons.delete),
                    label:const Text('Delete'),
                  ),
                  onTap: () => _removeOrDeleteTask(context, task),
                ),
              ]
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () =>
                        context.read<TasksBloc>().add(RestoreTask(task: task)),
                    icon:const Icon(Icons.restore_from_trash),
                    label:const Text('Restore'),
                  ),
                  onTap: () =>
                      context.read<TasksBloc>().add(RestoreTask(task: task)),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () =>
                        context.read<TasksBloc>().add(DeleteTask(task: task)),
                    icon:const Icon(Icons.delete_forever),
                    label:const Text('Delete Forever'),
                  ),
                  onTap: () =>
                      context.read<TasksBloc>().add(DeleteTask(task: task)),
                ),
              ],
    );
  }
}
