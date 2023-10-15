import 'package:flutter/material.dart';
import '../../../view_model/utils/colors.dart';

class TextCustom extends StatelessWidget {

  final String text;
  final FontWeight? fontWeight;
  final double? fontsize;
  final Color? color;

    const TextCustom({
    super.key,
    required this.text,
    this.fontsize,
    this.fontWeight,
    this.color,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color,
      ),

    );
  }
}