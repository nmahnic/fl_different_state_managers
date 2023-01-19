import 'package:fl_provider_or_bloc/1_bloc_pattern/main_bloc.dart';
import 'package:fl_provider_or_bloc/common/count_use_case.dart';
import 'package:fl_provider_or_bloc/common/counter_service.dart';
import 'package:flutter/material.dart';

import '../common/dialog.dart';

class BlocPatternScreen extends StatelessWidget {
  BlocPatternScreen({Key? key,}) : super(key: key);

  final MainBloc bloc = MainBloc(
    counterUseCase: CountUseCase(
      repository: CounterService()
    )
  );

  @override
  Widget build(BuildContext context) {

    bloc.addListener(() {
      if( (bloc.counter > 0) && ((bloc.counter % 5) == 0) ){
        customDialog(context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern"),
      ),
      body: _BlocPatternBody(bloc: bloc),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await bloc.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _BlocPatternBody extends StatelessWidget {
  const _BlocPatternBody({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final MainBloc bloc;

  @override
  Widget build(BuildContext context) {
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
