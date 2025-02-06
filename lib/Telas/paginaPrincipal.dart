import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto/servicos/autenticacao_servico.dart';
import 'TelasDoDrawer/paginaConfiguracoes.dart';

class PaginaPrincipal extends StatelessWidget {
  PaginaPrincipal({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    User? usuario = FirebaseAuth.instance.currentUser;
    String email = usuario?.email ?? "Email não disponível";

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Pagina Principal'),
      ),

      //Aqui é o drawer que aparece quando clicamos no ícone de menu

      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              tileColor: Colors.grey[300],
              leading: const Icon(Icons.home),
              title: const Text('Pagina Principal'),
              onTap: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaConfiguracoes()),
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

      //Aqui é o corpo da página principal

      body: Center(
        child: Text(
          "Bem-vindo, $email",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}