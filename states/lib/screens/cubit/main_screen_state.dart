abstract class MainScreenState{}

class MainScreenInitSumSquareCalculationState extends MainScreenState{}

class MainScreenUpdateSumSquareCalculationState extends MainScreenState {
  final double value;

  MainScreenUpdateSumSquareCalculationState({required this.value});
}