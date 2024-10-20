import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onDeleteTask;

  const TaskList({Key? key, required this.tasks, required this.onDeleteTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: TaskItem(
          task: tasks[index],
          onIconPressed: () => onDeleteTask(tasks[index]),
        ),
      ),
    );
  }
}
