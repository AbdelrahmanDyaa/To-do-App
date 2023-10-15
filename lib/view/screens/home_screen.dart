import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/view/component/todo/todo_custom.dart';
import 'package:todo_app/view/component/widget/text_custom.dart';
import 'package:todo_app/view/screens/todo_add_screen.dart';
import 'package:todo_app/view/screens/todo_edit_screen.dart';
import 'package:todo_app/view_model/bloc/todo_cubit.dart';
import 'package:todo_app/view_model/bloc/todo_state.dart';
import 'package:todo_app/view_model/utils/colors.dart';
import 'package:todo_app/view_model/utils/images.dart';
import 'package:todo_app/view_model/utils/navigaion.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Background,
        title: const TextCustom(
          text: 'To Do',
          fontWeight: FontWeight.bold,
          fontsize: 20,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<TodoCubit,TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return Visibility(
            visible: cubit.todos.isNotEmpty,
            replacement: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                  children: [
                Lottie.network(
                  AppImage.empty,
                  width: 250,
                ),
                    const SizedBox(height: 15,),
                    const TextCustom(
                        text: 'No Tasks Added Yet!',
                      color: AppColors.Black,
                      fontWeight: FontWeight.bold,
                      fontsize: 25,
                    ),

              ]),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                return ToDoWidget(
                  todo: cubit.todos[index],
                  onTap: (){
                    cubit.ChangeIndex(index);
                    Navigation.Push(context, const EditScreen());
                  }

                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: cubit.todos.length,
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigation.Push(context, const AddScreen());
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.Background,
        child: const Icon(
          Icons.add,
          color: AppColors.White,
        ),
      ),
    );
  }
}
