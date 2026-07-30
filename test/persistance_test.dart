//test de la persistance de donnee dans un fichier json
import 'dart:io';
import 'package:test/test.dart';
import '../bin/repository/repository.dart';
import '../bin/entity/normalTask.dart';
import '../bin/enums/priority.dart';

void main() {
  test('save and load task to/from json file', () async {

    final tempDir = await Directory.systemTemp.createTemp();
    final filePath = '${tempDir.path}/file_test.json';

    final repository1 = Repository<NormalTask>();
    final task = NormalTask('go shopping', Priority.LOW);

    repository1.addItem(task);
    repository1.saveToFile(filePath);

    final repository2 = Repository<NormalTask>();
    repository2.loadFromFile(
      filePath,
      (json) => NormalTask.fromJson(json),
    );

    expect(repository2.getItems().length, equals(1));

     await tempDir.delete(recursive: true);
  });
}
