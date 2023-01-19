import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../common/count_use_case.dart';
import '../common/counter_service.dart';
import 'main_provider.dart';


class ProviderScreen extends StatelessWidget {
  const ProviderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider(
            counterUseCase: CountUseCase(
              repository: CounterService()
            )
          )
        ),
      ],
      child: const _ProviderContent(),
    );
  }
}

class _ProviderContent extends StatelessWidget {
  const _ProviderContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
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
    final provider = Provider.of<MainProvider>(context, listen: false);

    return FloatingActionButton(
      onPressed: () async => await provider.increment(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class _BlocPatternBody extends StatelessWidget {
  const _BlocPatternBody({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context, listen: true);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed the button this many times:',),
          Text(
            '${provider.counter}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
