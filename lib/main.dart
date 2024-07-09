import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:task_and_time_tracker/screens/home_screen.dart';
import 'package:task_and_time_tracker/screens/task_screen.dart';
import 'package:task_and_time_tracker/utils/database_helper.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(
    ChangeNotifierProvider(
      create: (_) => DatabaseHelper(),
      child: TaskTrackerApp(),
    ),
  );
}

class TaskTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/addTask': (context) => TaskScreen(),
      },
    );
  }
}
