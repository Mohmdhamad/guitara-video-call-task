
import 'package:flutter/material.dart';
import 'package:tasks/core/style/colors.dart';

TextStyle titleStyle({
  Color color = AppColors.black,
  double textSize = 22.0,
}){
  return TextStyle(
    color: color,
    fontSize: textSize,
    fontWeight: FontWeight.bold,
  );
}
TextStyle bodyStyle({
  Color color = AppColors.black,
  double textSize = 19.0,
}){
  return TextStyle(
    color: color,
    fontSize: textSize,
    fontWeight: FontWeight.w500,
  );
}

TextStyle hashStyle({
  Color color = AppColors.grey,
  double textSize = 14.0,
}){
  return TextStyle(
    color: color,
    fontSize: textSize,
  );
}
