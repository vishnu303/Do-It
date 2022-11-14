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
        //task list
        return Column(
          children: [
            ListTile(
              tileColor:
                  taskList[index].isDone! ? const Color(0XFFE57373) : null,
              title: Text(
                taskList[index].title,
                style: TextStyle(
                    color: taskList[index].isDone! ? Colors.white : null),
              ),
              trailing: !taskList[index].isDeleted!
                  ? Checkbox(
                      activeColor: const Color(0XFFEF9A9A),
                      value: taskList[index].isDone,
                      onChanged: (value) => context.read<TaskBloc>()
                        ..add(UpdateTask(task: taskList[index])),
                    )
                  : null,
              onLongPress: () => _deleteOrRemove(context, taskList[index]),
            ),
          ],
        );
      }),
    );
  }
}
