import 'package:flutter/material.dart';
import 'package:meuprojetoflutter/components/task.dart';
import 'package:meuprojetoflutter/screens/form_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
          children: [
            Task(
                'Aprender Flutter',
                '/Users/labes/dev/meuprojetoflutter/lib/assets/images/dash.png',
                3),
            Task(
                'Andar de bike',
                '/Users/labes/dev/meuprojetoflutter/lib/assets/images/bike.webp',
                2),
            Task(
                'Meditar',
                '/Users/labes/dev/meuprojetoflutter/lib/assets/images/meditar.jpeg',
                5),
            Task(
                'Ler um livro',
                '/Users/labes/dev/meuprojetoflutter/lib/assets/images/livro.jpg',
                4),
            Task(
                'Jogar Videogame',
                '/Users/labes/dev/meuprojetoflutter/lib/assets/images/jogar.jpg',
                1),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/newtask");
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
