import 'package:tododuo/src/features/tasks/domain/repositories/task_repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<void> call(String title) {
    return repository.addTask(title);
  }
}
