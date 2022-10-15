import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.name,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.fontFamily,
  }) : super(key: key);
  final String name;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize ?? 24,
          fontFamily: fontFamily ?? '',
          color: color ?? Theme.of(context).textTheme.bodyText1!.color),
    );
  }
}
