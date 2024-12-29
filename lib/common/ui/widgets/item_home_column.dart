import 'package:flutter/material.dart';

class ItemHomeColumn extends StatelessWidget {
  final TextStyle textStyle;
  final String icon, text;
  const ItemHomeColumn({super.key, required this.textStyle, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
        icon,
          width: 90,
          height: 90,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
         text,
         textAlign: TextAlign.center,
          style: textStyle,
        )
      ],
    );
  }
}
