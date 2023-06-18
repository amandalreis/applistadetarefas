import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(4),
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color.fromARGB(66, 255, 179, 179),
                        ),
                        width: 110,
                        height: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child:
                                Image.asset(widget.foto, fit: BoxFit.cover)
                                ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: TextStyle(
                                  fontSize: 22,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 1)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 2)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 3)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 4)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 5)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        icon: Icon(Icons.arrow_circle_up),
                        color: Colors.blue,
                        iconSize: 35,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    right: 12.0, left: 12.0, top: 8.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                            color: Colors.white, value: nivel / 100)),
                    Text(
                      'Nível ${nivel}',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
