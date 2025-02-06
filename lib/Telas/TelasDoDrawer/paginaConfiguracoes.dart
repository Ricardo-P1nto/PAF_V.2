import 'package:flutter/material.dart';
import 'package:projeto/servicos/autenticacao_servico.dart';
import '../../Comun/meu_commingsoon.dart';
import '../paginaPrincipal.dart';

class PaginaConfiguracoes extends StatelessWidget {
  PaginaConfiguracoes({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Configurações'),
      ),

      //Aqui é o drawer que aparece quando clicamos no ícone de menu

      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
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
                _scaffoldKey.currentState?.openEndDrawer();
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

      //A partir daqui, são abas dentro da página de configurações

      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaginaCommingSoon()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notificações'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaginaCommingSoon()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacidade'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaginaCommingSoon()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Idioma'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaginaCommingSoon()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Ajuda'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaginaCommingSoon()),
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
    );
  }
}