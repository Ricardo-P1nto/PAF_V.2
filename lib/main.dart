import 'package:flutter/material.dart';
void main() => runApp (
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  )
);

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imagens/FotoDeLisboa.jpg"), // Coloque o caminho da sua imagem
              fit: BoxFit.cover,
            ),
          ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80,),

            const Padding(
                padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                  Text("Bem vindos á Rua Saudavel", style: TextStyle(color: Colors.white, fontSize: 20),)
                ],
              ),
            ),

            const SizedBox(height: 20,),

            Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 253, 208, 20),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)
                    )
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[

                        const SizedBox( height: 60,), //entre "Bem vindos" e a Box Preta

                        Container(

                          decoration: BoxDecoration(

                            color: Colors.white,

                            borderRadius: BorderRadius.circular(10),

                            boxShadow: const [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),

                          child: Column(
                            children: <Widget>[

                              //Container para o Local de escrever  os dados
                              Container(

                                padding: const EdgeInsets.all(10), //Tamanho da caixa do Email e Telemovel

                                decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                                ),

                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: "Email ou Telemovel",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),

                              Container(

                                padding: const EdgeInsets.all(10), //Tamanho da caixa do Email e Telemovel

                                decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey))
                                ),

                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Text("Forgot Password", style: TextStyle(color: Colors.grey),)

                      ],
                    ),
                  ),
                ),
            )
          ],
        )
      ),
    );
  }
}

