part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  AddTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;
  UpdateTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;
  DeleteTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class RemovedTask extends TasksEvent {
  final Task task;
  RemovedTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class MarkFavoriteOrUnfavoriteTask extends TasksEvent {
  final Task task;
  MarkFavoriteOrUnfavoriteTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class EditTask extends TasksEvent {
  final Task oldTask;
  final Task newTask;
  EditTask({
    required this.oldTask,
    required this.newTask,
  });
}

class RestoreTask extends TasksEvent {
  final Task task;
  RestoreTask({required this.task});
  @override
  List<Object> get props => [task];
}

class PermenentlyDeleteTask extends TasksEvent {
  
}