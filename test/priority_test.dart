import 'package:test/test.dart';

import '../bin/entity/normalTask.dart';
import '../bin/enums/priority.dart';
import '../bin/repository/repository.dart';

void main(){

  test('test de la priorite', (){
    final repository = Repository<NormalTask>();
    final task = NormalTask('go shopping', Priority.HIGH);
    repository.addItem(task);

    final storeTask = repository.items[0];

    expect(storeTask.priority, equals(Priority.HIGH));
  });
}