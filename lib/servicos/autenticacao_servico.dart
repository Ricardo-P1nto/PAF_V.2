import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Telas/main.dart';
import '../Telas/paginaPrincipal.dart';

class AutenticacaoServico {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<String?> cadastrarUsuario({required String email, required String senha, required BuildContext context}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
      await userCredential.user!.updateDisplayName(email);

      // 🔥 Força a navegação para a Página Principal após o cadastro
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PaginaPrincipal()),
      );

      return null;
    } on FirebaseAuthException catch (e) {
      print("Erro ao cadastrar: ${e.code}");
      if (e.code == "email-already-in-use") {
        return "Este email já está em uso";
      }
      return "Erro desconhecido";
    }
  }


  Future<String?> logarUsuarios (
    {required String email, required String senha, required BuildContext context}) async {
      try {
        await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PaginaPrincipal()),
        );
        return null;
      } on FirebaseAuthException catch (e) {
        return e.message;
      }
  }

  Future<void> deslogar(BuildContext context) async {
    try {
      print("Saindo da conta...");
      await FirebaseAuth.instance.signOut();
      print("Usuário deslogado!");

      // Garante que a navegação só acontece após o logout ser concluído
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Homepage()),
        );
      }
    } catch (e) {
      print("Erro ao deslogar: $e");
    }
  }

}
