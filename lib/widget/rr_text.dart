import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  double size;
  String sometxt;
  MyText({Key? key, required this.sometxt,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sometxt,
      style: TextStyle(
          fontSize: size,
          color: Colors.white
      ),
    );
  }
}