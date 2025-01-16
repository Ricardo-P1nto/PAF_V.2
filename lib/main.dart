import 'package:flutter/material.dart';
import 'PaginaRegistar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor insira uma password';
  } else if (value.length < 6) {
    return 'A password deve ter pelo menos 6 caracteres';
  } else if (!RegExp(r'^(?=.*[0-9]).{6,}$').hasMatch(value)) {
    return 'A password deve conter pelo menos 1 número';
  }
  return null;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Inicia o app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Detecta o espaço disponível com o teclado ativo
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false, // Permite redimensionar para evitar o teclado
      body: SafeArea(
        child: Stack(
          children: [

            // Imagem de fundo
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imagens/FotoDeLisboa2.jpg"),
                  fit: BoxFit.cover, // Cobre toda a tela sem distorcer
                ),
              ),
            ),

            // Conteúdo principal
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Bem vindos à Rua Saudável",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),

                    ],
                  ),
                ),

                // Container amarelo com conteúdo rolável
                Expanded(
                  child: Container(

                    width: double.infinity,

                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 253, 208, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: bottomInset, // Adapta ao teclado
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),

                            // Campos de texto
                            Container(

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),

                              child: Column(
                                children: [

                                  //Text Field para Email
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(color: Colors.grey),
                                      ),
                                    ),

                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),

                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Por favor insira um email';
                                        } else if ((value?.length ?? 0) < 6) {
                                          return 'O email deve ter pelo menos 6 caracteres';
                                        } else if (!(value?.contains('@') ?? false)) {
                                          return 'Email inválido (falta o @)';
                                        } else if (!(value?.contains('.') ?? false)) {
                                          return 'Email inválido (falta o .)';
                                        }
                                        return null;
                                      },

                                    ),
                                  ),

                                  //Text Field para Password
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),

                                      validator: passwordValidator,

                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              "Forgot Password",
                              style: TextStyle(color: Colors.grey),
                            ),

                            const SizedBox(height: 20),

                            // Botão de Login
                            Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blueGrey,
                              ),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Botão de Criar Conta
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaginaRegistar(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blueGrey,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Criar Conta",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              "Continuar com outras plataformas",
                              style: TextStyle(color: Colors.grey),
                            ),

                            const SizedBox(height: 20),

                            // Botões de Facebook e Google
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Facebook",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Google",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
