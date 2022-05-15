import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitSumSquareCalculationState());

  void squareCalculation(a,b) {
    num value = 0.0;
    value = (pow(a,2)) + (pow(b,2)) + 2 * a * b;

    emit(MainScreenUpdateSumSquareCalculationState(value: value));
  }

  void initState() {
    emit(MainScreenInitSumSquareCalculationState());
  }
}