import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task('Aprender Flutter',
        '/Users/labes/dev/meuprojetoflutter/lib/assets/images/dash.png', 3),
    Task('Andar de bike',
        '/Users/labes/dev/meuprojetoflutter/lib/assets/images/bike.webp', 2),
    Task('Meditar',
        '/Users/labes/dev/meuprojetoflutter/lib/assets/images/meditar.jpeg', 5),
    Task('Ler um livro',
        '/Users/labes/dev/meuprojetoflutter/lib/assets/images/livro.jpg', 4),
    Task('Jogar Videogame',
        '/Users/labes/dev/meuprojetoflutter/lib/assets/images/jogar.jpg', 1),
  ];

  void newTask(String nome, String foto, int dificuldade) {
    taskList.add(Task(nome, foto, dificuldade));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
