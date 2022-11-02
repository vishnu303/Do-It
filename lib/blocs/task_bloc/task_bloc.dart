import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:do_it/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>((event, emit) {
      emit(TaskState(taskList: List.from(state.taskList)..add(event.task)));
    });
    on<UpdateTask>((event, emit) {
      final state = this.state;
      final task = event.task;
      final index = state.taskList.indexOf(task);
      print(event.task);

      List<Task> taskList = List.from(state.taskList)..remove(task);

      task.isDone == false
          ? taskList.insert(index, task.copyWith(isDone: true))
          : taskList.insert(index, task.copyWith(isDone: false));
      print(state.taskList);
      emit(TaskState(taskList: taskList));
    });
    on<DeleteTask>((event, emit) {
      final state = this.state;

      emit(TaskState(taskList: List.from(state.taskList)..remove(event.task)));
    });
  }
}
