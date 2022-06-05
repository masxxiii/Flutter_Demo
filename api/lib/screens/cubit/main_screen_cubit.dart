import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api/models/nasa.dart';
import 'package:api/requests/api.dart';
import 'package:api/screens/cubit/main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState>{
  MainScreenCubit() : super(NasaLoadingState());

  Future<void> loadData()async {
    try{
      Map<String, dynamic> apiData = await getNasaData();
      Nasa nasaData = Nasa.fromJson(apiData);
      emit(NasaLoadedState(data: nasaData));
      return;
    }catch(e){
      emit(NasaErrorState());
      return;
    }
  }

  void reload(){
    emit(NasaLoadingState());
  }

}