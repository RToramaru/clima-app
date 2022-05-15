import 'package:clima_app/pages/tela_carregamento.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicativo de Clima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TelaCarregamento(
        pagina: 'atual',
      ),
    );
  }
}
