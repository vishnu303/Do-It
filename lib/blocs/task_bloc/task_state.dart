part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> taskList;

  const TaskState({this.taskList = const []});

  @override
  List<Object> get props => [taskList];
}
