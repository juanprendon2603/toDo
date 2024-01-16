import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [
      Task(
          title: 'Tarea 1',
          description: 'Descripción de la tarea 1',
          isCompleted: true,
          date: DateTime(2024)),
      Task(
          title: 'Tarea 2',
          description: 'Descripción de la tarea 2',
          isCompleted: false,
          date: DateTime(2024)),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDO List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
          );
        },
      ),
    );
  }
}
