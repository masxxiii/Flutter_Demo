import 'package:api/models/nasa.dart';

abstract class MainScreenState{}

class NasaLoadingState extends MainScreenState{}

class NasaLoadedState extends MainScreenState{
  Nasa data;
  NasaLoadedState({required this.data});
}

class NasaErrorState extends MainScreenState{}