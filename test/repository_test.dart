import 'package:test/test.dart';
import '../bin/entity/normalTask.dart';
import '../bin/enums/statutTask.dart';
import '../bin/repository/repository.dart';
import '../bin/enums/priority.dart';

void main(){

  group('repository', (){
    // test de la fonction addItem de la classe Repository
    test('addItem ajoute une tâche à la liste', (){
      final repository = Repository<NormalTask>();
      final task = NormalTask('Test Task', Priority.LOW);
      repository.addItem(task);
      expect(repository.getItems().length, equals(1));
    });

    // test de la fonction removeById 
    test("supprime la tache avec l'id",(){
      final repository = Repository<NormalTask>();
      final task = NormalTask('go shoping', Priority.LOW);
      repository.addItem(task);

      repository.removeById(task.id);
      expect(repository.getItems(), isEmpty);
    });

    //test de la persistance de donnee dans un fichier json
    test('save and load task to/from json file',(){
      final repository1 = Repository<NormalTask>();
      final task =  NormalTask('go shopping', Priority.LOW);

      repository1.addItem(task);
      repository1.saveToFile('file_test.json');

      final repository2 = Repository<NormalTask>();
      repository2.loadFromFile('file_test.json',(json)=> NormalTask.fromJson(json));

      expect(repository2.getItems().length, equals(1));
    });
  });

  group('task',(){
    // test de la methode : markAsComplete
    test('test de la methode markAsComplete', (){
      final task = NormalTask('make a post on linkedlin', Priority.LOW);
    
      task.markAsCompleted();

      expect(task.status, equals(Statuttask.completed));
    });

    // test de la methode toJson
    test('toJson convertit correctement une Task en JSON', () {
      final task = NormalTask(
        'make a post on linkedin',
        Priority.LOW,
      );

      final json = task.toJson();

      expect(json['title'], equals('make a post on linkedin'));
      expect(json['priority'], equals('Priority.LOW'));
      expect(json['status'], equals('Statuttask.notStarted'));
      });

    
  });

  
}
