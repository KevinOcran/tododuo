import 'package:tododuo/src/features/tasks/domain/entities/task.dart';

  abstract class TaskRepository {
    Stream<List<Task>> getTasks();
    Future<void> addTask(String title);
    Future<void> updateTask(Task task);
    Future<void> deleteTask(String id);
  }