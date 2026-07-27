import '../enums/priority.dart';
import '../enums/statutTask.dart';
import '../interface/taskContract.dart';

abstract class Task implements TaskContract {
  @override
  int id = 0;

  String title;
  Priority priority;
  Statuttask status = Statuttask.notStarted;
  DateTime dueDate = DateTime.now();

  Task(this.title, this.priority);

  void displayTaskDetails();

  void markAsCompleted() {
    if (status == Statuttask.completed) {
      status = Statuttask.notStarted;
      print('La tâche a été marquée comme non terminée.');
    } else {
      status = Statuttask.completed;
      print('La tâche a été marquée comme terminée.\n');
    }
  }

  // convert an object to a json
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority.toString(),
      'status': status.toString(),
      'dueDate': dueDate.toIso8601String(),
    };
  }
}
