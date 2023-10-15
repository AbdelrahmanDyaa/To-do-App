import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/view/component/widget/custom_text_form_field.dart';
import 'package:todo_app/view_model/bloc/todo_cubit.dart';
import '../../view_model/utils/colors.dart';
import '../../view_model/utils/function.dart';
import '../component/widget/text_custom.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = TodoCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Background,
        title: const TextCustom(
          text: 'Edit Add',
          fontWeight: FontWeight.bold,
          fontsize: 20,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: cubit.formkey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        labelText: 'title',
                        controller: cubit.titlecontroller,
                        icon: Icons.title_outlined,
                        mainColor: AppColors.Pink,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        labelText: 'description',
                        controller: cubit.descriptioncontroller,
                        icon: Icons.description,
                        mainColor: AppColors.Pink,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        labelText: 'start Date',
                        controller: cubit.firstdatecontroller,
                        icon: Icons.calendar_month,
                        mainColor: AppColors.Pink,
                        keyboardType: TextInputType.none,
                        readOnly: true,
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020, 6, 21),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365 * 10),
                              )).then((value) => {
                                if (value != null)
                                  {
                                    cubit.firstdatecontroller.text =
                                        DateFormat.yMMMd().format(value),
                                  }
                              });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        labelText: 'last Date',
                        icon: Icons.calendar_month,
                        controller: cubit.lastdatecontroller,
                        mainColor: AppColors.Pink,
                        readOnly: true,
                        keyboardType: TextInputType.none,
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020, 6, 21),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365 * 10),
                              )).then((value) => {
                                if (value != null)
                                  {
                                    cubit.lastdatecontroller.text =
                                        DateFormat.yMMMd().format(value),
                                  }
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () {
                            if (cubit.formkey.currentState!.validate()) {
                              cubit.EditToDo().then((value) => {
                               Functions.showToast(
                                    message: 'Task Edited Successfully',
                                  background: AppColors.Pink,
                                ),
                                    Navigator.pop(context),
                                  });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.Background,
                              minimumSize: const Size(double.infinity, 65),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          child: const TextCustom(
                            text: 'Edit',
                            fontWeight: FontWeight.bold,
                            fontsize: 20,
                          )),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if (cubit.formkey.currentState!.validate()) {
                                cubit.DeleteToDo().then((value) => {
                                Functions.showToast(
                                      message: 'Task Deleted Successfully',
                                    background: AppColors.Red
                                  ),

                                  Navigator.pop(context),
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.Red,
                                minimumSize: const Size(double.infinity, 65),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            child: const TextCustom(
                              text: 'Delete',
                              fontWeight: FontWeight.bold,
                              fontsize: 20,
                            )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
