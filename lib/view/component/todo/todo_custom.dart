import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';

import '../../../view_model/utils/colors.dart';
import '../widget/text_custom.dart';

class ToDoWidget extends StatelessWidget {
  final ToDoModel todo;
  void Function()? onTap;
    ToDoWidget(  {  this.onTap,required this.todo,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.Pink,
              width: 2,
            )),
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustom(
              text: todo.title ?? '',
              color: AppColors.Black,
              fontsize: 20,
            ),
           // if(todo.description != null)
            Visibility(
              visible: todo.description != null,
              child: TextCustom(
                text: todo.description ?? '',
                color: AppColors.Background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
