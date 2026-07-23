class PriorityNotFound implements Exception{
  String message;
  PriorityNotFound(this.message);

  @override
  String toString() {
    return "PriorityNotFound: $message";
  }
}