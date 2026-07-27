//test de la persistance de donnee dans un fichier json

import 'package:test/test.dart';
import '../bin/repository/repository.dart';
import '../bin/entity/normalTask.dart';
import '../bin/enums/priority.dart';


void main(){
  test('save and load task to/from json file',(){
      final repository1 = Repository<NormalTask>();
      final task =  NormalTask('go shopping', Priority.LOW);

      repository1.addItem(task);
      repository1.saveToFile('file_test.json');

      final repository2 = Repository<NormalTask>();
      repository2.loadFromFile('file_test.json',(json)=> NormalTask.fromJson(json));

      expect(repository2.getItems().length, equals(1));
    });
}