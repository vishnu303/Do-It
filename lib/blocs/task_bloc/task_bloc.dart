import 'package:bloc/bloc.dart';
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
      // TODO: implement event handler
    });
    on<DeleteTask>((event, emit) {
      // TODO: implement event handler
    });
  }
}
