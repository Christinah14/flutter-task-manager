//defined the task priority values
enum TaskPriority { low, medium, high }

class Task {
  final int? id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime? dueDate;
  final DateTime? createdAt;
  final TaskPriority priority;

  Task({
    this.id,
    required this.title,
    this.description,
    //by default
    this.isCompleted = false,
    required this.dueDate,
    //by default
    this.createdAt,
    required this.priority,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      createdAt: DateTime.parse(json['createdAt']),
      // date string converted to datetime if not null
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      priority: TaskPriority.values[json['priority']],
    );
  }
}
