import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.15),
          margin: const EdgeInsets.all(4),
        ),
        key: ValueKey(tasks[index].id),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          // Xử lý xóa nhiệm vụ
          // Ví dụ: bạn có thể gọi hàm để xóa nhiệm vụ khỏi danh sách
          // tasks.removeAt(index);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Task dismissed: ${tasks[index].taskTitle}'),
            ),
          );
        },
        child: TaskItem(task: tasks[index]),
      ),
    );
  }
}
