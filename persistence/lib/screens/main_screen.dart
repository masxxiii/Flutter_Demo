import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/main_screen_cubit.dart';
import 'cubit/main_screen_state.dart';
import 'main_body.dart';
import 'main_screen_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Shared Preferences'),
          actions: <Widget>[IconButton(
            icon: const Icon(Icons.storage_rounded),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder:(context) => PreferenceView()));
            },
          )],
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

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shared Preferences"),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Text('A: ${MainScreenProvider.prefs.getDouble('a')}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('B: ${MainScreenProvider.prefs.getDouble('b')}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Result: ${MainScreenProvider.prefs.getDouble('result')}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )

        )
    );
  }
}