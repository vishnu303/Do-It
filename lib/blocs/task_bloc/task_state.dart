// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> taskList;

  const TaskState({this.taskList = const []});

  @override
  List<Object> get props => [taskList];

//toMap for hydratedBloc

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskList': taskList.map((x) => x.toMap()).toList(),
    };
  }

  //fromMap for hydratedBloc

  factory TaskState.fromMap(Map<String, dynamic> map) {
    // print(List<Task>.from(
    //   map['taskList'].map(
    //     (x) => Task.fromMap(x),
    //   ),
    // ));
    return TaskState(
        taskList: List<Task>.from(
      map['taskList'].map(
        (x) => Task.fromMap(x),
      ),
    ));
  }
}
