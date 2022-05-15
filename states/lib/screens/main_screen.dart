import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/main_screen_cubit.dart';
import 'cubit/main_screen_state.dart';
import 'main_body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter States'),
          backgroundColor: Colors.deepPurple.shade200,
        ),
        body: BlocBuilder<MainScreenCubit, MainScreenState> (
            builder: (context, state) {
              if(state is MainScreenInitSumSquareCalculationState) {
                return const MainBody();
              }

              if(state is MainScreenUpdateSumSquareCalculationState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    const Text('Calculated result',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 200)),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Text(state.value.toString(),
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 40)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.deepPurple.shade200),
                      onPressed: (){
                        BlocProvider.of<MainScreenCubit>(context).initState();
                      }, child: const Text("Enter the values again"),)
                  ],
                );
              }
              return Container();
            }
        )
    );
  }
}