
abstract class CounterRepository{
  Future<int> proccess(int value);
}

class CounterService extends CounterRepository {

  @override
  Future<int> proccess(int value) async {
    return value + 1;
  }
}