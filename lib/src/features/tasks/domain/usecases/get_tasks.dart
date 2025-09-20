import 'package:tododuo/src/features/tasks/domain/entities/task.dart';
import 'package:tododuo/src/features/tasks/domain/repositories/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Stream<List<Task>> call() {
    return repository.getTasks();
  }
}
