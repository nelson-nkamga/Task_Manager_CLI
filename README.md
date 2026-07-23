Task Manager CLI

Application en ligne de commande de gestion de tâches, écrite en Dart pur (sans Flutter).

Description

Ce projet permet de gérer une liste de tâches directement depuis le terminal :

  Ajouter une tâche (titre, priorité, date limite optionnelle)
  Lister les tâches (avec tri par priorité ou par date)
  Marquer une tâche comme terminée
  Supprimer une tâche
  Sauvegarder et recharger automatiquement les tâches dans un fichier JSON local

Concepts Dart mis en avant :
  Classe abstraite
  Heritage
  Interfaces
  Generiques
  Exceptions personnalisees
  persistance JSON
  Tests unitaires 

Prérequis
  Dart SDK installé (version 3.x ou supérieure)
  Vérifier l'installation :
  bash
    dart --version
    
Installation
  1-Cloner ou récupérer le projet, puis se placer dans le dossier :
  bash
     cd projet_cli
  Installer les dépendances définies dans pubspec.yaml :
  bash
     dart pub get
  Exécution
  
  Lancer l'application depuis la racine du projet :
  
  bash
    dart run bin/projet_cli.dart

Lancer les tests
  bash
    dart test

Auteur

Nelson Nkamga  — Projet réalisé dans le cadre d'un exercice de validation des acquis     en Dart.
