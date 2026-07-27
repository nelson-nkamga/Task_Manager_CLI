import 'package:test/test.dart';
import '../bin/entity/normalTask.dart';
import '../bin/repository/repository.dart';
import '../bin/enums/priority.dart';

void main() {
  group('repository', () {
    // test de la fonction addItem de la classe Repository
    test('addItem ajoute une tâche à la liste', () {
      final repository = Repository<NormalTask>();
      final task = NormalTask('Test Task', Priority.LOW);
      repository.addItem(task);
      expect(repository.getItems().length, equals(1));
    });

    // test de la fonction removeById
    test("supprime la tache avec l'id", () {
      final repository = Repository<NormalTask>();
      final task = NormalTask('go shoping', Priority.LOW);
      repository.addItem(task);

      repository.removeById(task.id);
      expect(repository.getItems(), isEmpty);
    });
  });
}
