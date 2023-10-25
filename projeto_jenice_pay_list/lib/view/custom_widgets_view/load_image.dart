import 'package:flutter/material.dart';

class LoadImage extends StatelessWidget {
  final String assetImage;
  //final Color corDoTexto;

  const LoadImage({super.key, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(assetImage) //Container(
      //child:
      //Text(
      //titulo,
      // style: TextStyle(color: corDoTexto),
      //);
      //);
    ]);
  }
}
