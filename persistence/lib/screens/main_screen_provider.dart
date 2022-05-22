import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubit/main_screen_cubit.dart';
import 'main_screen.dart';

class MainScreenProvider extends StatelessWidget {
  const MainScreenProvider({Key? key}) : super(key: key);
  static late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    init();
    return BlocProvider<MainScreenCubit>(
      create: (context) => MainScreenCubit(),
      child: const MainScreen(),
    );
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }
}