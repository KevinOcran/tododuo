import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tododuo/src/features/tasks/domain/entities/task.dart';
import 'package:tododuo/src/features/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final FirebaseFirestore _firestore;

  TaskRepositoryImpl(this._firestore);

  @override
  Stream<List<Task>> getTasks() {
    return _firestore.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Task.fromJson(data).copyWith(id: doc.reference);
      }).toList();
    });
  }

  @override
  Future<void> addTask(String title) {
    final task = Task(
      title: title,
      createdAt: DateTime.now(),
    );
    final json = task.toJson();
    json.remove('id'); // Remove id before adding
    return _firestore.collection('tasks').add(json);
  }

  @override
  Future<void> updateTask(Task task) {
    final json = task.toJson();
    json.remove('id'); // Remove id before updating
    return task.id!.update(json);
  }

  @override
  Future<void> deleteTask(String id) {
    return _firestore.collection('tasks').doc(id).delete();
  }
}
