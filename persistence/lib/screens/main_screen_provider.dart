import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/main_screen_cubit.dart';
import 'main_screen.dart';

class MainScreenProvider extends StatelessWidget {
  const MainScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenCubit>(
      create: (context) => MainScreenCubit(),
      child: const MainScreen(),
    );
  }
}