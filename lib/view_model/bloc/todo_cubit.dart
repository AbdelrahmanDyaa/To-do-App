import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view_model/bloc/todo_state.dart';
import '../../model/todo_model.dart';

class TodoCubit extends Cubit<TodoState>{

  TodoCubit() : super(TodoInitialState());
  static TodoCubit get(context)=> BlocProvider.of(context);

  List<ToDoModel>todos= [

  ];
  int currentIndex =0;

  void ChangeIndex(int index){
    currentIndex = index;

    titlecontroller.text = todos[index].title ?? '';
    descriptioncontroller.text = todos[index].description ?? '';
    firstdatecontroller.text = todos[index].startDate ?? '';
    lastdatecontroller.text = todos[index].endDate ?? '';

  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController firstdatecontroller = TextEditingController();
  TextEditingController lastdatecontroller = TextEditingController();

  // ignore: non_constant_identifier_names
   Future <void> AddTodo() async{
    ToDoModel todo = ToDoModel(
      title: titlecontroller.text,
      description: descriptioncontroller.text,
      startDate: firstdatecontroller.text,
      endDate: lastdatecontroller.text
    );
    todos.add(todo);
    Resetcontroller();
    emit(TodoAddState());
  }
  // ignore: non_constant_identifier_names
  void Resetcontroller (){
     titlecontroller.clear();
     descriptioncontroller.clear();
     firstdatecontroller.clear();
     lastdatecontroller.clear();
  }

  Future <void> EditToDo() async {
     todos[currentIndex].title = titlecontroller.text;
     todos[currentIndex].description = descriptioncontroller.text;
     todos[currentIndex].startDate = firstdatecontroller.text;
     todos[currentIndex].endDate = lastdatecontroller.text;
     Resetcontroller();
     currentIndex =0;
     emit(TodoEditState());
  }

  Future<void> DeleteToDo() async {
     todos.removeAt(currentIndex);
     emit(TodoDeleteState());
  }
}