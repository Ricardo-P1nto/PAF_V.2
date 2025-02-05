import 'package:flutter/material.dart';
import 'package:projeto/servicos/autenticacao_servico.dart';

import '../paginaPrincipal.dart';

class PaginaConfiguracoes extends StatelessWidget {
  const PaginaConfiguracoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pagina Principal'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                );
              },
            ),
            ListTile(
              tileColor: Colors.grey[300],
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaginaConfiguracoes()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Deslogar'),
              onTap: () async {
                await AutenticacaoServico().deslogar(context);
              },
            ),
          ],
        ),
      ),

      body: const Center(
        child: Text(
          'Aqui você pode ajustar suas configurações.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}