import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/service/vc_service.dart';
import 'features/home/view/screen/home_screen.dart';
import 'features/home/view_model/cubit/app_cubit.dart';
import 'features/video_call_screen/view_model/cubit/vc_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactsCubit()),
        BlocProvider(create: (context) => VideoCallCubit(VideoService())),
      ],
      child: MaterialApp(
        title: 'Video Call App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xFFF9F1F8),
        ),
        home: ContactsScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
