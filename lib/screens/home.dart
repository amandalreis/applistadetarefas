import 'package:flutter/material.dart';
import 'package:meuprojetoflutter/components/task.dart';
import 'package:meuprojetoflutter/data/taskDAO.dart';
import 'package:meuprojetoflutter/data/task_inherited.dart';
import 'package:meuprojetoflutter/screens/form_screen.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext contextHome) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {setState(() {
            
          });}, icon: Icon(Icons.refresh)),
        ],
        title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: const Text('Tarefas')),
      ),
      body: Container(
          color: const Color.fromRGBO(255, 255, 255, 0.239),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: FutureBuilder<List<Task>>(
              future: TaskDAO().findAll(),
              builder: (context, snapshot) {
                List<Task>? items = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando tarefas...'),
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando tarefas...'),
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    return Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando tarefas...'),
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasData && items != null) {
                      if (items.isNotEmpty) {
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Task tarefa = items[index];
                              return tarefa;
                            });
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://cdn5.colorir.com/desenhos/color/201815/grilo-divertido-animais-insectos-1460513.jpg',
                              height: 140,
                            ),
                            Text(
                              'Cri cri cri...',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(
                      child: Text('Ocorreu um erro ao carregar as tarefas!'),
                    );
                    break;
                }
                return Center(
                  child: Text('Ocorreu um erro desconhecido.'),
                );
              },
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {
                print('Recarregando...');
              }));
          //Navigator.pushNamed(contextHome, "/newtask");
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
    );
  }
}
