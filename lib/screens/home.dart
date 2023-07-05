import 'package:flutter/material.dart';
import 'package:meuprojetoflutter/components/task.dart';
import 'package:meuprojetoflutter/data/task_inherited.dart';
import 'package:meuprojetoflutter/screens/form_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key,});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext contextHome) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: const Text('Tarefas')),
      ),
      body: Container(
        color: Colors.white24,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(bottom: 80),
          children: TaskInherited.of(contextHome).taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
             context,
             MaterialPageRoute(
               builder: (contextNew) => FormScreen(taskContext: context,),
             ),
           );
          //Navigator.pushNamed(contextHome, "/newtask");
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
