class Cliente {
  late String nome;
  late DateTime dataNascimento;
  late String _password;
  late String email;
  late int telefone;

  Cliente({
    required this.nome,
    required this.dataNascimento,
    required this.email,
    required this.telefone,
  }) {
    // Bloco de inicialização (se necessário)
  }

  set password(String value) {
    _password = value;
  }

  
}
