import 'package:flutter/material.dart';
import 'package:projeto/PaginaRegistar.dart';
import 'PaginaPrincipal.dart';

void main() => runApp (
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  )
);

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade900,
              Colors.purple.shade800,
              Colors.purple.shade700
            ]
          )
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
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)
                    )
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[

                        const SizedBox( height: 60,), //entre "Bem vindos" e a Box Preta

                        Container(

                          padding: const EdgeInsets.all(20),

                          decoration: BoxDecoration(

                            color: Colors.black,

                            borderRadius: BorderRadius.circular(10),

                            boxShadow: const [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),

                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 40,

                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.purple.shade200))
                                ),

                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: "Email ou Telemovel"
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
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

