import 'package:flutter/material.dart';
import 'package:meuprojetoflutter/components/task.dart';
import 'package:meuprojetoflutter/data/taskDAO.dart';
import 'package:meuprojetoflutter/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  //Variáveis

  //Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext contextForm) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
            title: Container(
          alignment: AlignmentDirectional.centerStart,
          child: Text('Nova Tarefa'),
        )),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 850,
              width: 500,
              color: Colors.white,
              child: Column(
                children: [
                  //TextFormField Nome
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 24.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Insira o nome da tarefa';
                        } else {
                          return null;
                        }
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),

                  //TextFormField Dificuldade
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 30.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),

                  //TextFormField Imagem
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 30.0, bottom: 30.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira uma URL de uma imagem!';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'URL da Imagem',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),

                  //Prévia da Imagem
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                              '/Users/labes/dev/meuprojetoflutter/lib/assets/images/nophoto.png');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            ScaffoldMessenger.of(contextForm).showSnackBar(
                              SnackBar(
                                content: Text('Salvando tarefa...'),
                              ),
                            );

                            TaskDAO().save(Task(
                                nameController.text,
                                imageController.text,
                                int.parse(difficultyController.text)));

                            Future timerPop() async {
                              await Future.delayed(Duration(milliseconds: 10));
                              Navigator.pop(contextForm);
                            }

                            timerPop();

                            ScaffoldMessenger.of(contextForm).showSnackBar(
                              SnackBar(
                                content: Text('Tarefa adicionada!'),
                              ),
                            );

                          } on Exception {
                            ScaffoldMessenger.of(contextForm).showSnackBar(
                              SnackBar(
                                content: Text('Ocorreu algum erro.'),
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Adicionar'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
