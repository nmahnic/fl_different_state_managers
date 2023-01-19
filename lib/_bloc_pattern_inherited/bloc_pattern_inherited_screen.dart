import './main_bloc_inherited.dart';
import 'package:fl_provider_or_bloc/common/count_use_case.dart';
import 'package:fl_provider_or_bloc/common/counter_service.dart';
import 'package:flutter/material.dart';

class BlocPatternInheritedScreen extends StatelessWidget {
  const BlocPatternInheritedScreen({Key? key,}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return _CounterInherited(
      child: const _BlocPatternInheritedScreenContent()
    );
  }
}

class _BlocPatternInheritedScreenContent extends StatelessWidget {
  const _BlocPatternInheritedScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = _CounterInherited.of(context).bloc;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern"),
      ),
      body: const _BlocPatternBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await bloc.increment(bloc.counter),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _BlocPatternBody extends StatelessWidget {
  const _BlocPatternBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = _CounterInherited.of(context).bloc;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed the button this many times:',),
          AnimatedBuilder(
            animation: bloc,
            builder:(context, _) { 
              return Text(
                '${bloc.counter}',
                style: Theme.of(context).textTheme.headline4,
              );
            }
          ),
        ],
      ),
    );
  }
}

class _CounterInherited extends InheritedWidget {

  _CounterInherited({
    required Widget child, 
  }) : super(child: child);

  final MainBlocInherited bloc = MainBlocInherited(
    counterUseCase: CountUseCase(
      repository: CounterService()
    )
  );

  static _CounterInherited of(BuildContext context) => context
    .findAncestorWidgetOfExactType<_CounterInherited>()!;
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

}
