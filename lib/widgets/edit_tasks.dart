import 'package:bloc_to_do_app/blocx/bloc_exports.dart';
import 'package:bloc_to_do_app/models/tasks_model.dart';
import 'package:flutter/material.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
 const EditTaskScreen({
    Key? key,
    required this.oldTask,
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {
  TextEditingController titleController = TextEditingController(text: oldTask.title);
  TextEditingController descriptionController = TextEditingController(text: oldTask.description);

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
           const Text(
              'Add Task',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
           const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                autofocus: true,
                controller: titleController,
                decoration:const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextField(
              autofocus: true,
              controller: descriptionController,
              minLines: 3,
              maxLines: 8,
              decoration:const InputDecoration(
                label: Text('Description'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:const Text('cancle'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var newTask = Task(
                        title: titleController.text,
                        description: descriptionController.text,
                        isDone: false,
                        date: DateTime.now().toString(),
                        id: oldTask.id,
                        isFavorite: oldTask.isFavorite,
                        );
                    context.read<TasksBloc>().add(EditTask(oldTask: oldTask,newTask: newTask));
                    Navigator.pop(context);
                  },
                  child:const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
