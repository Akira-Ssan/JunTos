
import 'package:flutter/material.dart';

class DevsCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String imageasset;

  const DevsCard(
      {super.key,
      required this.imageasset,
      required this.titulo,
      required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset(imageasset),
              title: Text(titulo),
              subtitle: Text(subtitulo),
            ),
           
          ],
        ),
      ),
    );
  }
}
