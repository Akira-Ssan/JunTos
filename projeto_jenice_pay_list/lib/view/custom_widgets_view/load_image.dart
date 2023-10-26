import 'package:flutter/material.dart';

class LoadImage extends StatelessWidget {
  final String assetImage;
 
  const LoadImage({super.key, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(assetImage) //Container(
     
    ]);
  }
}
