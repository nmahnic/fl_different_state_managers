
import 'package:fl_provider_or_bloc/common/counter_service.dart';

class CountUseCase {
  CountUseCase({
    required this.repository
  });

  CounterRepository repository;

  Future<int> increment(int value) async {
    return repository.proccess(value);
  }
}