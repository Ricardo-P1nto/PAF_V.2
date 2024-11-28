import 'package:flutter/material.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página Principal"),
      ),
      body: Center(
        child: const Text(
          "Bem-vindo à Página Principal!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
