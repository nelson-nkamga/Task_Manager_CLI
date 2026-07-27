import 'package:test/test.dart';
import '../bin/entity/normalTask.dart';
import '../bin/enums/priority.dart';
import '../bin/enums/statutTask.dart';
void main(){
  test('test de la methode markAsComplete', (){
      final task = NormalTask('make a post on linkedlin', Priority.LOW);
    
      task.markAsCompleted();

      expect(task.status, equals(Statuttask.completed));
    });
}