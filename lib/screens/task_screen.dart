import 'package:do_it/screens/add_task_screen.dart';
import 'package:do_it/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/task_bloc/task_bloc.dart';
import '../widget/list_task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  //bottom sheet for adding task
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const AddTaskScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('DoIt'),
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  color: const Color(0XFF00838F),
                  height: 40,
                  width: double.infinity,
                  child: const Center(
                      child: Text(
                    'Tasks',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))),
              ListTask(taskList: state.taskList)
            ],
          ),

          //button to add task
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0XFF00838F),
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
          drawer: const MyDrawer(),
        );
      },
    );
  }
}
