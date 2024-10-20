import 'package:flutter/material.dart';
import 'package:todo_app/add_new_task.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/task_list.dart';

class MyApp extends StatefulWidget {
  final String screenTitle;

  const MyApp({Key? key, required this.screenTitle}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Task> _registeredTasks = [
    Task(
      taskTitle: 'Đánh răng',
      endDate: DateTime.now(),
      taskCategory: TaskCategory.IDO,
      taskDescription:
          'This is the description of Đánh răng. Please read it after waking up.',
      startDate: DateTime.now(),
    ),
    Task(
      taskTitle: 'Rửa mặt',
      endDate: DateTime.now(),
      taskCategory: TaskCategory.IDO,
      taskDescription:
          'This is the description of Rửa mặt. Please read it after Đánh răng.',
      startDate: DateTime.now(),
    ),
    Task(
      taskTitle: 'Đi ngủ',
      endDate: DateTime.now(),
      taskCategory: TaskCategory.IDO,
      taskDescription:
          'This is the description of Đi ngủ. Please read it after Rửa mặt.',
      startDate: DateTime.now(),
    ),
  ];

  String _searchKeyWord = '';
  final TextEditingController searchKWEditingController =
      TextEditingController();

  void _addNewTask(Task task) {
    setState(() {
      _registeredTasks.add(task);
    });
  }

  List<Task> _getFilteredTasks() {
    return _registeredTasks.where((task) {
      return task.taskTitle
          .toLowerCase()
          .contains(_searchKeyWord.toLowerCase());
    }).toList();
  }

  void _openAddNewTaskModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return AddNewTask(onAddTask: _addNewTask);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Task> filteredTasks = _getFilteredTasks();

    Widget mainContent = const Center(
      child: Text('No tasks found!'),
    );

    if (filteredTasks.isNotEmpty) {
      mainContent = TaskList(tasks: filteredTasks);
    }

    return MaterialApp(
      title: widget.screenTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.screenTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _openAddNewTaskModal,
            ),
          ],
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Search here',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              _searchKeyWord = '';
                              searchKWEditingController.clear();
                            });
                          },
                        ),
                      ),
                      controller: searchKWEditingController,
                      onChanged: (text) {
                        setState(() {
                          _searchKeyWord = text;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
