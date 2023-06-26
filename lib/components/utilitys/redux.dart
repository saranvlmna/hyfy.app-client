import 'package:redux/redux.dart';

// Define your actions
enum Actions { Increment }

// Define your reducer
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  return state;
}

// Define your state
class AppState {
  final int counter;
  AppState(this.counter);

  get value => null;
}

// Create your Redux store
final store = Store<AppState>(
  counterReducer as Reducer<AppState>,
  initialState: AppState(0),
);