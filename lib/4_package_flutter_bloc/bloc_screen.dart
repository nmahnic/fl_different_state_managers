import 'package:fl_provider_or_bloc/common/dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'main_cubit_bloc.dart';


class BlocScreen extends StatelessWidget {
  const BlocScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubitBloc(), 
      child: const _BlocContent(),
    );
  }
}

class _BlocContent extends StatelessWidget {
  const _BlocContent({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Bloc"),
      ),
      body: const _BlocPatternBody(),
      floatingActionButton: const _FloatingActionButton(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MainCubitBloc>(context, listen: false);

    return FloatingActionButton(
      onPressed: () async => await bloc.increment(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class _BlocPatternBody extends StatelessWidget {
  const _BlocPatternBody({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocListener<MainCubitBloc, int>(
      listener: (context, state) => {
        if((state % 5) == 0){ customDialog(context)}
      },
      child: BlocBuilder<MainCubitBloc,int>(
        builder: (context, count){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:',),
              Text(
                '$count',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        );
        }),
    );
  
  }
}
