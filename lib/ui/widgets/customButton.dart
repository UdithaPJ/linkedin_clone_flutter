import 'package:flutter/material.dart';

Widget CustomButton({
  required String name,
  required String iconImage,
  required Color color,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
    ),
    child: Column(
      children: [
        Container(
          height: 20,
          width: 20,
          child: Image.asset(iconImage, color: color,),
        ),
        SizedBox(height: 5),
        Text(name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF666666),
          ),
        ),
      ],
    ),
  );
}