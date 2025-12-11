import 'dart:convert';

class TodolistModel {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  TodolistModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  TodolistModel copyWith({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) {
    return TodolistModel(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      completed: completed ?? this.completed,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todo': todo,
      'completed': completed,
      'userId': userId,
    };
  }

  factory TodolistModel.fromMap(Map<String, dynamic> map) {
    return TodolistModel(
      id: map['id']?.toInt() ?? 0,
      todo: map['todo'] ?? '',
      completed: map['completed'] ?? false,
      userId: map['userId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodolistModel.fromJson(String source) => TodolistModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TodolistModel(id: $id, todo: $todo, completed: $completed, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TodolistModel &&
      other.id == id &&
      other.todo == todo &&
      other.completed == completed &&
      other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      todo.hashCode ^
      completed.hashCode ^
      userId.hashCode;
  }
}
