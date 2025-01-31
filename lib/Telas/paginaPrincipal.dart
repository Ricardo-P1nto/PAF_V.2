import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto/servicos/autenticacao_servico.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 Pega o usuário autenticado
    User? usuario = FirebaseAuth.instance.currentUser;
    String email = usuario?.email ?? "Email não disponível"; // Se não tiver email, mostra um texto alternativo

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Principal'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Deslogar'),
              onTap: () async {
                print("Tentando deslogar...");
                await AutenticacaoServico().deslogar(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Bem-vindo, $email", // 🔥 Exibe o email no centro da tela
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
