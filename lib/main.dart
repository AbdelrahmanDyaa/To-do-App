import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/screens/splash/splash_screen.dart';
import 'package:todo_app/view_model/bloc/todo_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit(),),
      ],
      child:   MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        home: SplashScreen(),
      ),
    );
  }
}

