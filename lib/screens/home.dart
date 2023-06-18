import 'package:flutter/material.dart';
import 'package:meuprojetoflutter/components/task.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: const Text('Tarefas')),
      ),
      body: Container(
        color: Colors.white24,
        child: AnimatedOpacity(
          opacity: (opacidade == true) ? 1 : 0,
          duration: const Duration(milliseconds: 50),
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
              Task('Jogar Videogame',
                  '/Users/labes/dev/meuprojetoflutter/lib/assets/images/jogar.jpg', 1),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.blue,
        child: (opacidade == true)
            ? Icon(Icons.remove_red_eye)
            : Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
