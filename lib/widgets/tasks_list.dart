import 'package:flutter/material.dart';
import '../models/tasks_model.dart';
import 'tasks_list_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasksList;
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList.map((task) {
            return ExpansionPanelRadio(
              value: task.id,
              headerBuilder: (context, isOpen) => TasksListTile(task: task),
              body: ListTile(
                title: SelectableText.rich(
                 TextSpan(
                  children: [
                    const TextSpan(
                    text: 'Text\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: task.title),
                  const TextSpan(
                    text: '\n\nDescription\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: task.description),
                  ]
                 )
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
//  Expanded(
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           var task = tasksList[index];
//           return TasksListTile(task: task);
//         },
//         itemCount: tasksList.length,
//       ),
//     );