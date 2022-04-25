import 'package:flutter/material.dart';

class TextEnter extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const TextEnter({ 
   required this.controller,
   required this.hintText,
    Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.056,
      width: size.width*0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xfffeb808)),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
        
          SizedBox(
            width: size.width*0.6,
            child: TextField(
              autocorrect: false,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}