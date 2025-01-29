import 'package:flutter/material.dart';
import 'package:projeto/Comun/meu_snackbar.dart';
import 'package:projeto/RegistarPasso2.dart';
import 'main.dart';
import 'servicos/autenticacao_servico.dart';
import 'Comun/meu_snackbar.dart';

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

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PaginaRegistar(),
  ),
);

class PaginaRegistar extends StatefulWidget {
  const PaginaRegistar({super.key});

  @override
  State<PaginaRegistar> createState() => _PaginaRegistarState();
}

class _PaginaRegistarState extends State<PaginaRegistar> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();
  String? password;

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _senhacontroller = TextEditingController();
  final TextEditingController _confirmacaocontroller = TextEditingController();

  final AutenticacaoServico _autenServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imagens/FotoDeLisboa2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Registar",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Venha criar a sua conta conosco",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
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
                        bottom: bottomInset,
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
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
                                      child: TextFormField(
                                        controller: _emailcontroller,
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
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: _senhacontroller,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            password = value;
                                          });
                                        },
                                        validator: passwordValidator,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        controller: _confirmacaocontroller,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          hintText: "Confirmar Password",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                        validator: (value) {
                                          if (value?.isEmpty ?? true) {
                                            return 'Por favor insira a sua confirmação de password';
                                          }
                                          if (value != password) {
                                            return 'As passwords não coincidem';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Homepage(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.blueGrey,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Voltar Atrás",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState?.validate() ?? false) {
                                          botaoSeguinteClicado();
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.blueGrey,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "criar conta",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  /*Expanded(

                                    child: GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState?.validate() ?? false) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const RegistarPasso2(),
                                            ),
                                          );
                                        }
                                      },

                                      child: Container(
                                        height: 50,

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.blueGrey,
                                        ),

                                        child: const Center(
                                          child: Text(
                                            "Seguinte",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ),

                                  ),*/



                                ],
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                "Criar conta com outras plataformas",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 30),
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
                                  const SizedBox(width: 30),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void botaoSeguinteClicado() {
    String email = _emailcontroller.text;
    String senha = _senhacontroller.text;

    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Cadastro validado");
        print("${_emailcontroller.text}, ${_senhacontroller.text}");
        _autenServico.cadastrarUsuario(email: email, senha: senha).then((String? erro) {
          //Voltou com erro
          if (erro != null){
            mostarSnackBar(context: context, mensagem: erro);
          }else{
            //Voltou sem erro
            mostarSnackBar(context: context, mensagem: "Cadastro efetuado com sucesso", erro: false);
          }
        },
        );
      }
    } else {
      print("Forma inválido");
    }
  }
}