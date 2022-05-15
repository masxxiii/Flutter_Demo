abstract class MainScreenState{}

class MainScreenInitSumSquareCalculationState extends MainScreenState{}

class MainScreenUpdateSumSquareCalculationState extends MainScreenState {
  final num value;

  MainScreenUpdateSumSquareCalculationState({required this.value});
}