import 'package:flutter/material.dart';

void main() => runApp(const PaginaPrincipal());

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Página Principal'),
        ),
        body: const Center(
          child: Text('Bem-vindo à Página Principal!'),
        ),
      ),
    );
  }
}
