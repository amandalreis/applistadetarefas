import 'package:flutter/material.dart';
import 'package:meuprojetoflutter/screens/home.dart';
import 'package:meuprojetoflutter/id%20visual/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: tema,
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}