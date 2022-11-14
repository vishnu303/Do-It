import 'package:do_it/blocs/task_bloc/task_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '/screens/task_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0XFFE0F7FA),
          backgroundColor: const Color(0XFFE0F7FA),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0XFF00838F), elevation: 0),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Do-It',
        home: const TaskScreen(),
      ),
    );
  }
}
