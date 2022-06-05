import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main_screen_provider.dart';
import 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitSumSquareCalculationState());

  void squareCalculation(a,b) {
    num value = 0.0;
    value = (pow(a,2)) + (pow(b,2)) + 2 * a * b;
    save(value);

    emit(MainScreenUpdateSumSquareCalculationState(value: value));
  }

  void save(result) async {
    var results = MainScreenProvider.prefs.getStringList('calc');

    results!.insert(0, result.toString());
    await MainScreenProvider.prefs.setStringList('calc', results);
  }

  void initState() {
    emit(MainScreenInitSumSquareCalculationState());
  }
}