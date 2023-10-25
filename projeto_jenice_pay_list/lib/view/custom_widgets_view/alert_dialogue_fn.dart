import 'package:flutter/material.dart';

void exibirAlerta(context, String title, String msg) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text(title),
            content: Text(msg),
            actions: [
              TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, 'principal');
                  Navigator.of(ctx).pop();
                },
                child: Container(
                  color: const Color.fromARGB(255, 0, 182, 88),
                  padding: const EdgeInsets.all(14),
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              )
            ],
          ));
}
