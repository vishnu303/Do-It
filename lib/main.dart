import 'package:do_it/blocs/task_bloc/task_bloc.dart';
import 'package:do_it/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/screens/task_screen.dart';
import 'package:flutter/material.dart';

void main() {
  // ignore: deprecated_member_use
  // BlocOverrides.runZoned((() => runApp(const MyApp())));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()
        ..add(
          AddTask(
            task: Task(title: 'task1'),
          ),
        ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Demo',
        home: TaskScreen(),
      ),
    );
  }
}
