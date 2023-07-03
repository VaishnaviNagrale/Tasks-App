import 'package:bloc_to_do_app/screens/completed_tasks_screen.dart';
import 'package:bloc_to_do_app/screens/drawer_screen.dart';
import 'package:bloc_to_do_app/screens/favorite_tasks_screen.dart';
import 'package:bloc_to_do_app/screens/pending_tasks_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/add_tasks_bt_sheet.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': FavoriteTasksScreen(), 'title': 'Favorite Tasks'},
  ];

  var _seletedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskBottomSheet(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageDetails[_seletedPageIndex]['title'],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _addTask(context);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_seletedPageIndex]['pageName'],
      floatingActionButton: _seletedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                _addTask(context);
              },
              tooltip: 'Add Task',
              child: Icon(Icons.add),
            )
          : null,
        
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _seletedPageIndex,
        onTap: (index) {
          setState(() {
            _seletedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: 'Pending Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Tasks'),
        ],
      ),
    );
  }
}
