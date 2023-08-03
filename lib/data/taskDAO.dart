import 'package:meuprojetoflutter/data/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import '../components/task.dart';

class TaskDAO {
  static const String tableSQL = 'CREATE TABLE TASK('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'difficulty INTEGER, '
      'image TEXT)';

  save(Task tarefa) async {
    print('Iniciando o save:');
    Database bancoDeDados = await getDatabase();
    var itemExists = await findOne(tarefa.nome);
    Map<String, dynamic> taskMap = TasktoMap(tarefa);

    if (itemExists.isEmpty) {
      print('Tudo certo! Inserindo nova tarefa...');
      return await bancoDeDados.insert('TASK', taskMap);
    } else {
      print('A tarefa já existe. Atualizando...');
      return await bancoDeDados
          .update('TASK', taskMap, where: 'name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Map<String, dynamic> TasktoMap(Task tarefa) {
    print('Convertendo Task em Map:');
    Map<String, dynamic> mapDeTasks = {};
    mapDeTasks['name'] = tarefa.nome;
    mapDeTasks['difficulty'] = tarefa.dificuldade;
    mapDeTasks['image'] = tarefa.foto;

    return mapDeTasks;
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll:');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query('TASK');
    print('Encontrado: ${result}');
    return toListOfTasks(result);
  }

  List<Task> toListOfTasks(List<Map<String, dynamic>> mapDeTarefas) {
    print('Convertendo to List:');
    List<Task> tasks = [];
    for (Map<String, dynamic> linha in mapDeTarefas) {
      final Task tarefa =
          Task(linha['name'], linha['image'], linha['difficulty']);
      tasks.add(tarefa);
    }
    return tasks;
  }

  Future<List<Task>> findOne(String nomeTask) async {
    print('Acessando o findOne:');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      'TASK',
      where: 'name = ?',
      whereArgs: [nomeTask],
    );
    return toListOfTasks(result);
  }

  delete(String nomeTask) async {
    print('Deletando tarefa...');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      'TASK',
      where: 'name = ?',
      whereArgs: [nomeTask],
    );
  }
}
