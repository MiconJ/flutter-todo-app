import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum TaskCategory { SYP, IDO, iJob, Other }

final formatter = DateFormat.yMd();
final Uuid uuid = Uuid();

class Task {
  final String id;
  final String taskTitle;
  final String? taskDescription;
  final DateTime? startDate;
  final DateTime? endDate;
  final TaskCategory taskCategory;

  Task({
    required this.taskTitle,
    this.taskDescription,
    this.startDate,
    this.endDate,
    required this.taskCategory,
  }) : id = uuid.v4();

  @override
  String toString() {
    return 'Current Task is: $taskTitle. Content: \n$taskDescription';
  }
}
