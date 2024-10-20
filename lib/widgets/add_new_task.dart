import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key, required this.onAddTask});

  final void Function(Task task) onAddTask;

  @override
  State<StatefulWidget> createState() {
    return _AddNewTaskState();
  }
}

class _AddNewTaskState extends State<AddNewTask> {
  String _taskTitle = '';
  DateTime? _startSelectedDate;
  DateTime? _endSelectedDate;
  String? _taskDescription;
  TaskCategory _selectedCategory = TaskCategory.Other;

  final _taskTitleController = TextEditingController();
  final _taskDescriptionController = TextEditingController();

  void _submitNewTask() {
    // Your existing submit logic...
  }

  void _presentStartDatePicker() async {
    // Your existing date picker logic...
  }

  void _presentEndDatePicker() async {
    // Your existing date picker logic...
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Bọc toàn bộ nội dung trong SingleChildScrollView
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add New Task',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              maxLength: 50,
              decoration: const InputDecoration(labelText: 'Task Title'),
              controller: _taskTitleController,
              onChanged: (text) {
                setState(() {
                  _taskTitle = text;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              maxLength: 300,
              decoration: const InputDecoration(labelText: 'Task Description'),
              controller: _taskDescriptionController,
              onChanged: (text) {
                setState(() {
                  _taskDescription = text;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Start Date
                Column(
                  children: [
                    IconButton(
                      onPressed: _presentStartDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                    Text(_startSelectedDate == null
                        ? 'No selected start date'
                        : '${_startSelectedDate!.toLocal()}'.split(' ')[0]),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    IconButton(
                      onPressed: _presentEndDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                    Text(_endSelectedDate == null
                        ? 'No selected end date'
                        : '${_endSelectedDate!.toLocal()}'.split(' ')[0]),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                DropdownButton<TaskCategory>(
                  value: _selectedCategory,
                  items: TaskCategory.values.map((category) {
                    return DropdownMenuItem<TaskCategory>(
                      value: category,
                      child: Text(category.name.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                      });
                      print(value);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitNewTask,
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
