
import 'package:flutter/material.dart';

import '../common/count_use_case.dart';

class MainBlocInherited extends ChangeNotifier {

  final CountUseCase counterUseCase;

  MainBlocInherited({ required this.counterUseCase});

  int counter = 0;

  Future<void> increment(value) async {
    counter = await counterUseCase.increment(value);
    notifyListeners();
  }

}