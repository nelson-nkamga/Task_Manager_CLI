import 'repository/repository.dart';
import 'entity/task.dart';
import 'entity/normalTask.dart';
import 'entity/urgentTask.dart';
import 'dart:io';
import 'enums/priority.dart';

void main(List<String> arguments) {
  print('bonjour et bienvenue dans le gestionnaire de taches');

  bool quitter = true;

  Repository<Task> repository = Repository<Task>();

  while (quitter) {
    print('Veuillez choisir une option:');
    print('1. Ajouter une tâche');
    print('2. Supprimer une tâche');
    print('3. Afficher toutes les tâches');
    print('4. Marquer une tâche comme terminée');
    print('5. Sauvegarder les tâches dans un fichier');
    print('6. Charger les tâches depuis un fichier');
    print('7. Quitter \n');

    switch (stdin.readLineSync()) {
      case '1':
        print("entrez le titre de la tâche:");
        String title = stdin.readLineSync() ?? '';
        print("entrez la priorité de la tâche (low, medium, high):");
        String priorityInput = stdin.readLineSync() ?? '';

        Task task = (priorityInput.toLowerCase() == 'high')
            ? UrgentTask(title, Priority.HIGH)
            : NormalTask(title, Priority.LOW);

        repository.addItem(task);
        print(
          "Tâche ajoutée avec succès: ${task.title}, priorité: ${task.priority}\n",
        );
        break;

      case '2':
        print("entrez l'ID de la tâche à supprimer:");
        int id = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        repository.removeById(id);
        break;

      case '3':
        print("Voici la liste des tâches:");
        repository.sortByPriority();
        repository.getItems().forEach((task) => task.displayTaskDetails());
        print('liste des tâches affichée');
        break;

      case '4':
        print("entrez l'ID de la tâche à marquer comme terminée:");
        //int id = int.parse(stdin.readLineSync() ?? '0');
        int id = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        //Repository<Task> repository = Repository<Task>();
        repository.getItems().forEach((task) {
          if (task.id == id) {
            task.markAsCompleted();
          }
        });
        break;

      case '5':
        print("entrez le chemin du fichier pour sauvegarder les tâches:");
        String filePath = stdin.readLineSync() ?? '';
        //  Repository<Task> repository = Repository<Task>();
        repository.saveToFile(filePath);
        break;

      case '6':
        print("entrez le chemin du fichier pour charger les tâches:");
        String filePath = stdin.readLineSync() ?? '';
        //Repository<Task> repository = Repository<Task>();
        repository.loadFromFile(filePath, (json) {
          if (json['priority'] == 'Priority.HIGH') {
            return UrgentTask.fromJson(json);
          } else {
            return NormalTask.fromJson(json);
          }
        });
        break;
      case '7':
        quitter = false;
        print('Au revoir !');
        break;
      default:
        print('Option invalide. Veuillez réessayer.');
    }
  }
}
