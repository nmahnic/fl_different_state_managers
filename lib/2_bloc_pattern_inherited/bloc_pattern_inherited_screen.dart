import '../common/dialog.dart';
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
  const _BlocPatternInheritedScreenContent({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern with InheritedWidget"),
      ),
      body: const _BlocPatternBody(),
      floatingActionButton: const _FloatingActionButton(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = _CounterInherited.of(context).bloc;

    bloc.addListener(() {
      if( (bloc.counter > 0) && ((bloc.counter % 5) == 0) ){
        customDialog(context);
      }
    });

    return FloatingActionButton(
      onPressed: () async => await bloc.increment(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
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
        children: [
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
