import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/count_use_case.dart';
import '../common/counter_service.dart';

class MainCubitBloc extends Cubit<int> {

  final counterUseCase = CountUseCase(
    repository: CounterService()
  );

  MainCubitBloc() : super(0);

  Future<void> increment() async {
    final counter = await counterUseCase.increment(state);
    emit(counter);
  }

}