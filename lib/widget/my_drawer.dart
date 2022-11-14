import 'package:do_it/screens/recycle_bin.dart';
import 'package:do_it/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/task_bloc/task_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0XFFE0F7FA),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              color: const Color(0XFF00838F),
              child: const Center(
                child: Text(
                  'Hi, Welcome',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),

            // to task Screen
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.task_alt_rounded),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.taskList.length}'),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const TaskScreen()));
                  },
                );
              },
            ),
            const Divider(thickness: 3),

            //Recycle bin
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.delete_forever_rounded),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RecycleBin()));
                  },
                );
              },
            ),
            const Divider(thickness: 3),
          ],
        ),
      ),
    );
  }
}
