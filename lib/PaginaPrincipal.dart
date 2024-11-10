import 'package:flutter/material.dart';

void _butaoLogin (){
  return;
}

class PaginaLogin extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const PaginaLogin({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Faça aqui o login da sua conta",
                style: TextStyle(fontSize: 18.0),
              ),

              const SizedBox(height: 25),

              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white38)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent)
                  ),
                  fillColor: Colors.blueAccent,
                  filled: true,
                  hintText: 'Username',
                ),
              ),

              const SizedBox(height: 16), // Espaçamento entre os TextFields

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent)
                  ),
                  fillColor: Colors.blueAccent,
                  filled: true,
                  hintText: 'Password',
                ),
              ),

              const SizedBox(height: 16), // Espaçamento entre o TextField e o butão

              const ElevatedButton(
                onPressed: _butaoLogin,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
