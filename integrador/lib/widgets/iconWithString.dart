import 'package:flutter/material.dart';

class IconWithString extends StatelessWidget {
  String text;

  IconData icon;

  Color color;

  IconWithString({Key? key, required this.text, required this.icon, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(icon, color: color,),
      ),
      Flexible(child: Text(text, style: TextStyle(color: color),))
    ],);
  }
}
