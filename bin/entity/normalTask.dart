import '../entity/task.dart';
import '../enums/priority.dart';
import '../enums/statutTask.dart';

class NormalTask extends Task {
 
  NormalTask(String title, Priority priority) : super(title, priority);

  @override
  void displayTaskDetails() {
    print('je suis une tache normale avec un id : $id, le titre: $title, la priorité: $priority, le statut: $status \n');
    
  }

  // convert json to object
  factory NormalTask.fromJson(Map<String, dynamic> json) {
  final task = NormalTask(
    json['title'],
    Priority.values.firstWhere(
      (e) => e.toString() == json['priority'],
    ),
  );

  task.id = json['id'];

  task.status = Statuttask.values.firstWhere(
    (e) => e.toString() == json['status'],
  );

  task.dueDate = DateTime.parse(json['dueDate']);

  return task;
}


}