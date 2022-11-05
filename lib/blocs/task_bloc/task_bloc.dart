import 'package:equatable/equatable.dart';

import 'package:do_it/models/task.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    // add task
    on<AddTask>((event, emit) {
      emit(TaskState(taskList: List.from(state.taskList)..add(event.task)));
    });

    //update task when marked it as done
    on<UpdateTask>((event, emit) {
      final state = this.state;
      final task = event.task;
      final index = state.taskList.indexOf(task);
      //print(event.task);

      List<Task> taskList = List.from(state.taskList)..remove(task);

      task.isDone == false
          ? taskList.insert(index, task.copyWith(isDone: true))
          : taskList.insert(index, task.copyWith(isDone: false));

      // print(state.taskList);
      emit(TaskState(taskList: taskList));
    });

    // delete Task
    on<DeleteTask>((event, emit) {
      final state = this.state;

      emit(TaskState(
          taskList: state.taskList,
          removedTasks: List.from(state.removedTasks)..remove(event.task)));
    });

    on<RemoveTask>((event, emit) {
      final state = this.state;

      emit(
        TaskState(
          taskList: List.from(state.taskList)..remove(event.task),
          removedTasks: List.from(state.removedTasks)
            ..add(event.task.copyWith(isDeleted: true)),
        ),
      );
    });
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
