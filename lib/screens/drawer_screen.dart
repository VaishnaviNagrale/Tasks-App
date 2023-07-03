import 'package:bloc_to_do_app/screens/recyclebin_screen.dart';
import 'package:bloc_to_do_app/screens/tabs_screen.dart';
import 'package:bloc_to_do_app/services/firebase_upload.dart';
import 'package:flutter/material.dart';

import '../blocx/bloc_exports.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding:const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>const TabsScreen())),
                  child: ListTile(
                    leading:const Icon(Icons.folder_special),
                    title:const Text('My Tasks'),
                    trailing: Text(
                      '${state.pendingTasks.length} | ${state.completedTasks.length}',
                    ),
                  ),
                );
              },
            ),
          const  Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>const RecycleBin())),
                  child: ListTile(
                    leading:const Icon(Icons.delete),
                    title:const Text('Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
           const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => uploadFilesToFirebaseStorage(context),
                  child:const ListTile(
                    leading: Icon(Icons.upload_file),
                    title: Text('Upload Files'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                    value: state.switchValue,
                    onChanged: (newValue) {
                      newValue
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
