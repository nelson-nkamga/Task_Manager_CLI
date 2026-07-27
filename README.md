# Task Manager CLI

Application en ligne de commande de gestion de tâches développée en **Dart pur** (sans Flutter).

## Présentation du projet

Ce projet a été réalisé dans le cadre de mon apprentissage de Flutter sur la plateforme **NextFlutter**. Avant de développer des applications Flutter complètes, il est essentiel de maîtriser les bases solides du langage Dart.

L'objectif de ce projet est de valider ma maîtrise des concepts avancés de Dart en construisant une application CLI complète, structurée et testée, en utilisant uniquement Dart sans interface graphique.

À travers cette application, j'ai pu mettre en pratique les principes de programmation orientée objet, la gestion des données, les tests unitaires ainsi que les bonnes pratiques de développement logiciel.

---

## Objectif pédagogique

Ce projet a été conçu pour démontrer ma capacité à :

* concevoir une application Dart complète ;
* organiser le code avec une architecture claire ;
* utiliser les fonctionnalités avancées du langage Dart ;
* écrire du code maintenable et testable ;
* appliquer des pratiques professionnelles comme l'intégration continue (CI/CD).

---

## Fonctionnalités

L'application permet de gérer des tâches directement depuis le terminal.

Fonctionnalités disponibles :

* Ajouter une tâche :

  * titre ;
  * priorité (`low`, `medium`, `high`) ;
  * date limite optionnelle.

* Afficher toutes les tâches.

* Trier les tâches :

  * par priorité ;
  * par date limite.

* Marquer une tâche comme terminée.

* Supprimer une tâche.

* Sauvegarder automatiquement les données dans un fichier JSON local.

* Charger les tâches sauvegardées au démarrage de l'application.

---

## Concepts Dart mis en pratique

Ce projet m'a permis de mettre en œuvre plusieurs concepts avancés de Dart :

* Classes abstraites.
* Héritage (`Task` → `UrgentTask`).
* Interfaces.
* Génériques (`Repository<T>`).
* Exceptions personnalisées.
* Programmation orientée objet.
* Sérialisation et désérialisation JSON.
* Tests unitaires avec le package `test`.

---

## Structure du projet

Le projet est organisé afin de séparer les responsabilités :

```text
lin/
├── entity/          # Modèles de données (Task, Priority...)
└── enums/           
└── exception/           # exceptions personnalisees
└── interface/           
├── repository/    # Gestion des données , persistance 


bin/
└── projet_cli.dart  # Point d'entrée de l'application

test/
├── task_test.dart
├── repository_test.dart
├── persistance_test.dart
├── json_test.dart
├── priority_test.dart
└── projet_cli_test.dart
```

---

## Prérequis

* Dart SDK version 3.x ou supérieure.

Vérifier l'installation de Dart :

```bash
dart --version
```

---

## Installation

Cloner le projet :

```bash
git clone https://github.com/nelson-nkamga/Task_Manager_CLI.git
```

Accéder au dossier :

```bash
cd Task_Manager_CLI
```

Installer les dépendances :

```bash
dart pub get
```

---

## Exécution de l'application

Lancer l'application depuis la racine du projet :

```bash
dart run bin/projet_cli.dart
```

---

## Tests

Le projet contient des tests unitaires permettant de vérifier le bon fonctionnement des différentes fonctionnalités.

Pour lancer les tests :

```bash
dart test
```

Les tests couvrent notamment :

* la création et la modification des tâches ;
* la gestion du repository ;
* la suppression des tâches ;
* la gestion des priorités ;
* la sauvegarde et le chargement JSON.

---

## Intégration continue (CI/CD)

Le projet utilise GitHub Actions afin d'automatiser les vérifications à chaque modification envoyée sur GitHub.

La pipeline CI exécute automatiquement :

```bash
dart pub get
dart format --output=none --set-exit-if-changed .
dart analyze
dart test
```

Cela permet de vérifier automatiquement :

* le respect du formatage Dart ;
* l'absence d'erreurs d'analyse ;
* la réussite de tous les tests.

---

## Ce que ce projet m'a apporté

La réalisation de ce projet m'a permis de renforcer ma compréhension de Dart avant de poursuivre mon apprentissage Flutter.

J'ai notamment appris à :

* structurer une application complète ;
* appliquer les principes de programmation orientée objet ;
* manipuler la persistance des données ;
* écrire des tests automatisés ;
* utiliser GitHub Actions pour améliorer la qualité du code.

Ce projet représente une étape importante dans mon parcours d'apprentissage Flutter et ma progression vers le développement d'applications plus complexes.

---

## Auteur

**Nelson Nkamga**

Projet réalisé dans le cadre de la validation des acquis en Dart avancé sur la plateforme NextFlutter.
