import 'package:flutter/material.dart';

void exibirAlerta(context, String title, String msg, String type,
    {String hint = 'Nome'}) {
  if (type case 'cancel_yes') {
    {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(title),
                content: Text(msg),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  } else if (type case 'input_ok') {
    {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(title),
                content: Text(msg),
                actions: [
                  TextField(
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      labelText: hint,

                      
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  } else {
    {
      Navigator.popAndPushNamed(context, 'Principal');
    }
  }
}
