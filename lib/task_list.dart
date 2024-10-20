import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/task_item.dart'; // Giả sử bạn có một widget TaskItem

class TaskList extends StatelessWidget {
  final List<Task> tasks; // Thêm từ khóa final

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.15),
          margin: const EdgeInsets.all(4), // Thêm const cho EdgeInsets
        ),
        key: ValueKey(tasks[index].id), // Giả sử Task có thuộc tính id
        direction: DismissDirection.endToStart, // Định hướng xóa
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
