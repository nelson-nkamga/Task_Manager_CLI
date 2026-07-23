
class TaskNotFound  implements Exception{
  String message;
  TaskNotFound(this.message);

  @override
  String toString() {
    return "TaskNotFound: $message";
  }
}