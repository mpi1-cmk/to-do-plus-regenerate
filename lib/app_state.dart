import 'package:flutter/material.dart';
import 'models.dart';

class AppState extends ChangeNotifier {
  List<Task> tasks = [];
  int currentStreak = 0;
  String? lastCompletionDate;

  void toggleTask(Task task) {
    task.isCompleted = !task.isCompleted;
    _checkAndUpdateStreak();
    notifyListeners();
  }

  void _checkAndUpdateStreak() {
    if (tasks.isEmpty) return;

    final allCompleted = tasks.every((t) => t.isCompleted);
    final today = DateTime.now().toIso8601String().substring(0, 10);

    if (allCompleted && lastCompletionDate != today) {
      final yesterday = DateTime.now()
          .subtract(const Duration(days: 1))
          .toIso8601String()
          .substring(0, 10);

      if (lastCompletionDate == yesterday) {
        currentStreak++;
      } else {
        currentStreak = 1;
      }
      lastCompletionDate = today;
    }
  }

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.removeWhere((t) => t.id == task.id);
    notifyListeners();
  }
}
