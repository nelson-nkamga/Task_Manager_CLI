import '../interface/taskContract.dart';
import 'dart:io';
import 'dart:convert';
import '../exception/taskNotFound.dart';
import '../entity/task.dart';
import '../enums/priority.dart';

class Repository<T extends TaskContract> {
  List<T> items = [];

  int _nextId = 1;

  void addItem(T item) {
    if (item.id == 0) {
      item.id = _nextId++;
    }
    items.add(item);
  }

  void removeById(int id) {
    try {
      final exists = items.any((item) => item.id == id);

      if (!exists) {
        throw TaskNotFound('Item with id $id not found');
      }

      items.removeWhere((item) => item.id == id);
      print('Item with id $id removed successfully.\n');
    } catch (e) {
      print('Error removing item: $e');
    }
  }

  // sort methode
 
  void sortByPriority(){
    items.sort((a,b) => a.priority.index.compareTo(b.priority.index));
  }

  List<T> getItems() {
    return items;
  }

  // methode dedie a la persistance des donnees

  void saveToFile(String filePath) {
    final file = File(filePath);
    final jsonList = items.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    file.writeAsStringSync(jsonString);
  }

  void loadFromFile(
    String filePath,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      final file = File(filePath);

      if (!file.existsSync()) {
        print("Le fichier $filePath n'existe pas.");
        return;
      }

      final jsonString = file.readAsStringSync();
      final List<dynamic> jsonList = jsonDecode(jsonString);

      items.clear();

      for (final json in jsonList) {
        final item = fromJson(json as Map<String, dynamic>);
        items.add(item);
      }

      // Mise à jour du prochain ID
      if (items.isEmpty) {
        _nextId = 1;
      } else {
        final maxId = items
            .map((item) => item.id)
            .reduce((a, b) => a > b ? a : b);

        _nextId = maxId + 1;
      }

      print("Chargement réussi : ${items.length} éléments.");
    } catch (e) {
      print("Erreur lors du chargement du fichier JSON : $e");
    }
  }
}
