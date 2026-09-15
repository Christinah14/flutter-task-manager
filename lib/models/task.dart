class Task {
  final String title;
  final DateTime dueDate;
  final bool isCompleted;

  Task({
    required this.title,
    required this.dueDate,
    //by default
    this.isCompleted = false
    });
}
