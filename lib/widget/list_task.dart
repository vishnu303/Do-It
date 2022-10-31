import 'package:flutter/material.dart';

import '../models/task.dart';

class ListTask extends StatelessWidget {
  const ListTask({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: taskList.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(taskList[index].title),
            trailing: Checkbox(
              value: taskList[index].isDone,
              onChanged: (value) {},
            ),
          );
        }));
  }
}
