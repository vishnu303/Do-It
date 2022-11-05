import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/task_bloc/task_bloc.dart';
import '../widget/list_task.dart';
import '../widget/my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text('Task'),
                ),
              ),
              ListTask(taskList: state.removedTasks)
            ],
          ),
          drawer: const MyDrawer(),
        );
      },
    );
  }
}
