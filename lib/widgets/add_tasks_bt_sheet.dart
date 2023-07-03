import 'package:bloc_to_do_app/blocx/bloc_exports.dart';
import 'package:bloc_to_do_app/models/tasks_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTaskBottomSheet extends StatelessWidget {
  AddTaskBottomSheet({
    super.key,
  });
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
           const Text(
              'Add Task',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          const  SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
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
                    var newTask = Task(title: titleController.text,description: descriptionController.text,date: DateTime.now().toString(), id: DateTime.now().millisecondsSinceEpoch.toString());
                    context.read<TasksBloc>().add(AddTask(task: newTask));
                    Navigator.pop(context);
                  },
                  child:const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
