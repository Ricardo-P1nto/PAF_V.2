import 'package:flutter/material.dart';

mostarSnackBar({required BuildContext context, required String mensagem, bool erro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(mensagem),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}