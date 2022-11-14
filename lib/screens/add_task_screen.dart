import 'package:do_it/models/task.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../blocs/task_bloc/task_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    var uuid = const Uuid();

    return SingleChildScrollView(
      child: Container(
        color: const Color(0XFFE0F7FA),
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20),
        child: Column(
          children: [
            const Center(
              child: Text(
                'add task',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'title',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF00838F))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF00838F))),
              ),
            ),
            const SizedBox(height: 10),

            //add task button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF00838F)),
              onPressed: () {
                Task task = Task(title: titleController.text, id: uuid.v4());
                context.read<TaskBloc>().add(AddTask(task: task));
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
            const SizedBox(height: 10),

            //cancel button
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0XFF00838F)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
