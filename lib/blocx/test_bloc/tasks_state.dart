part of 'tasks_bloc.dart';

// ignore: must_be_immutable
class TasksState extends Equatable {
  List<Task> pendingTasks;
  List<Task> completedTasks;
  List<Task> favoriteTasks;
  List<Task> removedTasks;
  TasksState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });
  @override
  List<Object> get props => [pendingTasks,completedTasks,favoriteTasks,removedTasks];

  Map<String, dynamic> toMap() {
    return {
      'pendingTasks': pendingTasks.map((e) => e.toMap()).toList(),
      'completedTasks': completedTasks.map((e) => e.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((e) => e.toMap()).toList(),
      'removedTasks': removedTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks:
          List<Task>.from(map['pendingTasks']?.map((e) => Task.fromMap(e))),
      completedTasks:
          List<Task>.from(map['completedTasks']?.map((e) => Task.fromMap(e))),
      favoriteTasks:
          List<Task>.from(map['favoriteTasks']?.map((e) => Task.fromMap(e))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((e) => Task.fromMap(e))),
    );
  }
}
