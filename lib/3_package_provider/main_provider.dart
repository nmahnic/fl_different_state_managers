
import 'package:flutter/material.dart';

import '../common/count_use_case.dart';
import '../common/counter_service.dart';

class MainProvider extends ChangeNotifier {

  final counterUseCase = CountUseCase(
    repository: CounterService()
  );

  int counter = 0;

  Future<void> increment() async {
    counter = await counterUseCase.increment(counter);
    notifyListeners();
  }

}