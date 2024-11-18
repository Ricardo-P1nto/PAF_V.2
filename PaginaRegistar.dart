import 'package:flutter/material.dart';

import 'main.dart';

class PaginaRegistar extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController datanastimentoController;
  final TextEditingController ccController;
  final TextEditingController confirmpasswordController;

  const PaginaRegistar({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.emailController,
    required this.datanastimentoController,
    required this.ccController,
    required this.confirmpasswordController,
  });

  @override
  _PaginaRegistarState createState() => _PaginaRegistarState();
}

class _PaginaRegistarState extends State<PaginaRegistar> {
  int currentStep = 0; // Track the current registration step

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              if(currentStep == 0 )

                const Text(
                  "Faça o resgistro da sua conta",
                  style: TextStyle(fontSize: 18.0),
                ),

                Column(
                  children: [
                    const SizedBox(height: 25),
                    TextField(
                      controller: widget.usernameController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                        ),
                        fillColor: Colors.blueAccent,
                        filled: true,
                        hintText: 'Username',
                      ),
                    ),


                    const SizedBox(height: 16),
                    TextField(
                      controller: widget.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                        ),
                        fillColor: Colors.blueAccent,
                        filled: true,
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: widget.confirmpasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                        ),
                        fillColor: Colors.blueAccent,
                        filled: true,
                        hintText: 'Confirmar password',
                      ),
                    ),
                   ],
                ),

              if (currentStep == 1)

                Column(
                  children: [
                    const SizedBox(height: 16),
                    TextField(
                      controller: widget.emailController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors
                              .deepPurpleAccent),
                        ),
                        fillColor: Colors.blueAccent,
                        filled: true,
                        hintText: 'Email',
                      ),
                    ),
                  ],
                ),

              if (currentStep == 2)

                Column(
                  children: [
                    const SizedBox(height: 16),
                    TextField(
                      controller: widget.ccController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors
                              .deepPurpleAccent),
                        ),
                        fillColor: Colors.blueAccent,
                        filled: true,
                        hintText: 'Numero do CC',
                      ),
                    ),

                    const SizedBox(height: 16),
                    TextField(
                      controller: widget.datanastimentoController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                        ),
                        fillColor: Colors.blueAccent,
                        filled: true,
                        hintText: 'Data de Nascimento',
                      ),
                    ),
                  ],
                ),


          const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _butaoVoltar,
                    child: const Text('Voltar átras'),
                  ),

                  Container(width: 20),

                  ElevatedButton(
                  onPressed: _butaoRegistar,
                  child: const Text('Avançar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


        void _butaoRegistar() {
          setState(() {
            if (currentStep < 4) {
              currentStep++;
            } else {
              if (currentStep == 0) {
                navigateToHomePage();
              } else {
                // Registration completed, you can navigate to the next screen or perform final actions
                print('Registration completed!');
              }
            }
          });
        }


        void _butaoVoltar() {
          setState(() {
            if (currentStep > 0) {
              currentStep--;
            } else if (currentStep == 0) {
                navigateToHomePage();
              } else {
                // Registration completed, you can navigate to the next screen or perform final actions
                print('Registration completed!');
              }
            }

          );
        }

        void navigateToHomePage() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
          );
        }
}
