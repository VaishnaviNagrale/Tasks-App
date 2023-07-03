import 'package:bloc_to_do_app/blocx/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/tasks_model.dart';
import 'popup_menu_button.dart';

class TasksListTile extends StatelessWidget {
  const TasksListTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    task.isFavorite == false
                        ? Icon(Icons.star_border)
                        : Icon(Icons.star),
                    SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: screenWidth < 600 ? 16 : 18,
                              fontWeight: FontWeight.w500,
                              decoration: task.isDone!
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd HH:mm:ss')
                                .format(DateTime.parse(task.date)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: task.isDone,
                    onChanged: task.isDeleted == false
                        ? (bool? value) {
                            context
                                .read<TasksBloc>()
                                .add(UpdateTask(task: task));
                          }
                        : null,
                  ),
                  PopupMenuButtonWidget(
                    task: task,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
