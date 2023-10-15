import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/view_model/utils/colors.dart';


class Functions {
  static Future<bool?> showToast({required String message, Color? background}){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM ,
      timeInSecForIosWeb: 2,
      backgroundColor: background ?? AppColors.Background,
      textColor: AppColors.White,
      fontSize: 16.0
  );
 }
}
