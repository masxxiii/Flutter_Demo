import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main_screen_provider.dart';
import 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitSumSquareCalculationState());

  void squareCalculation(a,b) {
    num value = 0.0;
    value = (pow(a,2)) + (pow(b,2)) + 2 * a * b;
    save(a, b, value);

    emit(MainScreenUpdateSumSquareCalculationState(value: value));
  }

  void save(a, b, result) async {
    print('here');
    await MainScreenProvider.prefs.setDouble('a', a);
    await MainScreenProvider.prefs.setDouble('b', b);
    await MainScreenProvider.prefs.setDouble('result', result);
  }

  void initState() {
    emit(MainScreenInitSumSquareCalculationState());
  }
}