import 'package:flutter/material.dart';

import 'PaginaPrincipal.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ),
);

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // Envolve todo o conteúdo para evitar áreas inseguras
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
                const SizedBox(height: 70), // Espaço superior

                const Padding(
                  padding: EdgeInsets.all(20),
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

                const Spacer(), // Empurra o container amarelo para baixo

                // Container amarelo com campos de login
                Expanded(
                  child: SingleChildScrollView( // Permite rolagem caso necessário
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
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            const SizedBox(height: 30), // Espaçamento entre título e campos

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
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                        hintText: "Email ou Telemóvel",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
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

                            const SizedBox(height: 5),

                            // Botão de Criar Conta
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaginaPrincipal(), // Redireciona para PaginaPrincipal
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
                                const SizedBox(width: 50),
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

