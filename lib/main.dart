import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasks/core/bloc/bloc_observer.dart';
import 'my_app.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}


