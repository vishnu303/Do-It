import 'package:do_it/blocs/task_bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/task.dart';

class ListTask extends StatelessWidget {
  const ListTask({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  void _deleteOrRemove(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTask(task: task))
        : context.read<TaskBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: taskList.length,
      itemBuilder: ((context, index) {
        return ListTile(
            title: Text(
              taskList[index].title,
              style: TextStyle(
                  decoration: taskList[index].isDone!
                      ? TextDecoration.lineThrough
                      : null),
            ),
            trailing: !taskList[index].isDeleted!
                ? Checkbox(
                    value: taskList[index].isDone,
                    onChanged: (value) => context.read<TaskBloc>()
                      ..add(UpdateTask(task: taskList[index])),
                  )
                : null,
            onLongPress: () => _deleteOrRemove(context, taskList[index]));
      }),
    );
  }
}
