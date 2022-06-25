abstract class MainScreenState{}

class MainScreenInitSumSquareCalculationState extends MainScreenState{}

class MainScreenUpdateSumSquareCalculationState extends MainScreenState {
  //variable to store final result
final num value;

  MainScreenUpdateSumSquareCalculationState({required this.value});
}
