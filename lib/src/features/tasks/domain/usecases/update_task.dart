import 'package:tododuo/src/features/tasks/domain/entities/task.dart';
import 'package:tododuo/src/features/tasks/domain/repositories/task_repository.dart';

class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  Future<void> call(Task task) {
    return repository.updateTask(task);
  }
}
