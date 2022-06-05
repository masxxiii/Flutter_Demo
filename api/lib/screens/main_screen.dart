import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api/screens/cubit/main_screen_cubit.dart';
import 'package:api/screens/cubit/main_screen_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('NASA API DEMO'),
          backgroundColor: Colors.deepOrangeAccent
      ),
      body: BlocBuilder<MainScreenCubit, MainScreenState>(
          builder: (context, state) {
            if(state is NasaLoadingState){
              BlocProvider.of<MainScreenCubit>(context).loadData();
              return const Center(child: CircularProgressIndicator());
            }
            if(state is NasaLoadedState){
              return ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: state.data.photos!.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 150,
                        width: 150,
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              border: Border.all(
                                color: Colors.orangeAccent,
                                width: 2,
                              ), borderRadius: BorderRadius.circular(25)


                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    color: Colors.orangeAccent,
                                  ),
                                  child: Image.network(
                                      state.data.photos![index].imgSrc!,
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.fill
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.only(top: 13, left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Sol: ${state.data.photos![index].sol!}", style: const TextStyle(fontStyle: FontStyle.italic,color: Colors.orangeAccent,fontWeight: FontWeight.bold)),
                                      Text("Earth date: ${state.data.photos![index].earthDate!}", style: const TextStyle(fontStyle: FontStyle.italic,color: Colors.orangeAccent,fontWeight: FontWeight.bold)),
                                      Text("Camera ${state.data.photos![index].camera!.roverId}: ${state.data.photos![index].camera!.name!}", style: const TextStyle(fontStyle: FontStyle.italic,color: Colors.orangeAccent,fontWeight: FontWeight.bold)),
                                      Text("Rover ${state.data.photos![index].rover!.id!}: ${state.data.photos![index].rover!.name!}", style: const TextStyle(fontStyle: FontStyle.italic,color: Colors.orangeAccent,fontWeight: FontWeight.bold)),
                                      Text("Landing date: ${state.data.photos![index].rover!.landingDate!}", style: const TextStyle(fontStyle: FontStyle.italic,color: Colors.orangeAccent,fontWeight: FontWeight.bold)),
                                      Text("Launch date: ${state.data.photos![index].rover!.launchDate}", style: const TextStyle(fontStyle: FontStyle.italic,color: Colors.orangeAccent,fontWeight: FontWeight.bold)),
                                      Text("Status: ${state.data.photos![index].rover!.status!}", style: const TextStyle(fontStyle: FontStyle.italic,color: Colors.orangeAccent,fontWeight: FontWeight.bold)),
                                    ],
                                  ),)

                              ],
                            )
                        )
                    );
                  }
              );
            }
            if(state is NasaErrorState){
              return Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Couldn't connect to NASA"),
                        ElevatedButton(
                          onPressed: (){
                            BlocProvider.of<MainScreenCubit>(context).reload();
                          },
                          child: const Text("Please Try again"),
                        )
                      ]
                  )
              );
            }
            return Container();
          }),
    );
  }
}

