import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final color;
  final text;
  const GeneralButton({required this.color, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.056,
      width: size.width * 0.8,
      decoration: BoxDecoration(
         color: color,
        borderRadius: BorderRadius.circular(100)
      ),
     
      child: Center(
          child: Text(
        text,
        style:  TextStyle(color: Colors.white, fontSize: size.height*0.025),
      )),
    );
  }
}
