import 'package:test/test.dart';
import '../bin/entity/normalTask.dart';
import '../bin/enums/priority.dart';

void main() {
  test('toJson convertit correctement une Task en JSON', () {
    final task = NormalTask('make a post on linkedin', Priority.LOW);

    final json = task.toJson();

    expect(json['title'], equals('make a post on linkedin'));
    expect(json['priority'], equals('Priority.LOW'));
    expect(json['status'], equals('Statuttask.notStarted'));
  });
}
