import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String email,
    required String senha
  }) async {

    try {
      UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: senha
      );

      await userCredential.user!.updateDisplayName(email);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "Este email já está em uso";
      }
      return "Erro desconhecido";
    }
    // Lógica de cadastro de usuário
  }
}