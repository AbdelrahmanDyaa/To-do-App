import 'package:flutter/material.dart';

import '../../../view_model/utils/colors.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
   final TextEditingController? controller;
   final Color? mainColor;
   final TextInputType? keyboardType;
   final TextInputAction? textInputAction;
   void Function()? onTap;
   bool? readOnly;
   final  String? labelText;
   final IconData? icon;



   TextFormFieldWidget({
     this.onTap,
     this.controller,
     this.keyboardType = TextInputType.text,
     this.mainColor = AppColors.Pink,
     this.readOnly = false,
     this.textInputAction = TextInputAction.next,
     this.labelText,
     this.icon,
     super.key,
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: mainColor,
      controller:controller,
      keyboardType:keyboardType ,
      textInputAction: textInputAction,
      onTap:onTap ,
      readOnly:readOnly ?? false ,

      decoration: InputDecoration(
        prefixIcon: icon != null ?  Icon(
          icon,
          color: AppColors.Pink,
        ) : null,
        labelText: labelText,
        focusColor: AppColors.Pink,
        floatingLabelStyle: const TextStyle(
          color: AppColors.Pink,
        ),


        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.Background,
              width: 1,
            )

        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.Pink ,
              width: 2,
            )

        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 1,
            )

        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.Red,
              width: 2,
            )

        ),
      ),

    );
  }
}
